# RocketTrig
A camera controller for photographing high poweed model rockets
![IMG_1968](https://user-images.githubusercontent.com/46109666/182040784-ded79e51-d5cd-4ed9-949f-59f6568b157c.jpg)


This is a camera controller. Each "node" contains outputs to control one or two cameras.  Camera nodes can communicate to each others over an RF link. Two nodes make up a system, say one at the flight line and one up close to the rocket. Liftoffs can be triggered by a variety of sensors to detect lift-off, or manually via a foot switch.

Schematic, BOM, JLBPCB files and firmware are all included.
Note:  Even those some files are labelled "CameraTriggerSensorNodeOnly" they are really Camera nodes.

This is based on the Adafruit Feather M0 LoRa board (Adafruit 3178). It also works with RFM65 radio version of that board, cheaper but less range (Adafruit 3176). There is a #define to select between the two, and the frequency of operation will have to be in the range of the chip.

To build firmware, you will need Arduino IDE. I'm using ver 1.8.19.  You will need to set up the Adafruit boards in the boards manager (Add https://adafruit.github.io/arduino-board-index/package_adafruit_index.json to Additional boards URL under Preferences).  Set "Adafruit Feather M0 (SAMD21)" Under Tools/Board.

I'm using dependencies (under library manager):
CRC32 by Christopher Baker  https://github.com/bakercp/CRC32/blob/master/examples/CRC32/CRC32.ino
Requires RadioHead libs
// https://www.airspayce.com/mikem/arduino/RadioHead/index.html
// Download from Adafruit https://cdn-learn.adafruit.com/assets/assets/000/035/106/original/RadioHead-1.62.zip?1472068723
CCW MorseTX
https://github.com/ridencww/cww_MorseTx


You will likely want to change the default 915.35 MHz operating frequency. This is done by a #define.  This will deconfict different users who might  vi

--------------------------------------------------------------------------------------------------------------
In Joune 2023, I had Eureka moment. I realized that with virtuallly no changes, the RocketTrig could be used as a wireless Launch controller.  I modified the program to work with this and later worked up a separate board "REv 4_1" that could better meet both remote launch and remote camera trigger functions.

(Remote launch can still trigger cameras both local and remote)

