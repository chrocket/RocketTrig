// rf65/rf95 (lora) RocketTrig
// This version is a 1ch remote launcher using Rev 4_2 board

// Connections
// J7 position 2 - arm pushbutton
// J7 position 3 - clear pushbutton
// J7 position 4 - fire pushbutton
// J7 podiyion 6 - local (launch fire) /remote (sensor in) camera trigger
//
// J8 position 2  - LED armed indicator
// J8 position 3 - fire relay
// J8 position 4 - remote node in contact (poll received)

#include <Wire.h>
//MCP23017 lib by Bertand Lemasle - install using Arduino IDE library manager
#include <MCP23017.h>



// https://github.com/chrocket/RemoteCameraTrigger
// By Curtis Heisey
// For use with Adafruit 3176 (RFM69( or Adafruit 3178 (LoRo RFM95) Feather M0 Packet radio modules
//  SX1276 LoRa®
//
// Requires RadioHead libs - - install using Arduino IDE library manager
// https://www.airspayce.com/mikem/arduino/RadioHead/index.html
// Using ver 1.122.1  http://www.airspayce.com/mikem/arduino/RadioHead/RadioHead-1.122.zip
#include <RadioHead.h>

// Other libs
//CRC32 by Christopher Baker  - install using Arduino IDE library manager
#include <CRC32.h>
// https://github.com/bakercp/CRC32/blob/master/examples/CRC32/CRC32.ino

// But ensure you have installed the Crypto directory from arduinolibs first:
// http://rweather.github.io/arduinolibs/index.html



#define MCP23017_ADDR 0x20
MCP23017 mcp = MCP23017(MCP23017_ADDR);

#if defined(ARDUINO_SAMD_ZERO) && defined(SERIAL_PORT_USBVIRTUAL)
  // Required for Serial on Zero based boards
  #define Serial SERIAL_PORT_USBVIRTUAL
#endif


// pin assignments
const unsigned int BUZZER_OUT_PIN = 10;          // Pin to audible indicator
const unsigned int CAMERA_TRIGGER_OUT_PIN = 12;  // Pin for shtter opto-isoloatr
const unsigned int CAMERA_FOCUS_OUT_PIN = 11;    // Pin for focus opto-isolator
const unsigned int LED_OUT_PIN = 13;
const unsigned int ARM_OUT_PIN = 0; //MCP23017Pin::GPA0
const unsigned int RELAY_OUT_PIN = 1; //MCP23017Pin::GPA1
const unsigned int REMOTE_NODE_IN_CONTACT_LED = 2; //MCP23017Pin::GPA2
const unsigned int FIRE_INDICATOR_OUT_PIN = 24;
const unsigned int ARM_INDICATOR_OUT_PIN = 22; 
const unsigned int OUT_1=10;
const unsigned int OUT_2=17;


// Radio module stuff
// Pick one module of the other

// #define MODULE_RFM69
// #undef MODULE_RFM95

#undef MODULE_RFM69
#define MODULE_RFM95

#include <SPI.h>


#define RFM69_CS 8
#define RFM69_INT 3
#define RFM69_RST 4
#define LED_PIN 13

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

// ISM 33cm band USA 902-928 MHZ
#define FREQ 915.3
#define RF95_FREQ FREQ
#define RF69_FREQ FREQ



/*
 * NonBlockingTimer CLASS DEFINITION
 */
class NonBlockingTimer {
protected:
  bool isPressed = LOW;
  unsigned long timeFireOn;
  unsigned long nextChangeTime = 0;
private:
  NonBlockingTimer(){};
public:
  NonBlockingTimer(unsigned int timeFireOnIn) {
    timeFireOn = timeFireOnIn;
  }
  void fire() {
    isPressed = HIGH;
    unsigned long currentTime = millis();
    nextChangeTime = currentTime + timeFireOn;
  }
  bool check() {
    unsigned long currentTime = millis();
    if (currentTime >= nextChangeTime) {
      isPressed = LOW;
    }

    return isPressed;
  }
  bool isBPressed() {
    return isPressed;
  }
  void clear() {
    unsigned long currentTime = millis();
    nextChangeTime = currentTime;
    isPressed = LOW;
  }
  void init() {

    nextChangeTime = 4294967294;
  }
};


