EESchema Schematic File Version 4
LIBS:CameraTriggerSensorNodeOnly-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 7
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
L CameraTriggerSensorNodeOnly-rescue:3178-SamacSys_Parts IC1
U 1 1 621FF2E6
P 4150 3650
AR Path="/621FF2E6" Ref="IC1"  Part="1" 
AR Path="/621ECC98/621FF2E6" Ref="IC1"  Part="1" 
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
	4750 5150 4950 5150
Wire Wire Line
	4750 5250 5150 5250
Text Label 5000 4150 2    50   ~ 0
VBAT
Text Label 5000 4250 2    50   ~ 0
EN
Text Label 5000 4350 2    50   ~ 0
VUSB
Text Label 5000 4450 2    50   ~ 0
13
$Comp
L power:+5V #PWR03
U 1 1 62203E52
P 5050 4350
F 0 "#PWR03" H 5050 4200 50  0001 C CNN
F 1 "+5V" V 5065 4478 50  0000 L CNN
F 2 "" H 5050 4350 50  0001 C CNN
F 3 "" H 5050 4350 50  0001 C CNN
	1    5050 4350
	0    1    1    0   
$EndComp
NoConn ~ 5000 4150
Text GLabel 5200 4550 2    50   Input ~ 0
Shutter
Text GLabel 5200 4750 2    50   Input ~ 0
Buzzer
Text Label 5000 5250 2    50   ~ 0
SDA
Text Label 5000 5150 2    50   ~ 0
SCL
Text Notes 5000 5050 0    50   ~ 0
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
Text Notes 4850 5050 0    50   ~ 0
21
Text Notes 4750 5150 0    50   ~ 0
20
NoConn ~ 5000 4250
Text GLabel 5200 5250 2    50   Input ~ 0
SDA_qwiic
Text GLabel 5200 5150 2    50   Input ~ 0
SCL_qwiic
Wire Wire Line
	4750 4550 5200 4550
$Comp
L power:GND #PWR01
U 1 1 62209666
P 2200 4300
F 0 "#PWR01" H 2200 4050 50  0001 C CNN
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
Text Label 3150 5150 0    50   ~ 0
MISO
Text Label 3150 5450 0    50   ~ 0
FREE
Wire Wire Line
	3150 5450 3350 5450
NoConn ~ 3150 3950
NoConn ~ 3150 4150
Wire Wire Line
	2200 4250 3350 4250
Text Label 3150 3950 0    50   ~ 0
~RST
Text Label 3150 4150 0    50   ~ 0
AREF
Wire Wire Line
	3150 3950 3350 3950
Wire Wire Line
	3150 4150 3350 4150
$Comp
L power:+3.3V #PWR02
U 1 1 62209694
P 3000 3950
F 0 "#PWR02" H 3000 3800 50  0001 C CNN
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
NoConn ~ 3750 5650
Text GLabel 5200 4850 2    50   Input ~ 0
INTA
Text GLabel 5200 4950 2    50   Input ~ 0
INTB
Text GLabel 5900 4400 2    50   Input ~ 0
IN_1
Text GLabel 2750 4450 0    50   Input ~ 0
IN_2
Text GLabel 4750 5050 2    50   Input ~ 0
OUT_1
Text GLabel 2750 4650 0    50   Input ~ 0
OUT_2
Wire Wire Line
	2750 4450 3350 4450
Wire Wire Line
	2750 4550 3350 4550
Wire Wire Line
	2750 4650 3350 4650
$Comp
L Device:R R11
U 1 1 64850E83
P 4950 5550
F 0 "R11" H 5020 5596 50  0000 L CNN
F 1 "10K" H 5020 5505 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4880 5550 50  0001 C CNN
F 3 "~" H 4950 5550 50  0001 C CNN
F 4 "C25804" H 4950 5550 50  0001 C CNN "LCSC"
	1    4950 5550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 6485140D
P 5150 5550
F 0 "R12" H 5220 5596 50  0000 L CNN
F 1 "10K" H 5220 5505 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5080 5550 50  0001 C CNN
F 3 "~" H 5150 5550 50  0001 C CNN
F 4 "C25804" H 5150 5550 50  0001 C CNN "LCSC"
	1    5150 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 5700 5050 5700
Wire Wire Line
	4950 5150 4950 5400
Connection ~ 4950 5150
Wire Wire Line
	4950 5150 5200 5150
Wire Wire Line
	5150 5250 5150 5400
Connection ~ 5150 5250
Wire Wire Line
	5150 5250 5200 5250
$Comp
L power:+3.3V #PWR035
U 1 1 64853C82
P 5050 5850
F 0 "#PWR035" H 5050 5700 50  0001 C CNN
F 1 "+3.3V" V 5065 5978 50  0000 L CNN
F 2 "" H 5050 5850 50  0001 C CNN
F 3 "" H 5050 5850 50  0001 C CNN
	1    5050 5850
	0    1    1    0   
$EndComp
Wire Wire Line
	5050 5700 5050 5850
Connection ~ 5050 5700
Wire Wire Line
	5050 5700 5150 5700
