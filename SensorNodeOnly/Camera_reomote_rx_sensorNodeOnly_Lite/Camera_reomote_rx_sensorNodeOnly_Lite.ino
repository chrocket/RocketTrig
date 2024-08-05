
// rf65/rf95 (lora) RocketTrig  Camera/Sensor node
// https://github.com/chrocket/RocketTrig_release1
// By Curtis Heisey

// Updated 4/18/2022


// Optional:
// ZIO OLED DISPLAY (0.91 IN, 128X32, QWIIC)  https://www.smart-prototyping.com/Zio/zio-modules/zio-display/Zio-OLED-Display-0-91-in-128-32-Qwiic.html
// Uses Adafruit_SSD1306 https://github.com/adafruit/Adafruit_SSD1306 (also pulls in GFX, Touchscreen and something else)
// https://www.smart-prototyping.com/blog/Zio-Ultrasonic-Distance-Sensor%20-Qwiic-Start-Guide
// See Adafruit_SSD1306/examples/ssd1306_128x32_i2c/
//
// 
//
// Requires RadioHead libs
// https://www.airspayce.com/mikem/arduino/RadioHead/index.html
// Download from Adafruit https://cdn-learn.adafruit.com/assets/assets/000/035/106/original/RadioHead-1.62.zip?1472068723
// Using (raw) unaddressed broadcast send
// Demonstrates the use of AES encryption, setting the frequency and modem
// configuration

/* Libs
    LowPowerLab/RFM69  (Download from Adfaruit).
    CRC32 by Christopher Baker  - install using Arduino IDE library manager
    Sensors:
    SparkFun Qwiic Ultrasonic Distance Sensor (HC-SR04) (17777)
          Lib: ZIO Ultrasound module  https://github.com/ZIOCC/Zio-Qwiic-Ultrasonic-Distance-Sensor/tree/master/Arduino
    <DFRobot_mmWave_Radar.h>  // https://github.com/DFRobotdl/DFRobot_mmWave_Radar/archive/refs/heads/master.zip
    Sparkfun VM1010 sound module, SPX-17979
       Lib: <SparkFun_PCA9536_Arduino_Library.h> // Click here to get the library: http://librarymanager/All#SparkFun_PCA9536
 */


// Redboard,  M0
#define SERIALIO  Serial

//Redboard Turbo
//#define SERIALIO  SerialUSB


// Pick one module of the other

// #define MODULE_RFM69
// #undef MODULE_RFM95

#undef MODULE_RFM69
#define MODULE_RFM95

#include <SPI.h>
#include <Wire.h>


// for (optional) OLED display
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>  // From library manager v2.5.1
bool hasOLED = false;
#define SCREEN_WIDTH 128 // OLED display width, in pixels
#define SCREEN_HEIGHT 32 // OLED display height, in pixels
#define OLED_RESET 4
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

#include <DFRobot_mmWave_Radar.h>  // https://github.com/DFRobotdl/DFRobot_mmWave_Radar/archive/refs/heads/master.zip



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


 /* Pick a sensor
  *  SENSOR_0 - Threshold sensor
  *  SENSOR_2 - SF30 Lidar
  *  SENSOR_3 - Ultrasound distance
  *  SENSOR_4 - DFRobot_mmWave_Radar
  *  SENSOR_5 - Sound
  *  SENSOR_6 - TOF distance
  *  */
#define SENSOR_5


// sometimes we don't want to arm trigger, we just want to always trigger if the sensor goes off
// Set true to always trigger and ignore arm requests (sets isArmed = true)
// Use with sensor with low false alarm rate (foot switch) or ... maybe the sound sensor
// set override behavior (true will always be armed)
bool overrideAlwaysArmed=true;


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

// display
#define DISPLAY_ADDRESS_LCD 0x72 //This is the default address of the OpenLCD

