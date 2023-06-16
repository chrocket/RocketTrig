EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 5
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
L Connector:Screw_Terminal_01x02 J1
U 1 1 64846963
P 1950 1650
F 0 "J1" V 1914 1462 50  0000 R CNN
F 1 "Anderson Powerpole" V 1823 1462 50  0000 R CNN
F 2 "" H 1950 1650 50  0001 C CNN
F 3 "~" H 1950 1650 50  0001 C CNN
	1    1950 1650
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J2
U 1 1 64846BBB
P 1950 2250
F 0 "J2" V 1914 2062 50  0000 R CNN
F 1 "AMASS XT-60E-M" V 1823 2062 50  0000 R CNN
F 2 "" H 1950 2250 50  0001 C CNN
F 3 "~" H 1950 2250 50  0001 C CNN
	1    1950 2250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1950 1850 1750 1850
Wire Wire Line
	1750 1850 1750 2450
Wire Wire Line
	1750 2450 1950 2450
Connection ~ 1750 2450
Wire Wire Line
	1750 2450 1750 2750
$Comp
L power:+12V #PWR01
U 1 1 6484706A
P 1600 2750
F 0 "#PWR01" H 1600 2600 50  0001 C CNN
F 1 "+12V" H 1615 2923 50  0000 C CNN
F 2 "" H 1600 2750 50  0001 C CNN
F 3 "" H 1600 2750 50  0001 C CNN
	1    1600 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 2750 1750 2750
Wire Wire Line
	2050 1850 3000 1850
Wire Wire Line
	3000 1850 3000 2450
Wire Wire Line
	2050 2450 3000 2450
Connection ~ 3000 2450
Wire Wire Line
	3000 2450 3000 2950
$Comp
L Device:Fuse F1
U 1 1 64847D7B
P 3000 3100
F 0 "F1" H 3060 3146 50  0000 L CNN
F 1 "20A Fuse" H 3060 3055 50  0000 L CNN
F 2 "" V 2930 3100 50  0001 C CNN
F 3 "~" H 3000 3100 50  0001 C CNN
	1    3000 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:D D1
U 1 1 64848447
P 3000 3400
F 0 "D1" V 2954 3479 50  0000 L CNN
F 1 "25HFR120 Reverse polarity" V 3045 3479 50  0000 L CNN
F 2 "" H 3000 3400 50  0001 C CNN
F 3 "~" H 3000 3400 50  0001 C CNN
	1    3000 3400
	0    1    1    0   
$EndComp
$Comp
L Switch:SW_SPST SW1
U 1 1 64848F1F
P 3000 3750
F 0 "SW1" V 2954 3848 50  0000 L CNN
F 1 "Master Power" V 3045 3848 50  0000 L CNN
F 2 "" H 3000 3750 50  0001 C CNN
F 3 "~" H 3000 3750 50  0001 C CNN
	1    3000 3750
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR02
U 1 1 64849B36
P 3000 3950
F 0 "#PWR02" H 3000 3700 50  0001 C CNN
F 1 "GND" H 3005 3777 50  0000 C CNN
F 2 "" H 3000 3950 50  0001 C CNN
F 3 "" H 3000 3950 50  0001 C CNN
	1    3000 3950
	1    0    0    -1  
$EndComp
$Sheet
S 6600 1450 1850 1250
U 6485AA59
F0 "sheet6485AA50" 50
F1 "file64855F82.sch" 50
F2 "+12" I L 6600 1700 50 
F3 "Gnd" I L 6600 1800 50 
F4 "Relay-White" I L 6600 2050 50 
F5 "Relay-Black" I L 6600 2000 50 
F6 "SMA-Antenna" I L 6600 2300 50 
F7 "LED-Armed-Pos" I R 8450 1750 50 
F8 "LED-Armed-Neg" I R 8450 2100 50 
F9 "PB-Arm" I R 8450 2300 50 
F10 "PB-Disarm" I R 8450 2400 50 
F11 "PB-Fire" I R 8450 2550 50 
$EndSheet
$Comp
L Device:LED D?
U 1 1 6485AA5F
P 9350 1850
AR Path="/648467F0/6485AA5F" Ref="D?"  Part="1" 
AR Path="/648467B2/6485AA5F" Ref="D?"  Part="1" 
F 0 "D?" V 9389 1732 50  0000 R CNN
F 1 "LED Armed Indicator" V 9298 1732 50  0000 R CNN
F 2 "" H 9350 1850 50  0001 C CNN
F 3 "~" H 9350 1850 50  0001 C CNN
	1    9350 1850
	0    -1   -1   0   
