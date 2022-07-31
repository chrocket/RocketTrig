EESchema Schematic File Version 4
LIBS:CameraTriggerSensorNodeOnly-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 10
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	7050 4400 7150 4400
Wire Wire Line
	7150 4400 7150 4650
$Comp
L power:GND #PWR018
U 1 1 622114BE
P 7150 4650
F 0 "#PWR018" H 7150 4400 50  0001 C CNN
F 1 "GND" H 7155 4477 50  0000 C CNN
F 2 "" H 7150 4650 50  0001 C CNN
F 3 "" H 7150 4650 50  0001 C CNN
	1    7150 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 4400 6750 4400
$Comp
L Device:R R2
U 1 1 622114C6
P 6900 4400
F 0 "R2" V 6693 4400 50  0000 C CNN
F 1 "1K" V 6784 4400 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6830 4400 50  0001 C CNN
F 3 "~" H 6900 4400 50  0001 C CNN
F 4 "C22843" V 6900 4400 50  0001 C CNN "LCSC"
	1    6900 4400
	0    1    1    0   
$EndComp
$Comp
L Device:LED D2
U 1 1 622114CD
P 6400 4400
F 0 "D2" H 6393 4145 50  0000 C CNN
F 1 "LED Trig" H 6393 4236 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 6400 4400 50  0001 C CNN
F 3 "~" H 6400 4400 50  0001 C CNN
F 4 "C264544" H 6400 4400 50  0001 C CNN "LCSC"
	1    6400 4400
	-1   0    0    1   
$EndComp
$Comp
L SamacSys_Parts:3178 IC1
U 1 1 621FF2E6
P 4150 3650
F 0 "IC1" V 4185 3550 50  0000 C CNN
F 1 "3178" V 4276 3550 50  0000 C CNN
F 2 "3178" H 6100 4050 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/1/3403.pdf" H 6100 3950 50  0001 L CNN
F 4 "Adafruit Feather M0 with RFM95 LoRa Radio - 900MHz - RadioFruit" H 6100 3850 50  0001 L CNN "Description"
F 5 "8" H 6100 3750 50  0001 L CNN "Height"
F 6 "485-3178" H 6100 3650 50  0001 L CNN "Mouser2 Part Number"
F 7 "https://www.mouser.com/Search/Refine.aspx?Keyword=485-3178" H 6100 3550 50  0001 L CNN "Mouser2 Price/Stock"
F 8 "Adafruit" H 6100 3450 50  0001 L CNN "Manufacturer_Name"
F 9 "3178" H 6100 3350 50  0001 L CNN "Manufacturer_Part_Number"
	1    4150 3650
	0    1    1    0   
$EndComp
Wire Wire Line
	4750 4650 5650 4650
Wire Wire Line
	4750 4450 5900 4450
Wire Wire Line
	5900 4450 5900 4400
Wire Wire Line
	5900 4400 6250 4400
Wire Wire Line
	4750 4150 5000 4150
Wire Wire Line
	4750 4250 5000 4250
Wire Wire Line
	4750 4350 5050 4350
Wire Wire Line
	4750 4750 5200 4750
Wire Wire Line
	4750 4850 5200 4850
Wire Wire Line
	4750 4950 5200 4950
Wire Wire Line
	4750 5050 5200 5050
Wire Wire Line
	4750 5150 5200 5150
Wire Wire Line
	4750 5250 5200 5250
Text Label 5000 4150 2    50   ~ 0
VBAT
Text Label 5000 4250 2    50   ~ 0
EN
Text Label 5000 4350 2    50   ~ 0
VUSB
Text Label 5000 4450 2    50   ~ 0
13
$Comp
L power:+5V #PWR017
U 1 1 62203E52
P 5050 4350
F 0 "#PWR017" H 5050 4200 50  0001 C CNN
F 1 "+5V" V 5065 4478 50  0000 L CNN
F 2 "" H 5050 4350 50  0001 C CNN
F 3 "" H 5050 4350 50  0001 C CNN
	1    5050 4350
	0    1    1    0   