/*
 * FireTimer CLASS DEFINITION
 */
class FireTimer : public NonBlockingTimer {
private:
  byte pinLED;

public:
  FireTimer(byte pinLED, unsigned long timeLedOn)
    : NonBlockingTimer(timeLedOn) {
    this->pinLED = pinLED;
    pinMode(pinLED, OUTPUT);
    digitalWrite(pinLED, LOW);
    isPressed = LOW;
  }
  void fire() {
    isPressed = HIGH;
    digitalWrite(pinLED, isPressed);
    unsigned long currentTime = millis();
    nextChangeTime = currentTime + timeFireOn;
  }


  // Checks whether it is time to turn on or off the Output
  bool check() {
    unsigned long currentTime = millis();
    if (currentTime >= nextChangeTime) {
      // Turn output off when time expires
      isPressed = LOW;
    }
    digitalWrite(pinLED, isPressed);
    return isPressed;
  }
};




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

char myId[3] = { 'a', 'b', 'c' };
// Dont put this on the stack:
uint8_t buf[MAX_MESSAGE_LEN];
//uint8_t buf[RH_RF95_MAX_MESSAGE_LEN];
char radiopacket[5];



unsigned int unique_id() {
  // read unique CPU Id
  char bufId[33];
  printChipId(bufId);
  unsigned int myId_i = CRC32::calculate(bufId, 32);  // compute checksum
  Serial.print("My id = ");
  Serial.println(myId_i);
  myId_i = myId_i % 1000;
  return myId_i;
}
void radioInit() {
  unsigned int myId_i = unique_id();
  sprintf(myId, "%3d", myId_i);
  radiopacket[1] = myId[0];
  radiopacket[2] = myId[1];
  radiopacket[3] = myId[2];
  radiopacket[4] = 'N';  // isArmed

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
    while (1)
      ;
  }
  Serial.println("LoRa radio init OK!");

  // Defaults after init are 434.0MHz, modulation GFSK_Rb250Fd250, +13dbM
  if (!radio_m0.setFrequency(FREQ)) {
    Serial.println("setFrequency failed");
    while (1)
      ;
  }
  Serial.print("Set Freq to: ");
  Serial.println(FREQ);



  // If you are using a high power RF69 eg RFM69HW, you *must* set a Tx power with the
  // ishighpowermodule flag set like this:
#if defined(MODULE_RFM69)
  radio_m0.setTxPower(20, true);  // range from 14-20 for power, 2nd arg must be true for 69HCW
#else
  radio_m0.setTxPower(23, false);
#endif




  // The encryption keyhas to be the same as the one in the server
  uint8_t key[] = { 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
                    0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08 };
#if defined(MODULE_RFM69)
  radio_m0.setEncryptionKey(key);
#else
// no encryption
#endif
}


// state variables for commands received by radio
bool isRadioArmRequest = false;
bool isRadioDisarmRequest = false;
bool isRadioTriggerRequest  = false;
bool isRadioFireRequest  = false;

void radioSendPoll() {
  // Poll requeset to destination nodes
  radiopacket[0] = 'P';
  radio_m0.send((uint8_t *)radiopacket, strlen(radiopacket));
  radio_m0.waitPacketSent();
}
void radioSendCameraTrigger() {
  // Trigger destination nodes
  radiopacket[0] = 'T';
  radio_m0.send((uint8_t *)radiopacket, strlen(radiopacket));
  radio_m0.waitPacketSent();
}
void radioSendArmedCommand() {
  radiopacket[0] = 'A';
  radio_m0.send((uint8_t *)radiopacket, strlen(radiopacket));
  radiopacket[4] = 'Y';
  radio_m0.waitPacketSent();

}
void radioSendDisarmCommand() {
  radiopacket[0] = 'D';
  radio_m0.send((uint8_t *)radiopacket, strlen(radiopacket));
  radiopacket[4] = 'N';
  radio_m0.waitPacketSent();
  
}
void radioSendFireCommand() {
  // Trigger destination nodes
  radiopacket[0] = 'F';
  radio_m0.send((uint8_t *)radiopacket, strlen(radiopacket));
  radio_m0.waitPacketSent();
}
void pollResponse(){
       Serial.print("Got an id response back: ");
        Serial.print((char*)buf);
        Serial.print(", RSSI: ");
        Serial.println(radio_m0.lastRssi(), DEC);
        tone(BUZZER_OUT_PIN, 1500 /* hz*/, 100 /* ms */);
  
}


