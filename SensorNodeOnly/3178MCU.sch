EESchema Schematic File Version 4
LIBS:CameraTriggerSensorNodeOnly-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 7
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L SamacSys_Parts:3178 IC1
U 1 1 622114B0
P 4200 1150
F 0 "IC1" V 4235 1050 50  0000 C CNN
F 1 "3178" V 4326 1050 50  0000 C CNN
F 2 "3178" H 6150 1550 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/1/3403.pdf" H 6150 1450 50  0001 L CNN
F 4 "Adafruit Feather M0 with RFM95 LoRa Radio - 900MHz - RadioFruit" H 6150 1350 50  0001 L CNN "Description"
F 5 "8" H 6150 1250 50  0001 L CNN "Height"
F 6 "485-3178" H 6150 1150 50  0001 L CNN "Mouser2 Part Number"
F 7 "https://www.mouser.com/Search/Refine.aspx?Keyword=485-3178" H 6150 1050 50  0001 L CNN "Mouser2 Price/Stock"
F 8 "Adafruit" H 6150 950 50  0001 L CNN "Manufacturer_Name"
F 9 "3178" H 6150 850 50  0001 L CNN "Manufacturer_Part_Number"
	1    4200 1150
	0    1    1    0   
$EndComp
Wire Wire Line
	4750 2150 4800 2150
Wire Wire Line
	4800 2150 5700 2150
Connection ~ 4800 2150
Wire Wire Line
	4800 1950 5950 1950
Wire Wire Line
	5950 1950 5950 1900
Wire Wire Line
	5950 1900 6300 1900
Wire Wire Line
	7100 1900 7200 1900
Wire Wire Line
	7200 1900 7200 2150
$Comp
L power:GND #PWR014
U 1 1 622114BE
P 7200 2150
F 0 "#PWR014" H 7200 1900 50  0001 C CNN
F 1 "GND" H 7205 1977 50  0000 C CNN
F 2 "" H 7200 2150 50  0001 C CNN
F 3 "" H 7200 2150 50  0001 C CNN
	1    7200 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 1900 6800 1900
$Comp
L Device:R R3
U 1 1 622114C6
P 6950 1900
F 0 "R3" V 6743 1900 50  0000 C CNN
F 1 "1K" V 6834 1900 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6880 1900 50  0001 C CNN
F 3 "~" H 6950 1900 50  0001 C CNN
F 4 "C22843" V 6950 1900 50  0001 C CNN "LCSC"
	1    6950 1900
	0    1    1    0   
$EndComp
$Comp
L Device:LED D3
U 1 1 622114CD
P 6450 1900
F 0 "D3" H 6443 1645 50  0000 C CNN
F 1 "Trig1" H 6443 1736 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 6450 1900 50  0001 C CNN
F 3 "~" H 6450 1900 50  0001 C CNN
F 4 "C264544" H 6450 1900 50  0001 C CNN "LCSC"
	1    6450 1900
	-1   0    0    1   
$EndComp
Wire Wire Line
	6500 2150 6600 2150
Wire Wire Line
	6600 2150 6600 2400
$Comp
L power:GND #PWR013
U 1 1 622114D5
P 6600 2400
F 0 "#PWR013" H 6600 2150 50  0001 C CNN
F 1 "GND" H 6605 2227 50  0000 C CNN
F 2 "" H 6600 2400 50  0001 C CNN
F 3 "" H 6600 2400 50  0001 C CNN
	1    6600 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 2150 6200 2150
$Comp
L Device:R R2
U 1 1 622114DD
P 6350 2150
F 0 "R2" V 6143 2150 50  0000 C CNN
F 1 "1K" V 6234 2150 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6280 2150 50  0001 C CNN
F 3 "~" H 6350 2150 50  0001 C CNN
F 4 "C22843" V 6350 2150 50  0001 C CNN "LCSC"
	1    6350 2150
	0    1    1    0   
$EndComp
$Comp
L Device:LED D2
U 1 1 622114E4
P 5850 2150
F 0 "D2" H 5843 1895 50  0000 C CNN
F 1 "Trig2" H 5843 1986 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 5850 2150 50  0001 C CNN
F 3 "~" H 5850 2150 50  0001 C CNN
F 4 "C389521" H 5850 2150 50  0001 C CNN "LCSC"
	1    5850 2150
	-1   0    0    1   
$EndComp
Text GLabel 2700 2250 0    50   Input ~ 0
ANALOG_IN
Wire Wire Line
	4800 1650 5050 1650
Wire Wire Line
	4800 1750 5050 1750
Wire Wire Line
	4800 1850 5100 1850
Wire Wire Line
	4800 2050 5250 2050
Wire Wire Line
	4800 2250 5250 2250
Wire Wire Line
	4800 2350 5250 2350
Wire Wire Line
	4800 2450 5250 2450
Wire Wire Line
	4800 2550 5250 2550
Wire Wire Line
	4800 2650 5250 2650
Wire Wire Line
	4800 2750 5250 2750
Text GLabel 2800 1950 0    50   Input ~ 0
ArmIn
NoConn ~ 4900 1400
NoConn ~ 3200 2550
NoConn ~ 3200 2450
Wire Wire Line
	3200 2550 3400 2550
Wire Wire Line
	3200 2450 3400 2450
Text GLabel 2700 2350 0    50   Input ~ 0
Threshold
Wire Wire Line
	2700 2850 3400 2850
Wire Wire Line
	2700 2750 3400 2750
Text GLabel 2700 2850 0    50   Input ~ 0
Tx_serial
Text GLabel 2700 2750 0    50   Input ~ 0
Rx_serial
Wire Wire Line
	2700 2250 3400 2250