$EndComp
Text GLabel 5200 4850 2    50   Input ~ 0
AuxOut
NoConn ~ 5000 4150
Text GLabel 5200 4550 2    50   Input ~ 0
Shutter
Text GLabel 5200 4750 2    50   Input ~ 0
Buzzer
Text GLabel 5200 4950 2    50   Input ~ 0
ArmInd
Text GLabel 5200 5050 2    50   Input ~ 0
SensorIn
Text Label 5000 5250 2    50   ~ 0
SDA
Text Label 5000 5150 2    50   ~ 0
SCL
Text Notes 4950 5050 0    50   ~ 0
5
Text Notes 4950 4950 0    50   ~ 0
6
Text Notes 4950 4850 0    50   ~ 0
9
Text Notes 4950 4750 0    50   ~ 0
10
Text Notes 4950 4650 0    50   ~ 0
11
Text Notes 4950 4550 0    50   ~ 0
12
Text Notes 4800 5050 0    50   ~ 0
21
Text Notes 4750 5150 0    50   ~ 0
20
Text GLabel 5650 4650 2    50   Input ~ 0
Focus
NoConn ~ 5000 4250
Text GLabel 5200 5250 2    50   Input ~ 0
SDA_qwiic
Text GLabel 5200 5150 2    50   Input ~ 0
SCL_qwiic
Wire Wire Line
	4750 4550 5200 4550
Text GLabel 2750 4450 0    50   Input ~ 0
ArmIn
$Comp
L power:GND #PWR015
U 1 1 62209666
P 2200 4300
F 0 "#PWR015" H 2200 4050 50  0001 C CNN
F 1 "GND" H 2205 4127 50  0000 C CNN
F 2 "" H 2200 4300 50  0001 C CNN
F 3 "" H 2200 4300 50  0001 C CNN
	1    2200 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 4300 2200 4250
Text Notes 3300 5350 0    50   ~ 0
1
Text Notes 3300 5250 0    50   ~ 0
0
Text Notes 2900 4750 0    50   ~ 0
18
Text Notes 2900 4650 0    50   ~ 0
17
Wire Wire Line
	2700 4650 3350 4650
Text Notes 2900 5150 0    50   ~ 0
22
Text Notes 2900 5050 0    50   ~ 0
23
Text Notes 2900 4950 0    50   ~ 0
24
Text Notes 2900 4850 0    50   ~ 0
19
Text Notes 2900 4550 0    50   ~ 0
16
Text Notes 2900 4450 0    50   ~ 0
15
Text Notes 2900 4350 0    50   ~ 0
14
Wire Wire Line
	2750 3950 3000 3950
$Comp
L power:PWR_FLAG #FLG01
U 1 1 6220967A
P 2750 3950
F 0 "#FLG01" H 2750 4025 50  0001 C CNN
F 1 "PWR_FLAG" H 2750 4123 50  0000 C CNN
F 2 "" H 2750 3950 50  0001 C CNN
F 3 "~" H 2750 3950 50  0001 C CNN
	1    2750 3950
	1    0    0    -1  
$EndComp
Text GLabel 2700 4650 0    50   Input ~ 0
AuxIn
Wire Wire Line
	2750 4550 3350 4550
Text Label 3150 5150 0    50   ~ 0
MISO
Text Label 3150 5250 0    50   ~ 0
RX
Text Label 3150 5350 0    50   ~ 0
TX
Text Label 3150 5450 0    50   ~ 0
FREE
Wire Wire Line
	3150 5450 3350 5450
NoConn ~ 3150 3950
NoConn ~ 3150 4150
Wire Wire Line
	2200 4250 3350 4250
Wire Wire Line
	2750 4450 3350 4450
Text GLabel 2750 4550 0    50   Input ~ 0
Poll
Wire Wire Line
	2750 4350 3350 4350
Text Label 3150 3950 0    50   ~ 0
~RST
Text Label 3150 4150 0    50   ~ 0
AREF
Wire Wire Line
	3150 3950 3350 3950
Wire Wire Line
	3150 4150 3350 4150
$Comp
L power:+3.3V #PWR016
U 1 1 62209694
P 3000 3950
F 0 "#PWR016" H 3000 3800 50  0001 C CNN
F 1 "+3.3V" H 3015 4123 50  0000 C CNN
F 2 "" H 3000 3950 50  0001 C CNN
F 3 "" H 3000 3950 50  0001 C CNN
	1    3000 3950
	1    0    0    -1  
$EndComp
Connection ~ 3000 3950
Wire Wire Line
	3000 3950 3000 4050
Wire Wire Line
	3000 4050 3350 4050
Text Label 3150 5050 0    50   ~ 0
MOSI
Text Label 3150 4950 0    50   ~ 0
SCK
Text Label 3150 4850 0    50   ~ 0
A5
Text Label 3150 4750 0    50   ~ 0
A4
Text Label 3150 4650 0    50   ~ 0
A3
Text Label 3150 4550 0    50   ~ 0
A2
Text Label 3150 4450 0    50   ~ 0
A1
Text Label 3150 4350 0    50   ~ 0
A0
Text GLabel 2750 4350 0    50   Input ~ 0
PbTrigIn
NoConn ~ 3750 5650
Wire Wire Line
	1850 4850 2800 4850
