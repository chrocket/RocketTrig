//++++++++++++++++++++++++//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++d
// rf65/rf95 (lora) RocketTrig
// https://github.com/chrocket/RemoteCameraTrigger
// By Curtis Heisey
// For use with Adafruit 3176 (RFM69( or Adafruit 3178 (LoRo RFM95) Feather M0 Packet radio modules
//  SX1276 LoRa® 
//
// Requires RadioHead libs
// https://www.airspayce.com/mikem/arduino/RadioHead/index.html
// Download from Adafruit https://cdn-learn.adafruit.com/assets/assets/000/035/106/original/RadioHead-1.62.zip?1472068723
// Using (raw) unaddressed broadcast send
// Demonstrates the use of AES encryption, setting the frequency and modem 
// configuration

/* Libs
 *  LowPowerLab/RFM69  (Download from Adfaruit).
 *  CRC32 by Christopher Baker  - install using Arduino IDE library manager
 *  */

 // Pick one module of the other

// #define MODULE_RFM69
// #undef MODULE_RFM95

 #undef MODULE_RFM69
 #define MODULE_RFM95

#include <SPI.h>


  #define RFM69_CS      8
  #define RFM69_INT     3
  #define RFM69_RST     4
 #define LED_PIN           13
  
// Singleton instance of the radio driver
#if defined(MODULE_RFM69)

 
  #include <RH_RF69.h>
  RH_RF69 radio_m0(RFM69_CS, RFM69_INT);  // Adafruit 3176
  #define MAX_MESSAGE_LEN RH_RF69_MAX_MESSAGE_LEN
#else
  #include <RH_RF95.h>
  #define RFM95_CS 8
  #define RFM95_RST 4
  #define RFM95_INT 3
   RH_RF95 radio_m0(RFM95_CS, RFM95_INT);  // Adafruit 3178
   #define MAX_MESSAGE_LEN RH_RF95_MAX_MESSAGE_LEN
#endif

// Library https://github.com/ridencww/cww_MorseTx
// arduino lib manager "CWW Morse Transmit" by Ralph Iden
#include <cww_MorseTx.h>

#include <CRC32.h>
// https://github.com/bakercp/CRC32/blob/master/examples/CRC32/CRC32.ino

void printChipId(char *buf) {
  volatile uint32_t val1, val2, val3, val4;
  volatile uint32_t *ptr1 = (volatile uint32_t *)0x0080A00C;
  val1 = *ptr1;
  volatile uint32_t *ptr = (volatile uint32_t *)0x0080A040;
  val2 = *ptr;
  ptr++;
  val3 = *ptr;
  ptr++;
  val4 = *ptr;

  

  sprintf(buf, "%8x%8x%8x%8x", val1, val2, val3, val4);
 
}

/************ Radio Setup ***************/

// ISM 33cm band USA 902-928 MHZ
#define FREQ 915.3
#define RF95_FREQ FREQ
#define RF69_FREQ FREQ



// inputs
const unsigned int LOWHIGH_TRIGGER_IN_PIN = 5; // If armed, Low to high transition will trigger
const unsigned int HIGHLOW_TRIGGER_IN_PIN=17;  // If armed, High to low transition will trigger
const unsigned int PUSH_IN_PIN=14; // Push button trigger override ("arm" does not have to be set)
const unsigned int ARM_IN_PIN=15;  // Push button to arm sensor
const unsigned int POLLREQUEST_IN_PIN=16;  // Push button to send roll call poll request to other nodes
const unsigned int DELAYMS_PIN=18;  // Pot on analog in to set delay 0-200 ms
const unsigned int SPARE_PIN=19;  // Reserved for future use

// outputs
// LED_OUT 13
const unsigned int BUZZER_OUT_PIN= 10;            // Pin to audible indicator
const unsigned int CAMERA_TRIGGER_OUT_PIN = 12;   // Pin for shtter opto-isoloatr
const unsigned int CAMERA_FOCUS_OUT_PIN = 11;     // Pin for focus opto-isolator
const unsigned int AUX_OUT_PIN = 9;               // Pin for 2nd trigger output
const unsigned int ARM_INDICATOR_OUT_PIN = 6;     // Indicates sensor is armed, turns laser on

const unsigned int  ON_TIME_MS = 2000 ;          // Camera bulb on time when trigger fires (typical vals 1-3 seconds)      
const unsigned int  SHORT_TIME_MS = 200;