const unsigned int ARMED_TIMED = 60000;  // 10-15 s // 11/19/23 changed to 60 s
const unsigned int FIRE_TIME = 2000;     // 2 s
const unsigned int POLL_TIME = 200;
const unsigned int POLL_INTERVAL = 3000;

FireTimer armed(ARM_INDICATOR_OUT_PIN, ARMED_TIMED);
FireTimer cameraTrigger(CAMERA_TRIGGER_OUT_PIN, FIRE_TIME);
FireTimer focusTrigger(CAMERA_FOCUS_OUT_PIN, FIRE_TIME);
FireTimer fireRelay(FIRE_INDICATOR_OUT_PIN, FIRE_TIME);
NonBlockingTimer remoteNodeInContact(POLL_INTERVAL); // fires if poll response received
NonBlockingTimer pollInterval(POLL_INTERVAL); // sends out a poll request




#if defined(ADAFRUIT_FEATHER_M0)  // Feather M0 w/Radio
//TODO need to check for Adafruit Feather M0
#endif
void setup() {
#ifdef DEBUG
  while (!Serial) { } // wait for serial port to connect.
#endif
   Wire.begin();

  Serial.begin(19200);

  // output pins
  pinMode(CAMERA_TRIGGER_OUT_PIN, OUTPUT);
  pinMode(CAMERA_FOCUS_OUT_PIN, OUTPUT);
  pinMode(LED_OUT_PIN, OUTPUT);
  

 // initial output states
  digitalWrite(CAMERA_TRIGGER_OUT_PIN, LOW);
  digitalWrite(CAMERA_FOCUS_OUT_PIN, LOW);
  digitalWrite(LED_OUT_PIN, LOW);
 

  // input pin assignments for push buttons - reoive

   // 23017 i/o expander
    mcp.init();
    mcp.portMode(MCP23017Port::A, 0);          //Port A as output
    mcp.portMode(MCP23017Port::B, 0b11111111); //Port B as input

    mcp.writeRegister(MCP23017Register::GPIO_A, 0x00);  //Reset port A 
    mcp.writeRegister(MCP23017Register::GPIO_B, 0x00);  //Reset port B

    // Invert inputs (press a button to lit a led (button press gives a "1")
    mcp.writeRegister(MCP23017Register::IPOL_B, 0xFF);
    // Pull up resisters
    mcp.writeRegister(MCP23017Register::GPPU_B, 0b11111111);
    mcp.digitalWrite(RELAY_OUT_PIN, LOW);
    mcp.digitalWrite(ARM_OUT_PIN, LOW);
    mcp.digitalWrite(REMOTE_NODE_IN_CONTACT_LED, LOW);
    Serial.println("mcp init done");

  // init timers
  fireRelay.init();
  armed.init();
  cameraTrigger.init();
  focusTrigger.init();
  remoteNodeInContact.init();
  pollInterval.init();
  pollInterval.check();
  pollInterval.fire(); // send out a poll request;
  Serial.println("Non-blocking timer init done");

  radioInit();
  Serial.println("Radio init done");
  delay(1000);



}