$Comp
L power:GND #PWR014
U 1 1 6223F040
P 1850 5550
F 0 "#PWR014" H 1850 5300 50  0001 C CNN
F 1 "GND" H 1855 5377 50  0000 C CNN
F 2 "" H 1850 5550 50  0001 C CNN
F 3 "" H 1850 5550 50  0001 C CNN
	1    1850 5550
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR012
U 1 1 6223FFE6
P 1850 4750
F 0 "#PWR012" H 1850 4600 50  0001 C CNN
F 1 "+3.3V" H 1865 4923 50  0000 C CNN
F 2 "" H 1850 4750 50  0001 C CNN
F 3 "" H 1850 4750 50  0001 C CNN
	1    1850 4750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR013
U 1 1 622003FF
P 1850 5450
F 0 "#PWR013" H 1850 5300 50  0001 C CNN
F 1 "+5V" V 1865 5578 50  0000 L CNN
F 2 "" H 1850 5450 50  0001 C CNN
F 3 "" H 1850 5450 50  0001 C CNN
	1    1850 5450
	0    1    1    0   
$EndComp
Wire Wire Line
	1850 4950 1900 4950
$Comp
L Connector:Conn_01x09_Male J4
U 1 1 6223808E
P 1650 5150
F 0 "J4" H 1758 5731 50  0000 C CNN
F 1 " " H 1758 5640 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x09_P2.54mm_Vertical" H 1650 5150 50  0001 C CNN
F 3 "~" H 1650 5150 50  0001 C CNN
	1    1650 5150
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x06_Male J3
U 1 1 62491028
P 750 5200
F 0 "J3" H 858 5781 50  0000 C CNN
F 1 " " H 858 5690 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 750 5200 50  0001 C CNN
F 3 "~" H 750 5200 50  0001 C CNN
	1    750  5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 4800 1750 4750
Wire Wire Line
	2150 4550 2150 4750
Wire Wire Line
	2150 4750 3350 4750
Connection ~ 1900 4950
Wire Wire Line
	1900 4950 3350 4950
Wire Wire Line
	950  5000 1100 5000
Wire Wire Line
	1100 5000 1100 4550
Wire Wire Line
	1100 4550 2150 4550
$Comp
L power:GND #PWR011
U 1 1 624BA3D8
P 950 5500
F 0 "#PWR011" H 950 5250 50  0001 C CNN
F 1 "GND" H 955 5327 50  0000 C CNN
F 2 "" H 950 5500 50  0001 C CNN
F 3 "" H 950 5500 50  0001 C CNN
	1    950  5500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR010
U 1 1 624BA938
P 950 5400
F 0 "#PWR010" H 950 5250 50  0001 C CNN
F 1 "+5V" V 965 5528 50  0000 L CNN
F 2 "" H 950 5400 50  0001 C CNN
F 3 "" H 950 5400 50  0001 C CNN
	1    950  5400
	0    1    1    0   
$EndComp
Wire Wire Line
	1900 4900 1900 4950
Wire Wire Line
	950  5100 1300 5100
Wire Wire Line
	1300 5100 1300 4900
Wire Wire Line
	1300 4900 1900 4900
Wire Wire Line
	1850 5050 1900 5050
Wire Wire Line
	1850 5350 3050 5350
Wire Wire Line
	1850 5250 2950 5250
Wire Wire Line
	1850 5150 1900 5150
Wire Wire Line
	950  5300 1350 5300
Wire Wire Line
	1350 5300 1350 5000
Wire Wire Line
	1350 5000 1900 5000
Wire Wire Line
	1900 5000 1900 5050
Connection ~ 1900 5050
Wire Wire Line
	1900 5050 3350 5050
Wire Wire Line
	950  5200 1500 5200
Wire Wire Line
	1500 5200 1500 5100
Wire Wire Line
	1500 5100 1900 5100
Wire Wire Line
	1900 5100 1900 5150
Connection ~ 1900 5150
Wire Wire Line
	1900 5150 3350 5150
Text GLabel 2700 5950 0    50   Input ~ 0
BLE_reset
Text GLabel 2450 6200 0    50   Input ~ 0
UART1_TX
Text GLabel 2450 6400 0    50   Input ~ 0
UART1_RX
Wire Wire Line
	2800 4850 2800 5950
Wire Wire Line
	2800 5950 2700 5950
Connection ~ 2800 4850
Wire Wire Line
	2800 4850 3350 4850
Wire Wire Line
	2450 6200 2950 6200
Wire Wire Line
	2950 6200 2950 5250
Connection ~ 2950 5250
Wire Wire Line
	2950 5250 3350 5250
Wire Wire Line
	2450 6400 3050 6400
Wire Wire Line
	3050 6400 3050 5350
Connection ~ 3050 5350
Wire Wire Line
	3050 5350 3350 5350
$EndSCHEMATC