#define TONE_FREQ 1000
#define CW_SPEED 5
cww_MorseTx morse(ARM_INDICATOR_OUT_PIN, CW_SPEED, BUZZER_OUT_PIN, TONE_FREQ);


uint32_t myId_i=0;
char myId[3]={'a','b','c'};
// Dont put this on the stack:
uint8_t buf[MAX_MESSAGE_LEN];
//uint8_t buf[RH_RF95_MAX_MESSAGE_LEN];
char radiopacket[5];

bool isArmed = false;

#if defined(ADAFRUIT_FEATHER_M0) // Feather M0 w/Radio
//TODO need to check for Adafruit Feather M0
#endif


unsigned long t_arm;



/*
 * NonBlockingTimer CLASS DEFINITION
 */
class NonBlockingTimer {
  protected:
    bool isPressed=LOW;
    unsigned long timeFireOn;
    unsigned long nextChangeTime = 0;
  private:
    NonBlockingTimer(){};
  public:
     NonBlockingTimer(unsigned int timeFireOnIn){
          timeFireOn=timeFireOnIn;     
     }
     void fire(){
      isPressed  = HIGH;
      unsigned long currentTime = millis();
      nextChangeTime = currentTime + timeFireOn;        
     }
    bool check() {
      unsigned long currentTime = millis();
      if(currentTime >= nextChangeTime) {
        isPressed = LOW;
      }
      
      return isPressed;
    }
    bool isBPressed(){
       return isPressed;    
    }
};
/*
 * FireTimer CLASS DEFINITION
 */
class FireTimer: public NonBlockingTimer{
  private:
    byte pinLED;

  public:
    FireTimer(byte pinLED, unsigned long timeLedOn):NonBlockingTimer(timeLedOn) {
      this->pinLED = pinLED;
      pinMode(pinLED, OUTPUT);
      isPressed=LOW;
    }
     void fire(){
      isPressed  = HIGH;
      digitalWrite(pinLED, isPressed);
      unsigned long currentTime = millis();
      nextChangeTime = currentTime + timeFireOn;        
     }

    
    // Checks whether it is time to turn on or off the Output
    bool check() {
      unsigned long currentTime = millis();
      if(currentTime >= nextChangeTime) {
          // Turn output off when time expires
          isPressed = LOW;

      }
       digitalWrite(pinLED, isPressed);
       return isPressed;    
    }

};

unsigned int unique_id(){
   // read unique CPU Id
  char bufId[33];
  printChipId(bufId);
  myId_i = CRC32::calculate(bufId, 32); // compute checksum
  Serial.print("My id = ");
  Serial.println(myId_i);
  myId_i = myId_i%1000;
  return myId_i;

  
}

// Definition of output triggers
FireTimer cameraTriggerTimer(CAMERA_TRIGGER_OUT_PIN, ON_TIME_MS );
FireTimer cameraTriggerTimerShort(CAMERA_TRIGGER_OUT_PIN, 50 );
FireTimer focusTrigger(CAMERA_FOCUS_OUT_PIN, ON_TIME_MS );

FireTimer auxTriggerTimer(AUX_OUT_PIN, SHORT_TIME_MS ); 
FireTimer txReceivedLEDTimer(LED_PIN, SHORT_TIME_MS ); 
// These timers used to debounce buttons
NonBlockingTimer pollNonBlockingPressed( SHORT_TIME_MS ); 
NonBlockingTimer armNonBlockingPressed( SHORT_TIME_MS ); 