//inputs
const unsigned int DIST_THRESH_PIN_IN = 19;
const unsigned int LOWHIGH_TRIGGER_IN_PIN = 5; // If armed, Low to high transition will trigger
const unsigned int HIGHLOW_TRIGGER_IN_PIN = 17; // If armed, High to low transition will trigger
const unsigned int POLLREQUEST_IN_PIN = 16; // Push button to send roll call poll request to other nodes
const unsigned int ARM_IN_PIN = 15;
// note: poll, arm pins swapped relative to camera node board and sw

// outputs
// LED_OUT 13
const unsigned int CAMERA_TRIGGER_OUT_PIN = 12;   // just goes to LED
const unsigned int BUZZER_OUT_PIN = 10;           // Pin to audible indicator
const unsigned int AUX_OUT_PIN = 9;               // Pin for 2nd trigger output
const unsigned int ARM_INDICATOR_OUT_PIN = 6;     // Indicates sensor is armed, turns laser on
//misc i/o
const unsigned int QWIIC_SCL = 20;
const unsigned int QWIIC_SDA = 21;

const unsigned int  ON_TIME_MS = 1000 ;          // Camera bulb on time when trigger fires (typical vals 1-3 seconds)
const unsigned int  SHORT_TIME_MS = 200;

const float MAX_RANGE_FT = 160.0  ;        // Max range of SF-30B is 50 m
//const float CM_TO_INCH = 0.0328084;
const float CM_TO_INCH = 0.0393701;
const float LCD_UPDATE_MS = 300;

unsigned long time_now_ms;
unsigned long time_last_ms;
unsigned long last_report_time;

uint32_t myId_i = 0;
char myId[3];
// Dont put this on the stack:
uint8_t buf[MAX_MESSAGE_LEN];
//uint8_t buf[RH_RF95_MAX_MESSAGE_LEN];
char radiopacket[5];




#if defined(ADAFRUIT_FEATHER_M0) // Feather M0 w/Radio
//TODO need to check for Adafruit Feather M0
#endif

#define SF30_SERIAL Serial1
#define sf30_baud_rate        115200                                  // Sf30 baud rate  (Can be changed, refer to the sf30 manual)


class SensorBase {
  protected:
    unsigned long lastTrigger; // Keep a record of when the last trigger took place (millis)
    void setup() {
    }
    bool checkForTrigger() {
      return false;
    }
  public:
    void arm() {

    }
};

#if defined(SENSOR_2)
class SensorSF30Lidar: public SensorBase {
  public:
    void setup() {
      SF30_SERIAL.begin(sf30_baud_rate);                                    // Open the second serial port to connect to the sf30
    }

    float takeReading()  //SF 30
    {
      // Flush buffer
      while (SF30_SERIAL.available())
        SF30_SERIAL.read();
      while (SF30_SERIAL.available() == 0);
      while (SF30_SERIAL.available() == 1);
      while (SF30_SERIAL.available() == 2);

      byte byte0 = SF30_SERIAL.read();
      byte byte1 = SF30_SERIAL.read();
      byte byte2 = SF30_SERIAL.read();


      float distance = 0.0;

      if (byte1 & 0x80)
        distance = (( byte1 & 0x7F) * 128) + (byte0 & 0x7F);
      else
        distance = (( byte2 & 0x7F) * 128) + (byte1 & 0x7F);

      return distance * CM_TO_INCH;
    }

  public:
    bool checkForTrigger() {
      // A reading can be taken at any time, so other work can be done before/after.
      float reading = takeReading();
      float thresholdSetting = map(analogRead(DIST_THRESH_PIN_IN), 0, 1023, 0, 50);
      bool trig = LOW;
      if ( reading > thresholdSetting) {
        trig = HIGH;
      } else {
        trig = LOW;
      }
      // Output results to console.
      Serial.print(reading);
      Serial.print(", in    ");
      Serial.print(thresholdSetting);
      Serial.print(",   ");
      Serial.println(trig);
      return trig;
    }
};
#endif

