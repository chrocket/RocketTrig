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
L Device:LED D1
U 1 1 621EADF1
P 2750 3600
F 0 "D1" H 2743 3816 50  0000 C CNN
F 1 "Arm" H 2743 3725 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 2750 3600 50  0001 C CNN
F 3 "~" H 2750 3600 50  0001 C CNN
F 4 "" H 2750 3600 50  0001 C CNN "LCSC"
F 5 "C389521" H 2750 3600 50  0001 C CNN "LCSC"
	1    2750 3600
	-1   0    0    1   
$EndComp
$Comp
L Device:R R1
U 1 1 621EADF8
P 2250 3600
F 0 "R1" H 2320 3646 50  0000 L CNN
F 1 "1K" H 2320 3555 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2180 3600 50  0001 C CNN
F 3 "~" H 2250 3600 50  0001 C CNN
F 4 "C21190" H 2250 3600 50  0001 C CNN "LCSC"
	1    2250 3600
	0    1    1    0   
$EndComp
Text GLabel 1900 3600 0    50   Input ~ 0
ArmInd
$Comp
L power:GND #PWR07
U 1 1 621EADFF
P 3400 3950
F 0 "#PWR07" H 3400 3700 50  0001 C CNN
F 1 "GND" H 3405 3777 50  0000 C CNN
F 2 "" H 3400 3950 50  0001 C CNN
F 3 "" H 3400 3950 50  0001 C CNN
	1    3400 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 4000 3400 3950
Wire Wire Line
	2400 3600 2600 3600
Text GLabel 4200 3550 3    50   Input ~ 0
Laser
Wire Wire Line
	4200 3400 4200 3550
Wire Wire Line
	1900 3600 2100 3600
Connection ~ 3400 3950
$Comp
L Transistor_BJT:MMBT3904 Q1
U 1 1 621EAE0C
P 3300 3600
F 0 "Q1" H 3491 3646 50  0000 L CNN
F 1 "MMBT3904" H 3491 3555 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3500 3525 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 3300 3600 50  0001 L CNN
F 4 "C8512" H 3300 3600 50  0001 C CNN "LCSC"
	1    3300 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 3400 4200 3400
Wire Wire Line
	2900 3600 3100 3600
Wire Wire Line
	3400 3950 3400 3800
Wire Wire Line
	1650 2050 1700 2050
Connection ~ 1650 2050
Wire Wire Line
	1650 2050 1650 2900
Wire Wire Line
	1550 2050 1650 2050
Wire Wire Line
	1650 2900 1650 2950
Connection ~ 1650 2900
$Comp
L Connector:Conn_01x05_Male J1
U 1 1 621EAE1B
P 1750 3100
F 0 "J1" V 1904 2812 50  0000 R CNN
F 1 " " V 1813 2812 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 1750 3100 50  0001 C CNN
F 3 "~" H 1750 3100 50  0001 C CNN
	1    1750 3100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2650 2550 3100 2550
Connection ~ 2650 2550
$Comp
L Connector:TestPoint TP1
U 1 1 621EAE23
P 2650 2550
F 0 "TP1" H 2708 2668 50  0000 L CNN
F 1 "Sensor" H 2708 2577 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5000-5004_Miniature" H 2850 2550 50  0001 C CNN
F 3 "~" H 2850 2550 50  0001 C CNN
	1    2650 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 2900 2150 2900
Wire Wire Line
	2150 2550 2150 2700
Wire Wire Line
	1850 2700 2150 2700
Wire Wire Line
	1850 2900 1850 2700
Connection ~ 2150 2550
$Comp
L power:+3.3V #PWR03
U 1 1 621EAE2E
P 1750 2900
F 0 "#PWR03" H 1750 2750 50  0001 C CNN
F 1 "+3.3V" H 1765 3073 50  0000 C CNN
F 2 "" H 1750 2900 50  0001 C CNN
F 3 "" H 1750 2900 50  0001 C CNN
	1    1750 2900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR02
U 1 1 621EAE34
P 1550 2900
F 0 "#PWR02" H 1550 2750 50  0001 C CNN
F 1 "+5V" H 1565 3073 50  0000 C CNN
F 2 "" H 1550 2900 50  0001 C CNN
F 3 "" H 1550 2900 50  0001 C CNN
	1    1550 2900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 621EAE3A
P 2150 2900
F 0 "#PWR05" H 2150 2650 50  0001 C CNN
F 1 "GND" H 2155 2727 50  0000 C CNN
F 2 "" H 2150 2900 50  0001 C CNN
F 3 "" H 2150 2900 50  0001 C CNN
	1    2150 2900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_SPDT SW1
U 1 1 621EAE4A
P 3300 2550
F 0 "SW1" H 3300 2835 50  0000 C CNN
F 1 " " H 3300 2744 50  0000 C CNN
F 2 "Button_Switch_THT:SW_Slide_1P2T_CK_OS102011MS2Q" H 3300 2550 50  0001 C CNN
F 3 "~" H 3300 2550 50  0001 C CNN
	1    3300 2550
	1    0    0    -1  