Text GLabel 5250 2750 2    50   Input ~ 0
SDA_qwiic
Text GLabel 5250 2650 2    50   Input ~ 0
SCL_qwiic
NoConn ~ 2800 1850
NoConn ~ 2750 2650
$Comp
L power:GND #PWR010
U 1 1 62211505
P 2250 1800
F 0 "#PWR010" H 2250 1550 50  0001 C CNN
F 1 "GND" H 2255 1627 50  0000 C CNN
F 2 "" H 2250 1800 50  0001 C CNN
F 3 "" H 2250 1800 50  0001 C CNN
	1    2250 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 1800 2250 1750
Text Label 5050 1650 2    50   ~ 0
VBAT
Text Label 5050 1750 2    50   ~ 0
EN
Text Label 5050 1850 2    50   ~ 0
VUSB
Text Label 5050 1950 2    50   ~ 0
13
$Comp
L power:+5V #PWR012
U 1 1 62211510
P 5100 1850
F 0 "#PWR012" H 5100 1700 50  0001 C CNN
F 1 "+5V" V 5115 1978 50  0000 L CNN
F 2 "" H 5100 1850 50  0001 C CNN
F 3 "" H 5100 1850 50  0001 C CNN
	1    5100 1850
	0    1    1    0   
$EndComp
Text GLabel 5250 2350 2    50   Input ~ 0
AuxOut
NoConn ~ 5050 1650
Text GLabel 5250 2050 2    50   Input ~ 0
Shutter
Text GLabel 5250 2250 2    50   Input ~ 0
Buzzer
Text GLabel 5250 2450 2    50   Input ~ 0
ArmInd
Text GLabel 5250 2550 2    50   Input ~ 0
SensorIn
Text Label 5050 2750 2    50   ~ 0
SDA
Text Label 5050 2650 2    50   ~ 0
SCL
Text Notes 5000 2550 0    50   ~ 0
5
Text Notes 5000 2450 0    50   ~ 0
6
Text Notes 5000 2350 0    50   ~ 0
9
Text Notes 5000 2250 0    50   ~ 0
10
Text Notes 5000 2150 0    50   ~ 0
11
Text Notes 5000 2050 0    50   ~ 0
12
Text Notes 4850 2550 0    50   ~ 0
21
Text Notes 4800 2650 0    50   ~ 0
20
Text Notes 3350 2850 0    50   ~ 0
1
Text Notes 3350 2750 0    50   ~ 0
0
Text Notes 2950 2250 0    50   ~ 0
18
Text Notes 2950 2150 0    50   ~ 0
17
Wire Wire Line
	2750 2150 3400 2150
Text Notes 2950 2650 0    50   ~ 0
22
Text Notes 2950 2550 0    50   ~ 0
23
Text Notes 2950 2450 0    50   ~ 0
24
Text Notes 2950 2350 0    50   ~ 0
19
Text Notes 2950 2050 0    50   ~ 0
16
Text Notes 2950 1950 0    50   ~ 0
15
Text Notes 2950 1850 0    50   ~ 0
14
Wire Wire Line
	2800 1450 3050 1450
$Comp
L power:PWR_FLAG #FLG01
U 1 1 62211533
P 2800 1450
F 0 "#FLG01" H 2800 1525 50  0001 C CNN
F 1 "PWR_FLAG" H 2800 1623 50  0000 C CNN
F 2 "" H 2800 1450 50  0001 C CNN
F 3 "~" H 2800 1450 50  0001 C CNN
	1    2800 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 2350 2700 2350
Wire Wire Line
	2750 2650 3400 2650
Text GLabel 2750 2150 0    50   Input ~ 0
AuxIn
Wire Wire Line
	2800 2050 3400 2050
Text Label 3200 2650 0    50   ~ 0
MISO
Text Label 3200 2750 0    50   ~ 0
RX
Text Label 3200 2850 0    50   ~ 0
TX
Text Label 3200 2950 0    50   ~ 0
FREE
Wire Wire Line
	3200 2950 3400 2950
NoConn ~ 3200 2950
NoConn ~ 3200 1450
NoConn ~ 3200 1650
Wire Wire Line
	2250 1750 3400 1750
Wire Wire Line
	2800 1950 3400 1950
Text GLabel 2800 2050 0    50   Input ~ 0
Poll
Wire Wire Line
	2800 1850 3400 1850
Text Label 3200 1450 0    50   ~ 0
~RST
Text Label 3200 1650 0    50   ~ 0
AREF
Wire Wire Line
	3200 1450 3400 1450
Wire Wire Line
	3200 1650 3400 1650
$Comp
L power:+3.3V #PWR011
U 1 1 6221154D
P 3050 1450
F 0 "#PWR011" H 3050 1300 50  0001 C CNN
F 1 "+3.3V" H 3065 1623 50  0000 C CNN
F 2 "" H 3050 1450 50  0001 C CNN
F 3 "" H 3050 1450 50  0001 C CNN
	1    3050 1450
	1    0    0    -1  
$EndComp
Connection ~ 3050 1450
Wire Wire Line
	3050 1450 3050 1550
Wire Wire Line
	3050 1550 3400 1550
Text Label 3200 2550 0    50   ~ 0
MOSI
Text Label 3200 2450 0    50   ~ 0
SCK
Text Label 3200 2350 0    50   ~ 0
A5
Text Label 3200 2250 0    50   ~ 0
A4
Text Label 3200 2150 0    50   ~ 0
A3
Text Label 3200 2050 0    50   ~ 0
A2
Text Label 3200 1950 0    50   ~ 0
A1
Text Label 3200 1850 0    50   ~ 0
A0
$EndSCHEMATC