// Sensors supported:
// Break wire, foot switch, larnch rail switch,
// laser fin sensor,
// simplytronics x-band motion detector (Parallax ST-00018)
// Hall WCS1800 sensor
#if defined(SENSOR_0) 
class SensorDigitalPin: public SensorBase {
    bool trig;
  public:
    void setup() {

      pinMode(LOWHIGH_TRIGGER_IN_PIN, INPUT);
      pinMode(HIGHLOW_TRIGGER_IN_PIN, INPUT_PULLUP);
      digitalWrite(LED_BUILTIN, LOW);
      lastTrigger = millis(); // Initialize lastTrigger
      trig = false;
    }
    bool checkForTrigger() {
      if ( digitalRead(LOWHIGH_TRIGGER_IN_PIN)   == 1  ||
           digitalRead(HIGHLOW_TRIGGER_IN_PIN)  == 0 ) {
        trig = true;
        lastTrigger = millis(); // Update lastTrigger
        // Flash LED_BUILTIN for a full second. The LED on the sound trigger will only flash briefly
        digitalWrite(LED_BUILTIN, HIGH);
        SERIALIO.println( "SnesorDigitalPin - got trigger" );
      }

      // Check if it has been more than one second since the last sound event
      // If it has, turn LED_BUILTIN off
      if (trig) {
        if (millis() > (lastTrigger + 1000))
        {
          digitalWrite(LED_BUILTIN, LOW);
          trig = false;
          SERIALIO.println( "SnesorDigitalPin - clearing trigger" );
        }
      }
      return trig;
    }
};
#endif


#if defined(SENSOR_3)
// Zio Ultrasound Distance Sensor
// SparkFun Qwiic Ultrasonic Distance Sensor (HC-SR04) (17777)
// https://www.sparkfun.com/products/17777
/*
  Operating Voltage 3.3V
  Detecting Angle: 15 degrees
  Sensor range: 2cm to 400cm
  Accuracy: 3mm
  MCU on board: STM8L051
  Default I2C Address: 0x00
  Dimensions: 21.5 x 45.5mm
*/
// https://github.com/sparkfun/Zio-Qwiic-Ultrasonic-Distance-Sensor
#define SLAVE_BROADCAST_ADDR 0x00  //default address
#define SLAVE_ADDR 0x00       //SLAVE_ADDR 0xA0-0xAF
class SensorZioUltraSounddistance: public SensorBase {
    uint8_t distance_H = 0;
    uint8_t distance_L = 0;
    uint16_t distance = 0;
    uint16_t distancei = 0;
    float distancef;

    bool overrideThreshFlag = false;
    float overrideThresh_in = 0;
  public:
    void setup() {
      lastTrigger = millis(); // Initialize lastTrigger
    }
    void overrideThresh(uint8_t inches) {

      overrideThresh_in = inches = inches;
      overrideThreshFlag = true;

    }
    bool checkForTrigger() {
      delay(10);

      bool trig = LOW;
      Wire.beginTransmission(SLAVE_ADDR); // transmit to device SLAVE_ADDR
      Wire.write(1);              // measure command: 0x01
      Wire.endTransmission();    // stop transmitting
      delay(5);
      Wire.requestFrom(SLAVE_ADDR, 2);    // request 6 bytes from slave device #8
      while (Wire.available()) { // slave may send less than requested
        distance_H = Wire.read(); // receive a byte as character
        distance_L = Wire.read();
        distance = (uint16_t)distance_H << 8;
        distancei = (distance | distance_L) * 0.0393701; // inch
        distancef = (distance | distance_L) * 0.0393701; // inch
        SERIALIO.print("D = ");
        SERIALIO.print( distancef );
        SERIALIO.print(" ");

      }

      float thresholdSetting = map(analogRead(DIST_THRESH_PIN_IN), 0, 1023, 0, 15); // 15 inch max
      if ( overrideThreshFlag) {
        thresholdSetting = overrideThresh_in;
      }
      if (hasOLED) {
        display.setTextSize(2);
        display.setTextColor(WHITE);
        display.setCursor(10, 0);
        display.clearDisplay();
        display.print(distancei);
        display.setCursor(60, 0);
        display.print(thresholdSetting);
        display.display();
      }
      SERIALIO.print(", T = ");
      SERIALIO.print( thresholdSetting );
      trig = LOW;
      if ( distancef > thresholdSetting) {
        trig = HIGH;
        lastTrigger = millis(); // Update lastTrigger
        // Flash LED_BUILTIN for a full second. The LED on the sound trigger will only flash briefly
        digitalWrite(LED_BUILTIN, HIGH);
      } else {
        trig = LOW;
      }
      SERIALIO.print(", trig = ");
      SERIALIO.println(trig);


      // Check if it has been more than one second since the last sound event
      // If it has, turn LED_BUILTIN off
      if (millis() > (lastTrigger + 1000))
      {
        digitalWrite(LED_BUILTIN, LOW);
        trig = false;
      }
      return trig;
    }
};
#endif