void setup() 
{

 unsigned int myId_i = unique_id();
  sprintf(myId,"%3d",myId_i); 
 radiopacket[1]=myId[0];
 radiopacket[2]=myId[1];
 radiopacket[3]=myId[2]; 
 radiopacket[4]='N'; // isArmed

// Arm indicator LED
  pinMode(ARM_INDICATOR_OUT_PIN, OUTPUT);
  digitalWrite(ARM_INDICATOR_OUT_PIN, isArmed);
  pinMode(CAMERA_FOCUS_OUT_PIN, OUTPUT);
  digitalWrite(CAMERA_FOCUS_OUT_PIN, LOW);

// Define input pins
  pinMode(LOWHIGH_TRIGGER_IN_PIN,INPUT);
  pinMode(HIGHLOW_TRIGGER_IN_PIN,INPUT_PULLUP);
  pinMode(POLLREQUEST_IN_PIN, INPUT_PULLUP);
  pinMode(ARM_IN_PIN, INPUT_PULLUP);
  pinMode(PUSH_IN_PIN, INPUT_PULLUP); 
  pinMode(DELAYMS_PIN, INPUT);
  pinMode(SPARE_PIN, INPUT_PULLUP);

   Serial.begin(115200);
  // Uncomment to not start until serial console is attached (for debugging)
  /*
  while (!Serial) {
    delay(1);
  }
*/ 

  Serial.println("CWH Camera Trigger RFM69/RFM95 TXRX!");
  Serial.println();

    // RFM69 Reset pin definition   
#if defined(MODULE_RFM69)
  pinMode(RFM69_RST, OUTPUT);
  digitalWrite(RFM69_RST, LOW);
  
#else
   pinMode(RFM95_RST, OUTPUT);
  digitalWrite(RFM95_RST, HIGH);

#endif   
  




  morse.send("Hi");
  delay(100);
  // send out uniqueId
  morse.send( radiopacket[1] );
  morse.send( radiopacket[2] );
  morse.send( radiopacket[3] );
  delay(100);


  // manual reset
  
#if defined(MODULE_RFM69)
  digitalWrite(RFM69_RST, HIGH);
  delay(10);
  digitalWrite(RFM69_RST, LOW);
  delay(10);
  Serial.println("Using module RFM65");
#else
    Serial.println("Using module RFM95");

    
#endif   
  

  while (!radio_m0.init()) {
    Serial.println("LoRa radio init failed");
    Serial.println("Uncomment '#define SERIAL_DEBUG' in RH_RF95.cpp for detailed debug info");
    while (1);
  }
  Serial.println("LoRa radio init OK!");

  // Defaults after init are 434.0MHz, modulation GFSK_Rb250Fd250, +13dbM
  if (!radio_m0.setFrequency(FREQ)) {
    Serial.println("setFrequency failed");
    while (1);
  }
  Serial.print("Set Freq to: "); Serial.println(FREQ);
  


  // If you are using a high power RF69 eg RFM69HW, you *must* set a Tx power with the
  // ishighpowermodule flag set like this:
 #if defined(MODULE_RFM69)
     radio_m0.setTxPower(20, true);  // range from 14-20 for power, 2nd arg must be true for 69HCW 
  #else
      radio_m0.setTxPower(23, false);   
  #endif
  



  // The encryption keyhas to be the same as the one in the server
  uint8_t key[] = { 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
                    0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08};
#if defined(MODULE_RFM69)
 radio_m0.setEncryptionKey(key);
#else
// no encryption
#endif
 
  

  Serial.print("RFM69/95 radio @");  Serial.print((int)FREQ);  Serial.println(" MHz");
   tone(BUZZER_OUT_PIN, 100 /* hz*/, 2000 /* ms */);

}