void loop() {

  // check timers
  armed.check();
  focusTrigger.check();
  cameraTrigger.check();
  fireRelay.check();
  remoteNodeInContact.check();


    // read state of push buttons
    uint8_t io_expander_inputs = mcp.readPort(MCP23017Port::B);
    bool stateArmSwitch     = 0x1 & io_expander_inputs;
    bool stateDisarmSwitch = 0x2 & io_expander_inputs;
    bool fireSwitch        = 0x4 & io_expander_inputs;
    // Setting this - only external sensor will trigger camera 
    // (launch fire will not)
    bool externalSensorCameraOnly =  0x8 & io_expander_inputs;
    // write state of armed switch to LED
    if(stateArmSwitch){
      digitalWrite(LED_OUT_PIN,stateArmSwitch );
      Serial.println("Arm swith high");
      delay(1000);
    }

  // Read arm switch
  if (stateArmSwitch || isRadioArmRequest) {
    isRadioArmRequest=false;
    armed.fire();
    if (stateArmSwitch){
      radioSendArmedCommand();
    }
  }
  if (armed.check()) {
    tone(BUZZER_OUT_PIN, 1000 /* hz*/, 25 /* ms */);
    Serial.println("Armed ...");
  }
  // disarm
  if (stateDisarmSwitch|| isRadioDisarmRequest) {
     
 
    fireRelay.clear();
    armed.clear();
    
    // acts as poll   
    digitalWrite(CAMERA_TRIGGER_OUT_PIN, HIGH);
    digitalWrite(CAMERA_FOCUS_OUT_PIN, HIGH);
  

    if (stateDisarmSwitch){
           radioSendDisarmCommand();
           
    }
 
    delay(100);
    digitalWrite(CAMERA_TRIGGER_OUT_PIN, LOW);
    digitalWrite(CAMERA_FOCUS_OUT_PIN, LOW);
    isRadioDisarmRequest=false;
  }
  //  fire button is  pressed
  if (fireSwitch || isRadioFireRequest) {
    isRadioFireRequest=false;
    if(!externalSensorCameraOnly){
        focusTrigger.fire();
        cameraTrigger.fire();
    }
    if( fireSwitch){
      radioSendFireCommand();
    }
    if (armed.check()) {

      fireRelay.fire();
      armed.clear();
      tone(BUZZER_OUT_PIN, 4000 /* hz*/, 2000 /* ms */);
    }
  }
  // MCP23017 outputs
  if(armed.check()){
      mcp.digitalWrite(ARM_OUT_PIN, HIGH);
  }else {
      mcp.digitalWrite(ARM_OUT_PIN, LOW);
  }
    if(fireRelay.check()){
      mcp.digitalWrite(RELAY_OUT_PIN, HIGH);
  }else {
      mcp.digitalWrite(RELAY_OUT_PIN, LOW);
  }
  if(remoteNodeInContact.check()){
     mcp.digitalWrite(REMOTE_NODE_IN_CONTACT_LED, HIGH);
  }else{
     mcp.digitalWrite(REMOTE_NODE_IN_CONTACT_LED, LOW);

  }
  if( !pollInterval.check() ){
    radioSendPoll();
    pollInterval.fire();
  }


  // Receive commands
  if (radio_m0.available()) {
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
     

      if (strstr((char *)buf, "A")) {
        // memcpy(buf, &radiopacket, 4);
        // if( radiopacket[4]=='N' ){
        //    isRadioDisarmRequest = true;
        //    isRadioArmRequest = false;
        // }else if( radiopacket[4]=='Y' ){
        //    isRadioArmRequest = true;
        // }
        isRadioArmRequest = true;
      } else if (strstr((char *)buf, "P")){// poll request
         pollResponse();
         remoteNodeInContact.fire();

      } else if (strstr((char *)buf, "D")){
         isRadioDisarmRequest = true;
      } else if (strstr((char *)buf, "T")){
        isRadioTriggerRequest= true;
        // trigger cameras only from sensor
        if(externalSensorCameraOnly){
          focusTrigger.fire();
          cameraTrigger.fire();
        }

      } else if (strstr((char *)buf, "R")){
         // pollResponse();
          
      } else if (strstr((char *)buf, "F")){
        isRadioFireRequest = true;
      }
    }
  }

  Serial.println("Loop ...");
  delay(5);
}
