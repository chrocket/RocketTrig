/**
 * Libraries
 * MCP23017 by Bertand Lemasle - Ardiuino Library Manager
 * https://github.com/blemasle/arduino-mcp23017.git
 */
#include <Wire.h>
#include <MCP23017.h>

#define MCP23017_ADDR 0x20
MCP23017 mcp = MCP23017(MCP23017_ADDR);

void setup() {
    Wire.begin();
    Serial.begin(115200);
    
    mcp.init();
    mcp.portMode(MCP23017Port::B, 0);          //Port B as output
    mcp.portMode(MCP23017Port::A, 0b11111111); //Port A as input

    mcp.writeRegister(MCP23017Register::GPIO_A, 0x00);  //Reset port A 
    mcp.writeRegister(MCP23017Register::GPIO_B, 0x00);  //Reset port B

    // GPIO_A reflects the same logic as the input pins state
    mcp.writeRegister(MCP23017Register::IPOL_A, 0x00);
 
}

void loop() {
    uint8_t portARead;
    uint8_t portBoutput;

    portARead = mcp.readPort(MCP23017Port::A);
    uint8_t channels = 0xF  & portARead; // channels 1-4
    bool armButton   = 0x10 & portARead;
    bool fireButton  = 0x20 & portARead;

    portBoutput = channels;
    if (fireButton){
       // send fire command
       // channels
       portBoutput = portBoutput || ( fireButton<< 4);
       mcp.writePort(MCP23017Port::B, portBoutput);

    }else if (armButton){
       // continuity check
       // channels
        mcp.writePort(MCP23017Port::B, portBoutput);
    }



    
}
