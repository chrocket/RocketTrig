const unsigned int BUZZER_OUT_PIN = 10;          // Pin to audible indicator
const unsigned int CAMERA_TRIGGER_OUT_PIN = 12;  // Pin for shtter opto-isoloatr
const unsigned int CAMERA_FOCUS_OUT_PIN = 11;    // Pin for focus opto-isolator
const unsigned int LED_OUT_PIN = 13;        // Pin for 2nd trigger output
const unsigned int ARM_INDICATOR_OUT_PIN = 5;  // Indicates sensor is armed, turns laser on




void setup() {

// output pins
  pinMode(ARM_INDICATOR_OUT_PIN, OUTPUT);
  pinMode(CAMERA_TRIGGER_OUT_PIN, OUTPUT);
  pinMode(CAMERA_FOCUS_OUT_PIN, OUTPUT);
  pinMode(LED_OUT_PIN, OUTPUT);
 
  digitalWrite(ARM_INDICATOR_OUT_PIN, LOW);
  digitalWrite(CAMERA_TRIGGER_OUT_PIN, LOW);
  digitalWrite(CAMERA_FOCUS_OUT_PIN, LOW);
  digitalWrite(LED_OUT_PIN, LOW);
  
  Serial.begin(9600);

}

void loop() {



  // step through turning outputs on
  tone(BUZZER_OUT_PIN, 1000 /* hz*/, 25 /* ms */);
  delay(250);
  digitalWrite(ARM_INDICATOR_OUT_PIN, HIGH);
  delay(250);
  digitalWrite(CAMERA_TRIGGER_OUT_PIN, HIGH);
  delay(250);
  digitalWrite(CAMERA_FOCUS_OUT_PIN, HIGH);
  delay(250);
  digitalWrite(LED_OUT_PIN, HIGH);
  tone(BUZZER_OUT_PIN, 400 /* hz*/, 25 /* ms */);
  delay(500);

  // turn all off
  digitalWrite(ARM_INDICATOR_OUT_PIN, LOW);
  digitalWrite(CAMERA_TRIGGER_OUT_PIN, LOW);
  digitalWrite(CAMERA_FOCUS_OUT_PIN, LOW);
  digitalWrite(LED_OUT_PIN, LOW);
  Serial.println("Bottom of loop");

  delay(2000);

}
