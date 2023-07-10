// UT for Rev4_1, Rev4_2 or Rev4_3 boards ... cycles through outputs


const unsigned int BUZZER_OUT_PIN = 10;          // Pin to audible indicator
const unsigned int CAMERA_TRIGGER_OUT_PIN = 12;  // Pin for shtter opto-isoloatr
const unsigned int CAMERA_FOCUS_OUT_PIN = 11;    // Pin for focus opto-isolator
const unsigned int LED_OUT_PIN = 13;        // Pin for 2nd trigger output
const unsigned int ARM_INDICATOR_OUT_PIN = 5;  // Indicates sensor is armed, turns laser on
const unsigned int D1_OUT_PIN = 14;   
const unsigned int D2_OUT_PIN = 16;  



void setup() {

// output pins
  pinMode(ARM_INDICATOR_OUT_PIN, OUTPUT);
  pinMode(CAMERA_TRIGGER_OUT_PIN, OUTPUT);
  pinMode(CAMERA_FOCUS_OUT_PIN, OUTPUT);
  pinMode(D1_OUT_PIN, OUTPUT);
  pinMode(D2_OUT_PIN, OUTPUT);
 
  digitalWrite(ARM_INDICATOR_OUT_PIN, LOW);
  digitalWrite(CAMERA_TRIGGER_OUT_PIN, LOW);
  digitalWrite(CAMERA_FOCUS_OUT_PIN, LOW);
  digitalWrite(LED_OUT_PIN, LOW);
  digitalWrite(D1_OUT_PIN, LOW);
  digitalWrite(D2_OUT_PIN, LOW);
  
  Serial.begin(9600);

}

void loop() {



  // step through turning outputs on
  tone(BUZZER_OUT_PIN, 4000 /* hz*/, 500 /* ms */);
  delay(250);
  digitalWrite(ARM_INDICATOR_OUT_PIN, HIGH);
  delay(250);
  digitalWrite(LED_OUT_PIN, HIGH);
  delay(250);
  digitalWrite(D1_OUT_PIN, HIGH);
  delay(250);
  digitalWrite(D2_OUT_PIN, HIGH);
  delay(250);  
  digitalWrite(CAMERA_FOCUS_OUT_PIN, HIGH);
  tone(BUZZER_OUT_PIN, 1000 /* hz*/, 2000 /* ms */);
  delay(2000);
  digitalWrite(CAMERA_FOCUS_OUT_PIN, LOW);
  digitalWrite(CAMERA_TRIGGER_OUT_PIN, HIGH);
  tone(BUZZER_OUT_PIN, 400 /* hz*/, 1000 /* ms */);
  delay(1000);

 

  // turn all off
  digitalWrite(ARM_INDICATOR_OUT_PIN, LOW);
  digitalWrite(CAMERA_TRIGGER_OUT_PIN, LOW);
  digitalWrite(CAMERA_FOCUS_OUT_PIN, LOW);
  digitalWrite(LED_OUT_PIN, LOW);
  digitalWrite(D1_OUT_PIN, LOW);
  digitalWrite(D2_OUT_PIN, LOW);
  Serial.println("Bottom of loop");

  delay(3000);

}
