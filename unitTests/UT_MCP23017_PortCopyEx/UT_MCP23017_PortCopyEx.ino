/**
 * On every loop, the state of the port B is copied to port A.
 *
 * Use active low inputs on port B. Internal pullups are enabled by default by the library so there is no need for external resistors.
 * Place LEDS on port A for instance. 
 * When pressing a button, the corresponding led is shut down.
 * 
 * You can also uncomment one line to invert the input (when pressing a button the corresponding led is lit)
 */
#include <Wire.h>
#include <MCP23017.h>

#define MCP23017_ADDR 0x20
MCP23017 mcp = MCP23017(MCP23017_ADDR);

void setup() {
    Wire.begin();
    Serial.begin(9600);

    pinMode(LED_BUILTIN, OUTPUT);
    
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
}

void loop() {
    uint8_t currentB;

    currentB = mcp.readPort(MCP23017Port::B);
    Serial.print("Input Register: ");
    Serial.print(currentB);


    bool testPin   = 0x4 & currentB;

    Serial.print("   ... test pin, position 3: ");
    Serial.println(testPin);
    digitalWrite(LED_BUILTIN, testPin);

    // Have outputs mirror inputs
    mcp.writePort(MCP23017Port::A, currentB);
    delay(1000);
}