$Comp
L Connector:Conn_01x08_Female J9
U 1 1 64880341
P 2000 5150
F 0 "J9" H 1892 4525 50  0000 C CNN
F 1 "Misc" H 1892 4616 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 2000 5150 50  0001 C CNN
F 3 "~" H 2000 5150 50  0001 C CNN
	1    2000 5150
	-1   0    0    1   
$EndComp
Wire Wire Line
	3350 4750 2200 4750
Wire Wire Line
	3350 4850 2200 4850
Wire Wire Line
	3350 4950 2200 4950
Wire Wire Line
	3350 5050 2200 5050
Wire Wire Line
	3350 5150 2200 5150
Wire Wire Line
	3350 5250 2200 5250
Wire Wire Line
	3350 5350 2200 5350
Wire Wire Line
	2200 5450 2200 5650
$Comp
L power:GND #PWR039
U 1 1 64889578
P 2200 5650
F 0 "#PWR039" H 2200 5400 50  0001 C CNN
F 1 "GND" H 2205 5477 50  0000 C CNN
F 2 "" H 2200 5650 50  0001 C CNN
F 3 "" H 2200 5650 50  0001 C CNN
	1    2200 5650
	1    0    0    -1  
$EndComp
NoConn ~ 3150 5450
$Comp
L Connector:TestPoint TP5
U 1 1 6483C274
P 3250 6200
F 0 "TP5" H 3308 6318 50  0000 L CNN
F 1 "Gnd" H 3308 6227 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5000-5004_Miniature" H 3450 6200 50  0001 C CNN
F 3 "~" H 3450 6200 50  0001 C CNN
	1    3250 6200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR045
U 1 1 6483C686
P 3250 6200
F 0 "#PWR045" H 3250 5950 50  0001 C CNN
F 1 "GND" H 3255 6027 50  0000 C CNN
F 2 "" H 3250 6200 50  0001 C CNN
F 3 "" H 3250 6200 50  0001 C CNN
	1    3250 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 3650 7000 3650
$Comp
L Device:LED D6
U 1 1 6487EB08
P 7150 3650
F 0 "D6" H 7143 3395 50  0000 C CNN
F 1 "LED" H 7143 3486 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7150 3650 50  0001 C CNN
F 3 "~" H 7150 3650 50  0001 C CNN
F 4 "" H 7150 3650 50  0001 C CNN "LCSC"
	1    7150 3650
	-1   0    0    1   
$EndComp
$Comp
L Device:R R13
U 1 1 6487EB01
P 7650 3650
F 0 "R13" V 7443 3650 50  0000 C CNN
F 1 "750" V 7534 3650 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7580 3650 50  0001 C CNN
F 3 "~" H 7650 3650 50  0001 C CNN
F 4 "C23241" V 7650 3650 50  0001 C CNN "LCSC"
	1    7650 3650
	0    1    1    0   
$EndComp
Wire Wire Line
	7300 3650 7500 3650
$Comp
L power:GND #PWR040
U 1 1 6487EAF9
P 7900 3900
F 0 "#PWR040" H 7900 3650 50  0001 C CNN
F 1 "GND" H 7905 3727 50  0000 C CNN
F 2 "" H 7900 3900 50  0001 C CNN
F 3 "" H 7900 3900 50  0001 C CNN
	1    7900 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 3650 7900 3900
Wire Wire Line
	7800 3650 7900 3650
Text GLabel 5650 4650 2    50   Input ~ 0
Focus
Wire Wire Line
	6850 3000 7200 3000
Wire Wire Line
	5900 4450 5900 4400
Wire Wire Line
	4750 4450 5900 4450
$Comp
L Device:LED D1
U 1 1 622114CD
P 7350 3000
F 0 "D1" H 7343 2745 50  0000 C CNN
F 1 "LED Trig" H 7343 2836 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7350 3000 50  0001 C CNN
F 3 "~" H 7350 3000 50  0001 C CNN
F 4 "" H 7350 3000 50  0001 C CNN "LCSC"
	1    7350 3000
	-1   0    0    1   
$EndComp
$Comp
L Device:R R1
U 1 1 622114C6
P 7850 3000
F 0 "R1" V 7643 3000 50  0000 C CNN
F 1 "750" V 7734 3000 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7780 3000 50  0001 C CNN
F 3 "~" H 7850 3000 50  0001 C CNN
F 4 "C23241" V 7850 3000 50  0001 C CNN "LCSC"
	1    7850 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	7500 3000 7700 3000
$Comp
L power:GND #PWR04
U 1 1 622114BE
P 8100 3250
F 0 "#PWR04" H 8100 3000 50  0001 C CNN
F 1 "GND" H 8105 3077 50  0000 C CNN
F 2 "" H 8100 3250 50  0001 C CNN
F 3 "" H 8100 3250 50  0001 C CNN
	1    8100 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 3000 8100 3250
Wire Wire Line
	8000 3000 8100 3000
Text GLabel 6850 3000 0    50   Input ~ 0
D_1
Text GLabel 5700 3650 0    50   Input ~ 0
D_2
Text GLabel 2750 4550 0    50   Input ~ 0
D_2
Text GLabel 2750 4350 0    50   Input ~ 0
D_1
Wire Wire Line
	2750 4350 3350 4350
$EndSCHEMATC
