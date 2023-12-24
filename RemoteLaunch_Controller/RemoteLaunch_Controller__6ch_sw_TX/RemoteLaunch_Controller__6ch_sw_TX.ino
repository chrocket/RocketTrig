// rf65/rf95 (lora) RocketTrig
// This version is a 1ch remote launcher using Rev 4_2 board

// Connections
// J7 position 2 - continuity/arm
// J7 position 3 - fire
// J7 position 4 - Ch 1 activate
// J7 position 5 - Ch 2
// J7 position 6 - Ch 3
// J7 position 7 - Ch 4
// J7 position 8 - Ch 5
// J7 position 9 - Ch 6


// J8 position 2
// J8 position 3 - fire relay

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
const unsigned int BUZZER_OUT_PIN = 10;  // Pin to audible indicator
//const unsigned int CAMERA_TRIGGER_OUT_PIN = 12;  // Pin for shtter opto-isoloatr
//const unsigned int CAMERA_FOCUS_OUT_PIN = 11;    // Pin for focus opto-isolator
const unsigned int ARM_OUT_PIN = 0;   //MCP23017Pin::GPA0;
const unsigned int FIRE_CH1_PIN = 1;  //MCP23017Pin::GPA1;
const unsigned int FIRE_CH2_PIN = 2;  //MCP23017Pin::GPA2;
const unsigned int FIRE_CH3_PIN = 3;
const unsigned int FIRE_CH4_PIN = 4;
const unsigned int FIRE_CH5_PIN = 5;
const unsigned int FIRE_CH6_PIN = 6;



const unsigned int FIRE_INDICATOR_OUT_PIN = 16;  // D_2
const unsigned int ARM_INDICATOR_OUT_PIN = 17;   // OUT_2  // check


// Radio module stuff
// Pick one module of the other

// #define MODULE_RFM69
// #undef MODULE_RFM95

#undef MODULE_RFM69
#define MODULE_RFM95

#include <SPI.h>



#define LED_PIN 13



#include <RH_RF95.h>
#define RFM95_CS 8
#define RFM95_RST 4
#define RFM95_INT 3
RH_RF95 radio_m0(RFM95_CS, RFM95_INT);  // Adafruit 3178
#define MAX_MESSAGE_LEN RH_RF95_MAX_MESSAGE_LEN

// ISM 33cm band USA 902-928 MHZ
#define FREQ 920.3
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

  pinMode(RFM95_RST, OUTPUT);
  digitalWrite(RFM95_RST, HIGH);



  Serial.println("Using module RFM95");




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



void radioSendPoll1() {
  // Poll requeset to destination nodes
  radiopacket[0] = 'P';
  radio_m0.send((uint8_t *)radiopacket, strlen(radiopacket));
  radio_m0.waitPacketSent();
}
void radioSendPoll2() {
  // Poll requeset to destination nodes
  radiopacket[0] = 'Q';
  radio_m0.send((uint8_t *)radiopacket, strlen(radiopacket));
  radio_m0.waitPacketSent();
}



void radioSendFireCommand(uint8_t in) {
  // Trigger destination nodes
  radiopacket[0] = 'F';
  radiopacket[1] = in;
  radio_m0.send((uint8_t *)radiopacket, strlen(radiopacket));
  radio_m0.waitPacketSent();
}
void pollResponse() {
  Serial.print("Got an id response back: ");
  Serial.print((char *)buf);
  Serial.print(", RSSI: ");
  Serial.println(radio_m0.lastRssi(), DEC);
  tone(BUZZER_OUT_PIN, 1500 /* hz*/, 100 /* ms */);
}
const unsigned int FIRE_TIME = 2000;  // 2 s
NonBlockingTimer fire(FIRE_TIME);
NonBlockingTimer arm(FIRE_TIME);
NonBlockingTimer ch1(FIRE_TIME);
NonBlockingTimer ch2(FIRE_TIME);
NonBlockingTimer ch3(FIRE_TIME);
NonBlockingTimer ch4(FIRE_TIME);
NonBlockingTimer ch5(FIRE_TIME);
NonBlockingTimer ch6(FIRE_TIME);



void setup() {
#ifdef DEBUG
  while (!Serial) {}  // wait for serial port to connect.
#endif
  Wire.begin();

  Serial.begin(19200);


  // 23017 i/o expander
  mcp.init();
  mcp.portMode(MCP23017Port::A, 0);           //Port A as output
  mcp.portMode(MCP23017Port::B, 0b11111111);  //Port B as input

  mcp.writeRegister(MCP23017Register::GPIO_A, 0x00);  //Reset port A
  mcp.writeRegister(MCP23017Register::GPIO_B, 0x00);  //Reset port B

  // Invert inputs (press a button to lit a led (button press gives a "1")
  mcp.writeRegister(MCP23017Register::IPOL_B, 0xFF);
  // Pull up resisters
  mcp.writeRegister(MCP23017Register::GPPU_B, 0b11111111);

  mcp.writePort(MCP23017Port::A, LOW);
  Serial.println("mcp init done");


  radioInit() ;
}