#if defined(SENSOR_4)
Stream * myPort = &Serial1;

DFRobot_mmWave_Radar mmwsensor(myPort);
// https://wiki.dfrobot.com/mmWave_Radar_Human_Presence_Detection_SKU_SEN0395

class SensorDFRobotmmWaveSensor: public SensorBase {

  public:
    void setup() {
      mmwsensor.factoryReset();    //Restore to the factory settings
      mmwsensor.DetRangeCfg(0, 9);    //The detection range is as far as 9m
      mmwsensor.OutputLatency(0, 0);
    }
    bool checkForTrigger() {
      return mmwsensor.readPresenceDetection();
    }
};
#endif

#if defined(SENSOR_5)
// Sparkfun VM1010 sound module, SPX-17979  https://www.sparkfun.com/products/17979
#include <SparkFun_PCA9536_Arduino_Library.h> // Click here to get the library: http://librarymanager/All#SparkFun_PCA9536
// Using version 1.2.2 from library manager
PCA9536 soundTrigger;
#define VM1010_MODE 0 // The VM1010 mode pin is connected to GPIO0 on the PCA9536
#define VM1010_TRIG 1 // The VM1010 trigger pin (Dout) is connected to GPIO1 on the PCA9536


class VM1010SoundSensor: public SensorBase {
  public:
    bool trig;

