Uses the CameraTrig board, as-is to create a wireless launch capability.

(Some pins for sensors are needed for a relay and LED).

Camera will trigger when "launch" is fired (for a two second "on")

Poll button becomes "clear", "Arm" is still "Arm" and "Trigger" becomes launch.

Press "Arm", which will arm system, after 15 sec, it will time out.
- Will also go to disarm, if you hit "clear"
- Will disarm after a launch.

After system is in "arm", hit "launch" to fire the ignitors in the remote box for 2s
- Hitting "clear" will turn off ignitors, if still in the 2 s window

Schematics enclosed for external board connections, as well as BOM.

***********************************************
NOTE  Variations
***********************************************
RocketTrig_based_board  is based on the orinal board   6/2023


CameraTriggerRev 4_2 w Launch Controller 2023  is a re-do with i2c i/o expander and darlington driver array  7/2023
4ChWirelessLaunchController - try 2 w relay pcb - is a relay board for Rev 4_2  7/2023