$EndComp
Text Label 3850 2650 0    50   ~ 0
LowHigh
Text Label 3850 2450 0    50   ~ 0
HighLow
Wire Wire Line
	2150 2550 2650 2550
Text GLabel 3500 2650 2    50   Input ~ 0
SensorIn
Text GLabel 3500 2450 2    50   Input ~ 0
AuxIn
Wire Wire Line
	2150 2550 2150 2050
$Comp
L power:+3.3V #PWR04
U 1 1 621EAE56
P 1850 2250
F 0 "#PWR04" H 1850 2100 50  0001 C CNN
F 1 "+3.3V" H 1865 2423 50  0000 C CNN
F 2 "" H 1850 2250 50  0001 C CNN
F 3 "" H 1850 2250 50  0001 C CNN
	1    1850 2250
	-1   0    0    1   
$EndComp
Wire Wire Line
	2150 1950 2550 1950
$Comp
L power:GND #PWR06
U 1 1 621EAE5D
P 2550 1950
F 0 "#PWR06" H 2550 1700 50  0001 C CNN
F 1 "GND" H 2555 1777 50  0000 C CNN
F 2 "" H 2550 1950 50  0001 C CNN
F 3 "" H 2550 1950 50  0001 C CNN
	1    2550 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 1750 1500 1950
Wire Wire Line
	1500 1950 1550 1950
$Comp
L power:+5V #PWR01
U 1 1 621EAE65
P 1500 1750
F 0 "#PWR01" H 1500 1600 50  0001 C CNN
F 1 "+5V" H 1515 1923 50  0000 C CNN
F 2 "" H 1500 1750 50  0001 C CNN
F 3 "" H 1500 1750 50  0001 C CNN
	1    1500 1750
	1    0    0    -1  
$EndComp
Text GLabel 1550 2050 0    50   Input ~ 0
Laser
$Comp
L Connector:XLR5 J2
U 1 1 621EAE6C
P 1850 1950
F 0 "J2" H 1850 2315 50  0000 C CNN
F 1 "XLR5 Male" H 1850 2224 50  0000 C CNN
F 2 "SamacSys_Parts:Jack_XLR_Neutrik_NC5MBH_Horizontal" H 1850 1950 50  0001 C CNN
F 3 "https://www.mouser.com/ProductDetail/Neutrik/NC5MBH?qs=43pPWqpsSNtdT1Bh820Nxw%3D%3D" H 1850 1950 50  0001 C CNN
	1    1850 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6220C7A0
P 6750 3200
AR Path="/6220C7A0" Ref="#PWR?"  Part="1" 
AR Path="/621E1C5F/6220C7A0" Ref="#PWR09"  Part="1" 
F 0 "#PWR09" H 6750 2950 50  0001 C CNN
F 1 "GND" H 6755 3027 50  0000 C CNN
F 2 "" H 6750 3200 50  0001 C CNN
F 3 "" H 6750 3200 50  0001 C CNN
	1    6750 3200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6220C7A6
P 6300 3300
AR Path="/6220C7A6" Ref="#PWR?"  Part="1" 
AR Path="/621E1C5F/6220C7A6" Ref="#PWR08"  Part="1" 
F 0 "#PWR08" H 6300 3050 50  0001 C CNN
F 1 "GND" H 6305 3127 50  0000 C CNN
F 2 "" H 6300 3300 50  0001 C CNN
F 3 "" H 6300 3300 50  0001 C CNN
	1    6300 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 3300 6300 3100
Wire Wire Line
	6750 3100 6750 3200
Text GLabel 6150 2550 0    50   Input ~ 0
AuxIn
Text GLabel 6700 2450 0    50   Input ~ 0
SensorIn
Wire Wire Line
	6700 2450 6750 2450
Wire Wire Line
	6750 2450 6750 2800
Wire Wire Line
	6150 2550 6300 2550
Wire Wire Line
	6300 2550 6300 2800
$Comp
L Device:C C?
U 1 1 6220C7B5
P 6300 2950
AR Path="/6220C7B5" Ref="C?"  Part="1" 
AR Path="/621E1C5F/6220C7B5" Ref="C1"  Part="1" 
F 0 "C1" H 6415 2996 50  0000 L CNN
F 1 "0.01 μF" H 6415 2905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 6338 2800 50  0001 C CNN
F 3 "~" H 6300 2950 50  0001 C CNN
F 4 "C1525" H 6300 2950 50  0001 C CNN "LCSC"
	1    6300 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 6220C7BC
P 6750 2950
AR Path="/6220C7BC" Ref="C?"  Part="1" 
AR Path="/621E1C5F/6220C7BC" Ref="C2"  Part="1" 
F 0 "C2" H 6865 2996 50  0000 L CNN
F 1 "0.01 μF" H 6865 2905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 6788 2800 50  0001 C CNN
F 3 "~" H 6750 2950 50  0001 C CNN
F 4 "C1525" H 6750 2950 50  0001 C CNN "LCSC"
	1    6750 2950
	1    0    0    -1  
$EndComp
$EndSCHEMATC