void loop() {

     // Update timer values
    cameraTriggerTimer.check();
    auxTriggerTimer.check();
    txReceivedLEDTimer.check();
    pollNonBlockingPressed.check();
    armNonBlockingPressed.check();
    cameraTriggerTimerShort.check();
    focusTrigger.check();

    // Read delay pot value
    int delayms = analogRead(DELAYMS_PIN);

   // TRIGGER OVERRIDE PB
   // If user presses "fire" push button, it will trigger outputs
   // This overrides any sensor values;  "isArmed" does not have to be set
   if(   !digitalRead(PUSH_IN_PIN)    ){     
      // fire outputs
      focusTrigger.fire();    
      cameraTriggerTimer.fire();
      auxTriggerTimer.fire();
             
     // Trigger destination nodes
     radiopacket[0]= 'T';     
     radio_m0.send((uint8_t *)radiopacket, strlen(radiopacket));
     radio_m0.waitPacketSent();   
     
     Serial.print("PB Trigger Override, Sending Trigger out "); Serial.println(radiopacket);
      // clear isArmed flag state variable
      isArmed = false;
      radiopacket[4]='N';
   }

  // SENSOR TRIGGER INPUT
  // If armed and get a sensor trigger
  // fire things and send a T out
  // set isArmed to false
  if( isArmed && 
    (digitalRead(LOWHIGH_TRIGGER_IN_PIN) || !digitalRead(HIGHLOW_TRIGGER_IN_PIN))
    ){

      
      // fire outputs
      focusTrigger.fire();
      cameraTriggerTimer.fire();
      auxTriggerTimer.fire();

      // clear isArmed flag state variable
      isArmed = false;
      radiopacket[4]='N';
      
    // Trigger destination nodes
     radiopacket[0]= 'T';  
     
     radio_m0.send((uint8_t *)radiopacket, strlen(radiopacket)); 
     radio_m0.waitPacketSent();
     radio_m0.send((uint8_t *)radiopacket, strlen(radiopacket)); // send twice
     radio_m0.waitPacketSent();
     Serial.print("Sensor Trigger - Sending T command ");Serial.println(radiopacket);    
  }

   // POLL REQUEST PB
   // send out a message for Rx to echo their IDs
  if(   !digitalRead(POLLREQUEST_IN_PIN)  &&  
     !pollNonBlockingPressed.isBPressed()  ){

       // Poll requeset to destination nodes
       radiopacket[0]= 'P';      
       radio_m0.send((uint8_t *)radiopacket, strlen(radiopacket));
       radio_m0.waitPacketSent();
       Serial.print("Poll request PB, sending roll call request "); Serial.println(radiopacket);
       cameraTriggerTimerShort.fire(); // fire camera briefly
       pollNonBlockingPressed.fire();
        tone(BUZZER_OUT_PIN, 1000 /* hz*/, 200 /* ms */);
   }
      
  // ARM PB
  // Send arm message out
  // set isArm flag to true
  if(  !digitalRead(ARM_IN_PIN) &&
   !armNonBlockingPressed.isBPressed()  ){
   
      isArmed = true;
      radiopacket[0]= 'A';
      radio_m0.send((uint8_t *)radiopacket, strlen(radiopacket));
      radio_m0.waitPacketSent();
      
     t_arm = millis();
     Serial.print("Arm PB,  Sending Arm command ");Serial.print(t_arm); Serial.print(" "); Serial.println(radiopacket);
     tone(BUZZER_OUT_PIN, 100 /* hz*/, 100 /* ms */);
     armNonBlockingPressed.fire();

  }
  digitalWrite(ARM_INDICATOR_OUT_PIN, isArmed);
  digitalWrite(CAMERA_FOCUS_OUT_PIN, isArmed);

 // Receive commands    
 if (radio_m0.available())
  {
    uint8_t len = sizeof(buf);
    if (radio_m0.recv(buf, &len)) {
      if (!len) return;
     // buf[len] = 0;
      buf[5] = 0;
      /*
      Serial.print("Received [");
      Serial.print(len);
      Serial.print("]: ");
      Serial.println((char*)buf);
      Serial.print("RSSI: ");
      Serial.println(radio_m0.lastRssi(), DEC);
*/

    txReceivedLEDTimer.fire(); // blink the LED indicating a tx received

    // arm command
    if (strstr((char *)buf, "A")) {
           isArmed = true;    
           t_arm = millis();
           Serial.print("Received arm command ");Serial.print(t_arm); Serial.print(" "); Serial.println((char*)buf);  
           radiopacket[4]='Y';
           tone(BUZZER_OUT_PIN, 100 /* hz*/, 100 /* ms */);
      }
    // trigger command
    if (strstr((char *)buf, "T")) {            
            // fire outputs   
            focusTrigger.fire();  
            cameraTriggerTimer.fire();
            auxTriggerTimer.fire(); 
            unsigned long t_got_trigger = millis();
            unsigned long latency = t_got_trigger - t_arm;
            Serial.print("Got Trigger  ");Serial.print(latency); Serial.print(" "); Serial.println((char*)buf);    
            tone(BUZZER_OUT_PIN, 450 /* hz**/, SHORT_TIME_MS /* ms */); 
            // clear isArmed flag state variable
            isArmed = false;
            radiopacket[4]='N';                     
      }
      // poll request
      if (strstr((char *)buf, "P")) {   
            Serial.println("Received request for poll, sending id back"); 
            radiopacket[0]= 'R'; 

 
            delay(  myId_i );
            radio_m0.send((uint8_t *)radiopacket, strlen(radiopacket));
            radio_m0.waitPacketSent();  

                  
           cameraTriggerTimerShort.fire();
      }
      // poll response back from poll request
      if (strstr((char *)buf, "R")) { 
        Serial.print("Got an id response back: ");
        Serial.print((char*)buf);
        Serial.print(", RSSI: ");
        Serial.println(radio_m0.lastRssi(), DEC);
        tone(BUZZER_OUT_PIN, 1500 /* hz*/, 100 /* ms */);
      }

    } 
  }// end Rx loop
}// end loop