$EndComp
Text GLabel 9300 1550 0    50   Input ~ 0
LED-Armed-Pos
Text GLabel 9350 2200 0    50   Input ~ 0
LED-Armed-Neg
Wire Wire Line
	9300 1550 9350 1550
Wire Wire Line
	9350 1550 9350 1700
Wire Wire Line
	9350 2200 9350 2000
$Comp
L Switch:SW_Push Arm-15sec
U 1 1 6485AED2
P 6950 3850
F 0 "Arm-15sec" H 6950 4135 50  0000 C CNN
F 1 "SW_Push" H 6950 4044 50  0000 C CNN
F 2 "" H 6950 4050 50  0001 C CNN
F 3 "~" H 6950 4050 50  0001 C CNN
	1    6950 3850
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_SPST SW?
U 1 1 6485B0E5
P 7050 4500
F 0 "SW?" H 7050 4735 50  0000 C CNN
F 1 "Disarm" H 7050 4644 50  0000 C CNN
F 2 "" H 7050 4500 50  0001 C CNN
F 3 "~" H 7050 4500 50  0001 C CNN
	1    7050 4500
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW?
U 1 1 6485B55E
P 7050 5150
F 0 "SW?" H 7050 5435 50  0000 C CNN
F 1 "Fire" H 7050 5344 50  0000 C CNN
F 2 "" H 7050 5350 50  0001 C CNN
F 3 "~" H 7050 5350 50  0001 C CNN
	1    7050 5150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6485B776
P 6750 3900
F 0 "#PWR?" H 6750 3650 50  0001 C CNN
F 1 "GND" H 6755 3727 50  0000 C CNN
F 2 "" H 6750 3900 50  0001 C CNN
F 3 "" H 6750 3900 50  0001 C CNN
	1    6750 3900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6485BAFC
P 6850 4500
F 0 "#PWR?" H 6850 4250 50  0001 C CNN
F 1 "GND" H 6855 4327 50  0000 C CNN
F 2 "" H 6850 4500 50  0001 C CNN
F 3 "" H 6850 4500 50  0001 C CNN
	1    6850 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6485BDB7
P 6850 5200
F 0 "#PWR?" H 6850 4950 50  0001 C CNN
F 1 "GND" H 6855 5027 50  0000 C CNN
F 2 "" H 6850 5200 50  0001 C CNN
F 3 "" H 6850 5200 50  0001 C CNN
	1    6850 5200
	1    0    0    -1  
$EndComp
Text GLabel 8250 3850 2    50   Input ~ 0
PB-Arm
Text GLabel 8200 4500 2    50   Input ~ 0
PB-Disarm
Text GLabel 8200 5150 2    50   Input ~ 0
PB-Fire
Wire Wire Line
	7100 3850 7150 3850
Wire Wire Line
	7250 4500 8200 4500
Wire Wire Line
	7250 5150 7350 5150
$Comp
L Connector:AudioJack3 J?
U 1 1 6485DBBD
P 7850 4800
F 0 "J?" H 7832 5125 50  0000 C CNN
F 1 "AudioJack3" H 7832 5034 50  0000 C CNN
F 2 "" H 7850 4800 50  0001 C CNN
F 3 "~" H 7850 4800 50  0001 C CNN
	1    7850 4800
	-1   0    0    1   
$EndComp
Connection ~ 7150 3850
Wire Wire Line
	7650 4800 7350 4800
$Comp
L power:GND #PWR?
U 1 1 6485FBF6
P 7650 4900
F 0 "#PWR?" H 7650 4650 50  0001 C CNN
F 1 "GND" H 7655 4727 50  0000 C CNN
F 2 "" H 7650 4900 50  0001 C CNN
F 3 "" H 7650 4900 50  0001 C CNN
	1    7650 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 3850 8250 3850
Wire Wire Line
	7350 4800 7350 5150
Connection ~ 7350 5150
Wire Wire Line
	7350 5150 8200 5150
$EndSCHEMATC
