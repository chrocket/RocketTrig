/**
 // This version is a 1ch remote launcher using Rev 4_2 board
 // unit test of i/o connections

// Connections
// J7 position 2 - arm pushbutton
// J7 position 3 - clear pushbutton
// J7 position 4 - fire pushbutton
// J8 position 2  - LED armed indicator
// J8 position 3 - fire relay
 
 */
#include <Wire.h>
#include <MCP23017.h>

#define MCP23017_ADDR 0x20
MCP23017 mcp = MCP23017(MCP23017_ADDR);
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


// state variables for commands received by radio
bool isRadioArmRequest = false;
bool isRadioDisarmRequest = false;
bool isRadioTriggerRequest  = false;
bool isRadioFireRequest  = false;

const unsigned int ARMED_TIMED = 10000;  // 10-15 s
const unsigned int FIRE_TIME = 2000;     // 2 s
const unsigned int POLL_TIME = 200;

const unsigned int ARM_OUT_PIN = 0; //MCP23017Pin::GPA0
const unsigned int RELAY_OUT_PIN = 1; //MCP23017Pin::GPA1

const unsigned int FIRE_INDICATOR_OUT_PIN = 24;
const unsigned int ARM_INDICATOR_OUT_PIN = 22; 

FireTimer armed(ARM_INDICATOR_OUT_PIN, ARMED_TIMED);
FireTimer fireRelay(FIRE_INDICATOR_OUT_PIN, FIRE_TIME);



void setup() {
    Wire.begin();
    Serial.begin(9600);

    pinMode(ARM_INDICATOR_OUT_PIN, OUTPUT);
    
    mcp.init();
    mcp.portMode(MCP23017Port::A, 0);          //Port A as output
    mcp.portMode(MCP23017Port::B, 0b11111111); //Port jB as input

    mcp.writeRegister(MCP23017Register::GPIO_A, 0x00);  //Reset port A 
    mcp.writeRegister(MCP23017Register::GPIO_B, 0x00);  //Reset port B

    // GPIO_B reflects the same logic as the input pins state
    //mcp.writeRegister(MCP23017Register::IPOL_A, 0x00);
    // Uncomment this line to invert inputs (press a button to lit a led)
    mcp.writeRegister(MCP23017Register::IPOL_B, 0xFF);
    // Pull up resisters
    mcp.writeRegister(MCP23017Register::GPPU_B, 0b11111111);


    armed.init();
    fireRelay.init();
}

void loop() {


  // check timers
  armed.check();
  fireRelay.check();



 // read state of push buttons
    uint8_t io_expander_inputs = mcp.readPort(MCP23017Port::B);
    bool stateArmSwitch     = 0x1 & io_expander_inputs;
    bool stateDisarmSwitch = 0x2 & io_expander_inputs;
    bool fireSwitch        = 0x4 & io_expander_inputs;

    Serial.print("Input Register: ");
    Serial.print(io_expander_inputs);
    if(stateArmSwitch){
      armed.fire();
    }
    if(armed.check() && fireSwitch){
      fireRelay.fire();
      armed.clear();
    }
    if(stateDisarmSwitch){
       armed.clear();
       fireRelay.clear();
    }


   
   mcp.digitalWrite(0,armed.check());
   mcp.digitalWrite(1,fireRelay.check());

    delay(25);
}