    void setup() {

      Serial.begin(115200);
      Serial.println(F("Qwiic Sound Trigger Example"));
      // Initialize the Sound Trigger PCA9536 with a begin function
      if (soundTrigger.begin() == false)
      {
        Serial.println(F("Sound Trigger (PCA9536) not detected. Please check wiring. Freezing..."));
        while (1)         ;
      }

      // Configure VM1010_TRIG (GPIO1) as an input for the VM1010 trigger signal (Dout)
      soundTrigger.pinMode(VM1010_TRIG, INPUT);

      // Configure VM1010_MODE (GPIO0) as an input for now.
      // The pull-up resistor on the sound trigger will hold the VM1010 in "Wake On Sound" mode.
      // We will configure VM1010_MODE as an output when we want to pull the MODE pin low to clear the wake-up event.
      soundTrigger.pinMode(VM1010_MODE, INPUT);
      trig = false;
      lastTrigger = millis(); // Initialize lastTrigger
      delay(1000);
    }
    bool checkForTrigger() {
      // Check for a new sound (wake-up event) every millisecond (approx.)
      delay(1);

      // Check for a wake-up event by reading the VM1010 Trigger (Dout) pin
      // Dout will go high when a sound is detected
      if (soundTrigger.digitalRead(VM1010_TRIG) == HIGH)
      {
        // We have detected a sound so:
        trig = true;

        // Lets tell the user about it:
        Serial.println();
        Serial.print(F("Sound detected! It has been "));
        Serial.print(millis() - lastTrigger);
        Serial.println(F(" ms since the last sound event"));

        lastTrigger = millis(); // Update lastTrigger

        // Flash LED_BUILTIN for a full second. The LED on the sound trigger will only flash briefly
        digitalWrite(LED_BUILTIN, HIGH);

        // Unless your sound is _very_ quick ( ~ 10 milliseconds ), you will see multiple sounds events from the VM1010
        // You can "debounce" those by adding a delay before resetting the VM1010
        //delay(100); // Uncomment this line to "debounce" sound events

        // Now we need to reset the sound event by:
        soundTrigger.digitalWrite(VM1010_MODE, LOW); // Get ready to pull the VM1010 MODE pin low
        soundTrigger.pinMode(VM1010_MODE, OUTPUT); // Change the PCA9536 GPIO0 pin to an output. It will pull the VM1010 MODE pin low
        soundTrigger.pinMode(VM1010_MODE, INPUT); // Change the PCA9536 GPIO0 pin back to an input (with pull-up), so it will not 'fight' the mode button
      }

      // Check if it has been more than one second since the last sound event
      // If it has, turn LED_BUILTIN off
      if (millis() > (lastTrigger + 1000))
      {
        digitalWrite(LED_BUILTIN, LOW);
        trig = false;
      }



      return trig;
    }
    void arm() {

      soundTrigger.pinMode(VM1010_MODE, LOW);
      soundTrigger.pinMode(VM1010_MODE, OUTPUT); // pull pin low to reset
      soundTrigger.pinMode(VM1010_MODE, LOW);
      delay(5);
      soundTrigger.pinMode(VM1010_MODE, INPUT); // set back to wake-up mode
      delay(10);
    }
};
#endif

#if defined(SENSOR_6)
#include "SparkFun_VL53L1X.h" //Click here to get the library: http://librarymanager/All#SparkFun_VL53L1X
//Sparkfun VL53LIX V1.0.0 from library Manager
// https://www.sparkfun.com/products/14667
/*
   Operating Voltage: 2.6V-3.5V
  Power Consumption: 20 mW @10Hz
  Measurement Range: ~40mm to 4,000mm
  Resolution: +/-1mm
  Light Source: Class 1 940nm VCSEL
  7-bit unshifted I2C Address: 0x29
  Field of View: 15° - 27°
  Max Read Rate: 50Hz
*/

//Optional interrupt and shutdown pins.
#define SHUTDOWN_PIN 2
#define INTERRUPT_PIN 3
class VL53L1XDistanceSensor: public SensorBase {
    SFEVL53L1X distanceSensor;
    bool trig;
    unsigned long lastTrigger; // Keep a record of when the last trigger took place (millis)
  public:
    void setup() {
      if (distanceSensor.begin() != 0) //Begin returns 0 on a good init
      {
        Serial.println("Sensor failed to begin. Please check wiring. Freezing...");
        while (1)
          ;
      }
      distanceSensor.setDistanceModeShort();  // set 1.3M distance mode
      distanceSensor.setTimingBudgetInMs(20);  // 15 ms is min
      distanceSensor.setIntermeasurementPeriod(20);  // > timing budget + 4 ms
      lastTrigger = millis(); // Initialize lastTrigger
      Serial.println("Sensor online!");

    }
    bool checkForTrigger() {
      distanceSensor.startRanging(); //Write configuration bytes to initiate measurement
      while (!distanceSensor.checkForDataReady())
      {
        delay(1);
      }
      int distance = distanceSensor.getDistance(); //Get the result of the measurement from the sensor
      distanceSensor.clearInterrupt();
      distanceSensor.stopRanging();
      float distanceInches = distance * 0.0393701;
      int distancei =  distanceInches;
      float thresholdSetting = map(analogRead(DIST_THRESH_PIN_IN), 0, 1023, 0, 36); // inches
      if (hasOLED) {
        display.setTextSize(2);
        display.setTextColor(WHITE);
        display.setCursor(10, 0);
        display.clearDisplay();
        display.print(distancei);
        display.setCursor(60, 0);
        display.print(thresholdSetting);
        display.display();
      }

      SERIALIO.print("D = ");
      SERIALIO.print( distanceInches );
      SERIALIO.print(" ");
      SERIALIO.print(", T = ");
      SERIALIO.print( thresholdSetting );
      SERIALIO.print(", trig = ");
      SERIALIO.println( trig );


      trig = LOW;
      if ( distanceInches > thresholdSetting) {
        trig = HIGH;
        lastTrigger = millis(); // Update lastTrigger
        // Flash LED_BUILTIN for a full second. The LED on the sound trigger will only flash briefly
        digitalWrite(LED_BUILTIN, HIGH);
      } else {
        trig = LOW;
      }
      // Check if it has been more than one second since the last sound event
      // If it has, turn LED_BUILTIN off
      if (millis() > (lastTrigger + 1000))
      {
        digitalWrite(LED_BUILTIN, LOW);

      }
      return trig;
    }
};
#endif
/*
   NonBlockingTimer CLASS DEFINITION
*/
class NonBlockingTimer {
  protected:
    bool isPressed = LOW;
    unsigned long timeFireOn;
    unsigned long nextChangeTime = 0;
  private:
    NonBlockingTimer() {};
  public:
    NonBlockingTimer(unsigned int timeFireOnIn) {
      timeFireOn = timeFireOnIn;
    }
    void fire() {
      isPressed  = HIGH;
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
};
/*
   FireTimer CLASS DEFINITION
*/
class FireTimer: public NonBlockingTimer {
  private:
    byte pinLED;