void loop() {


  // init timersf
  fire.check();
  arm.check();
  ch1.check();
  ch2.check();
  ch3.check();
  ch4.check();
  ch5.check();
  ch6.check();

  // read state of push buttons
  uint8_t io_expander_inputs = mcp.readPort(MCP23017Port::B);

  uint32_t t = millis();
  if (io_expander_inputs) {
    Serial.print(t);
    Serial.print(" Got = ");
    Serial.println(io_expander_inputs, BIN);
   
  }
 bool stateContinuityArmSwitch = B00000001 & io_expander_inputs;
  bool stateFireCommandSwitch   = B00000010 & io_expander_inputs;
  bool stateCh1ActiveSwitch     = B00000100 & io_expander_inputs;
  bool stateCh2ActiveSwitch     = B00001000 & io_expander_inputs;
  bool stateCh3ActiveSwitch     = B00010000 & io_expander_inputs;
  bool stateCh4ActiveSwitch     = B00100000 & io_expander_inputs;
  bool stateCh5ActiveSwitch     = B01000000 & io_expander_inputs;
  bool stateCh6ActiveSwitch     = B10000000 & io_expander_inputs;
  if (stateContinuityArmSwitch) {
    Serial.println("  ... Got arm");
  }
  if (stateFireCommandSwitch) {
    Serial.println("  ... Got launch");
  }
  if (stateCh1ActiveSwitch) {
    Serial.println("  ... Ch 1");
  }
  if (stateCh2ActiveSwitch) {
    Serial.println("  ... Ch 2");
  }
  if (stateCh3ActiveSwitch) {
    Serial.println("  ... Ch 3");
  }
  if (stateCh4ActiveSwitch) {
    Serial.println("  ... Ch 4");
  }
  if (stateCh5ActiveSwitch) {
    Serial.println("  ... Ch 5");
  }
  if (stateCh6ActiveSwitch) {
    Serial.println("  ... Ch 6");
  }


  if (stateFireCommandSwitch) {
    fire.fire();
  }
  if (stateContinuityArmSwitch) {
    arm.fire();
    Serial.println("Relay ... arm out");
    if (fire.check()) {
      if (stateCh1ActiveSwitch
          || stateCh2ActiveSwitch
          || stateCh3ActiveSwitch
          || stateCh4ActiveSwitch
          || stateCh5ActiveSwitch
          || stateCh6ActiveSwitch) {
        if (stateCh1ActiveSwitch) {
          ch1.fire();
        }
        if (stateCh2ActiveSwitch) {
          ch2.fire();
        }
        if (stateCh3ActiveSwitch) {
          ch3.fire();
        }
        if (stateCh4ActiveSwitch) {
          ch4.fire();
        }
        if (stateCh5ActiveSwitch) {
          ch5.fire();
        }
        if (stateCh6ActiveSwitch) {
          ch6.fire();
        }
        Serial.print("Sending: ");
        Serial.println(io_expander_inputs, BIN);
        radioSendFireCommand(io_expander_inputs);
        
      }
    }
  } else {
    arm.clear();
    mcp.digitalWrite(ARM_OUT_PIN, LOW);
  }


  if (!fire.check()) {
    ch1.clear();
    ch2.clear();
    ch3.clear();
    ch4.clear();
    ch5.clear();
    ch6.clear();
    mcp.writePort(MCP23017Port::A, LOW);
  }
  if (arm.check()) {
    mcp.digitalWrite(ARM_OUT_PIN, HIGH);
  }
  if (ch1.check()) {
    mcp.digitalWrite(FIRE_CH1_PIN, HIGH);
  }
  if (ch2.check()) {
    mcp.digitalWrite(FIRE_CH2_PIN, HIGH);
  }
  if (ch3.check()) {
    mcp.digitalWrite(FIRE_CH3_PIN, HIGH);
  }

  if (ch4.check()) {
    mcp.digitalWrite(FIRE_CH4_PIN, HIGH);
  }

  if (ch5.check()) {
    mcp.digitalWrite(FIRE_CH5_PIN, HIGH);
  }

  if (ch6.check()) {
    mcp.digitalWrite(FIRE_CH6_PIN, HIGH);
  }

  // Receive commands
  if (radio_m0.available()) {
    uint8_t len = sizeof(buf);
    if (radio_m0.recv(buf, &len)) {
      if (!len) return;
      // buf[len] = 0;
      buf[5] = 0;
      if (strstr((char *)buf, "P")) {

      } else if (strstr((char *)buf, "Q")) {

      } else if (strstr((char *)buf, "F")) {
   //     relayLogic(buf[1], false);
      }
    }
  }

  delay(50);
  //  delay(1000);
}