  public:
    FireTimer(byte pinLED, unsigned long timeLedOn): NonBlockingTimer(timeLedOn) {
      this->pinLED = pinLED;
      pinMode(pinLED, OUTPUT);
      isPressed = LOW;
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

//Given a number, i2cSendValue chops up an integer into four values and sends them out over I2C
void i2cSendValue(float value, int threshold_ft, bool trigger)
{
  Wire.beginTransmission(DISPLAY_ADDRESS_LCD); // transmit to device #1

  Wire.write('|'); //Put LCD into setting mode
  Wire.write('-'); //Send clear display command

  //  char floatrep[5];
  //  snprintf(floatrep, sizeof(floatrep), "%.1f ", &value);

  Wire.print("D:");
  Wire.println(value);
  Wire.print("T: ");
  Wire.print(threshold_ft);
  Wire.print(" Tr: ");
  Wire.print(trigger);

  Wire.endTransmission(); //Stop I2C transmission
}


unsigned int getThreshold_ft() {
  // read pot
  unsigned int valuePot = analogRead(DIST_THRESH_PIN_IN);
  return  map(valuePot, 6, 1023, 1, 100 /* max feet */ );

}

// Output to console and i2c LCD display, address DISPLAY_ADDRESSLCD
void output_value_to_display(float distance_ft, float threshold_ft, bool trigger) {
  time_now_ms = millis();

  if ( time_now_ms - time_last_ms > LCD_UPDATE_MS) {

    // Output results to console.
    /*
      ser.print("Distance (ft) =");
      ser.print(distance_ft);
      ser.print(", Threshold (ft) =");
      ser.print(threshold_ft);
      //   ser.print(", alarm =");
      //   ser.print(alarm);
      ser.print(", trigger =");
      ser.println(trigger);
    */


    //  i2cSendValue( distance_ft, threshold_ft, trigger);

    time_last_ms = time_now_ms;
  }

}



unsigned int sensorRead_ft() {
  return 50;

}


FireTimer  triggerIndicator(CAMERA_TRIGGER_OUT_PIN, 500);
FireTimer   auxOut(AUX_OUT_PIN, 200);
NonBlockingTimer armNonBlockingPressed( SHORT_TIME_MS );
NonBlockingTimer pollNonBlockingPressed( SHORT_TIME_MS );


bool gotArmRequest = false;
bool gotPollRequest = false;
bool gotTrigger = false;
bool isArmed = false;

////////////////////////////////////////////////////
// pick a sensor
///////////////////////////////////////////////////
// digital i/o
#if defined(SENSOR_0) 
SensorDigitalPin sensor;

#elif defined(SENSOR_2)
 SensorSF30Lidar sensor;

// ultrasound
#elif defined(SENSOR_3)
SensorZioUltraSounddistance sensor;

#elif defined(SENSOR_4)
TODO

// sound
#elif defined(SENSOR_5)
VM1010SoundSensor sensor;

// tof laser distance
#elif defined(SENSOR_6)
VL53L1XDistanceSensor sensor;

#else

Sensor not defined
#endif


void setup()
{
  Serial.begin(115200);
  Wire.begin(); // We communicate with the PCA9536 via I2C

  pinMode(LED_BUILTIN, OUTPUT); // The LED on the sound trigger will only flash very briefly
  digitalWrite(LED_BUILTIN, LOW); // We will flash LED_BUILTIN for a full second on each sound event



  // read unique CPU Id
  char bufId[33];
  printChipId(bufId);
  myId_i = CRC32::calculate(bufId, 32); // compute checksum
  Serial.print("My id = ");
  Serial.println(myId_i);
  myId_i = myId_i % 1000;
  sprintf(myId, "%3d", myId_i);
  radiopacket[1] = myId[0];
  radiopacket[2] = myId[1];
  radiopacket[3] = myId[2];
  radiopacket[4] = 'N'; // isArmed

  pinMode(CAMERA_TRIGGER_OUT_PIN, OUTPUT);
  digitalWrite(CAMERA_TRIGGER_OUT_PIN, LOW);

  //   pinMode(BUZZER_OUT_PIN, OUTPUT);
  pinMode(AUX_OUT_PIN, OUTPUT);
  pinMode(ARM_INDICATOR_OUT_PIN, OUTPUT);

  pinMode(ARM_IN_PIN, INPUT_PULLUP);
  pinMode(DIST_THRESH_PIN_IN, INPUT);

  pinMode(POLLREQUEST_IN_PIN, INPUT_PULLUP);
  

  // auto-detect if OLED display is present
  // Warning:  System runs much slower, which signifigantly increases the min detection latency
  if (!display.begin(SSD1306_SWITCHCAPVCC, 0x3C)) { // Address 0x3C for 128x32
    SERIALIO.println("No OLED found");
    hasOLED = false;
  } else {

    hasOLED = true;
    display.clearDisplay();
  }

  Serial.println("CWH Camera Trigger RFM69/RFM95 Sensor Node");
  Serial.println();
  sensor.setup();





  // RFM69 Reset pin definition
#if defined(MODULE_RFM69)
  pinMode(RFM69_RST, OUTPUT);
  digitalWrite(RFM69_RST, LOW);

#else
  pinMode(RFM95_RST, OUTPUT);
  digitalWrite(RFM95_RST, HIGH);

#endif

  //w  Wire.begin(); //Join the bus as master

  //By default .begin() will set I2C SCL to Standard Speed mode of 100kHz
  //Wire.setClock(400000); //Optional - set I2C SCL to High Speed Mode of 400kHz


  // Uncomment to not start until serial console is attached (for debugging)
  /*
    while (!Serial) {
    delay(1);
    }
  */
  delay(100);


  // manual reset
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
                    0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08
                  };
#if defined(MODULE_RFM69)
  radio_m0.setEncryptionKey(key);
#else
  // no encryption
#endif



  Serial.print("RFM69/95 radio @");  Serial.print((int)FREQ);  Serial.println(" MHz");

  tone(BUZZER_OUT_PIN, 1500 /* hz*/, 2000 /* ms */);
}

void loop() {


  //    triggerIndicator.check();
  auxOut.check();
  armNonBlockingPressed.check();
  pollNonBlockingPressed.check();

  //    Serial.print("Pot = ");
  //    Serial.println(getThreshold_ft());

  unsigned int frequency = 2600;


  //*************************************
  // Ignores armed commmenad (see above comment)
  // default is false
  if(overrideAlwaysArmed)
     isArmed= true;
  //*************************************

  digitalWrite(ARM_INDICATOR_OUT_PIN, isArmed);


  if ( digitalRead(ARM_IN_PIN) == 0 &&
       !armNonBlockingPressed.isBPressed() ) {
    gotArmRequest = true ;
    if ( !isArmed)
      isArmed = true;
    radiopacket[0] = 'A';
    radio_m0.send((uint8_t *)radiopacket, strlen(radiopacket));
    radio_m0.waitPacketSent();
    sensor.arm();

    Serial.print("Arm PB,  Sending Arm command "); Serial.println(radiopacket);
    armNonBlockingPressed.fire();
  }
  if ( digitalRead(POLLREQUEST_IN_PIN) == 0 ) {
    gotPollRequest = true;
  }

  bool trigger = sensor.checkForTrigger();
  if (trigger) {
    triggerIndicator.fire();
    Serial.println("Got trigger");
  }

  // only fire remotes if we have a trigger AND we are armed.
  if ( trigger) {
    //
    if (isArmed) {
      //
      auxOut.fire();
      tone(BUZZER_OUT_PIN, frequency,  SHORT_TIME_MS);
      isArmed = false;

      // Trigger destination nodes
      radiopacket[0] = 'T';

      radio_m0.send((uint8_t *)radiopacket, strlen(radiopacket));
      radio_m0.waitPacketSent();
      radio_m0.send((uint8_t *)radiopacket, strlen(radiopacket)); // send twice
      radio_m0.waitPacketSent();
      Serial.print("Sensor Trigger - Sending T command "); Serial.println(radiopacket);

    }

    gotTrigger = true;

  }

  // POLL REQUEST PB
  // send out a message for Rx to echo their IDs
  if (   gotPollRequest  &&
         !pollNonBlockingPressed.isBPressed()  ) {

    // Poll requeset to destination nodes
    radiopacket[0] = 'P';
    radio_m0.send((uint8_t *)radiopacket, strlen(radiopacket));
    radio_m0.waitPacketSent();
    Serial.print("Poll request PB, sending roll call request "); Serial.println(radiopacket);
    pollNonBlockingPressed.fire();
    tone(BUZZER_OUT_PIN, 1000 /* hz*/, 200 /* ms */);
  }



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

      //    txReceivedLEDTimer.fire(); // blink the LED indicating a tx received

      // arm command
      if (strstr((char *)buf, "A")) {
        isArmed = true;
        Serial.println("Received Arm commmand");
        radiopacket[4] = 'Y';
        tone(BUZZER_OUT_PIN, 100 /* hz*/, 100 /* ms */);
        sensor.arm();
      }
      // trigger command
      if (strstr((char *)buf, "T")) {
        // fire outputs
        //           cameraTriggerTimer.fire();
        auxOut.fire();
        Serial.println("Received Trigger commmand");
        tone(BUZZER_OUT_PIN, 450 /* hz**/, SHORT_TIME_MS /* ms */);

        radiopacket[4] = 'N';
        gotTrigger = true;
        isArmed = false;
      }
      // poll request
      if (strstr((char *)buf, "P")) {
        Serial.println("Received request for poll, sending id back");
        radiopacket[0] = 'R';


        delay(  myId_i );
        radio_m0.send((uint8_t *)radiopacket, strlen(radiopacket));
        radio_m0.waitPacketSent();
        tone(BUZZER_OUT_PIN, 1500 /* hz*/, 100 /* ms */);
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

  // doesn't trigger camera -- just indicates a sensor trigger
  digitalWrite( CAMERA_TRIGGER_OUT_PIN    , gotTrigger);
  gotTrigger = false;
  gotPollRequest = false;



}// end loop
