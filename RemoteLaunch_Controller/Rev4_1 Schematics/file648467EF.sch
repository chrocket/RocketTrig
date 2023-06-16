EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 5
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
L Relay:G6E K?
U 1 1 6484A65E
P 2500 3150
F 0 "K?" H 2930 3196 50  0000 L CNN
F 1 "Automotive Relay" H 2930 3105 50  0000 L CNN
F 2 "Relay_THT:Relay_SPDT_Omron_G6E" H 3630 3120 50  0001 C CNN
F 3 "https://www.omron.com/ecb/products/pdf/en-g6e.pdf" H 2500 3150 50  0001 C CNN
	1    2500 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 2850 2300 2850
Wire Wire Line
	2300 3450 1700 3450
$Comp
L power:+12V #PWR?
U 1 1 6484B4C8
P 4350 2400
F 0 "#PWR?" H 4350 2250 50  0001 C CNN
F 1 "+12V" H 4365 2573 50  0000 C CNN
F 2 "" H 4350 2400 50  0001 C CNN
F 3 "" H 4350 2400 50  0001 C CNN
	1    4350 2400
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J?
U 1 1 6484B805
P 5200 2250
F 0 "J?" V 5164 2062 50  0000 R CNN
F 1 "Ignitor - Anderson Powerpole" V 5073 2062 50  0000 R CNN
F 2 "" H 5200 2250 50  0001 C CNN
F 3 "~" H 5200 2250 50  0001 C CNN
	1    5200 2250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4850 2450 5200 2450
$Comp
L power:GND #PWR?
U 1 1 6484BFAB
P 4850 2450
F 0 "#PWR?" H 4850 2200 50  0001 C CNN
F 1 "GND" H 4855 2277 50  0000 C CNN
F 2 "" H 4850 2450 50  0001 C CNN
F 3 "" H 4850 2450 50  0001 C CNN
	1    4850 2450
	-1   0    0    1   
$EndComp
Text GLabel 1650 2850 0    50   Input ~ 0
Relay-White
Text GLabel 1700 3450 0    50   Input ~ 0
Relay-Black
Wire Wire Line
	2800 2400 2800 2850
Wire Wire Line
	2700 3550 3700 3550
Wire Wire Line
	3700 2400 3700 2550
$Comp
L Device:LED D?
U 1 1 6484EA12
P 3700 2700
F 0 "D?" V 3739 2583 50  0000 R CNN
F 1 "LED" V 3648 2583 50  0000 R CNN
F 2 "" H 3700 2700 50  0001 C CNN
F 3 "~" H 3700 2700 50  0001 C CNN
	1    3700 2700
	0    -1   -1   0   
$EndComp
$Comp
L Switch:SW_Push SW?
U 1 1 6484EE93
P 3700 3050
F 0 "SW?" V 3654 3198 50  0000 L CNN
F 1 "SW_Push" V 3745 3198 50  0000 L CNN
F 2 "" H 3700 3250 50  0001 C CNN
F 3 "~" H 3700 3250 50  0001 C CNN
	1    3700 3050
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 6484F9EC
P 3700 3400
F 0 "R?" H 3770 3446 50  0000 L CNN
F 1 "1K" H 3770 3355 50  0000 L CNN
F 2 "" V 3630 3400 50  0001 C CNN
F 3 "~" H 3700 3400 50  0001 C CNN
	1    3700 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 2450 5300 3550
Wire Wire Line
	2700 3450 2700 3550
$Comp
L Switch:SW_SPST Toggle
U 1 1 6485069C
P 4000 2400
F 0 "Toggle" H 4000 2635 50  0000 C CNN
F 1 "Safety" H 4000 2544 50  0000 C CNN
F 2 "" H 4000 2400 50  0001 C CNN
F 3 "~" H 4000 2400 50  0001 C CNN
	1    4000 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 3500 3700 3550
Connection ~ 3700 3550
Wire Wire Line
	3700 3550 5300 3550
Wire Wire Line
	4200 2400 4350 2400
Wire Wire Line
	3700 2400 3800 2400
Connection ~ 3700 2400
Wire Wire Line
	2800 2400 3700 2400
$Comp
L Connector:Screw_Terminal_01x02 J?
U 1 1 64855927
P 8150 1500
AR Path="/648467B2/64855927" Ref="J?"  Part="1" 
AR Path="/648467F0/64855927" Ref="J?"  Part="1" 
F 0 "J?" V 8114 1312 50  0000 R CNN
F 1 "Anderson Powerpole" V 8023 1312 50  0000 R CNN
F 2 "" H 8150 1500 50  0001 C CNN
F 3 "~" H 8150 1500 50  0001 C CNN
	1    8150 1500
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J?
U 1 1 6485592D
P 8150 2100
AR Path="/648467B2/6485592D" Ref="J?"  Part="1" 
AR Path="/648467F0/6485592D" Ref="J?"  Part="1" 
F 0 "J?" V 8114 1912 50  0000 R CNN
F 1 "AMASS XT-60E-M" V 8023 1912 50  0000 R CNN
F 2 "" H 8150 2100 50  0001 C CNN
F 3 "~" H 8150 2100 50  0001 C CNN
	1    8150 2100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8150 1700 7950 1700
Wire Wire Line
	7950 1700 7950 2300
Wire Wire Line
	7950 2300 8150 2300
Connection ~ 7950 2300
Wire Wire Line
	7950 2300 7950 2600
$Comp
L power:+12V #PWR?
U 1 1 64855938
P 7800 2600
AR Path="/648467B2/64855938" Ref="#PWR?"  Part="1" 
AR Path="/648467F0/64855938" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7800 2450 50  0001 C CNN
F 1 "+12V" H 7815 2773 50  0000 C CNN
F 2 "" H 7800 2600 50  0001 C CNN
F 3 "" H 7800 2600 50  0001 C CNN
	1    7800 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 2600 7950 2600
Wire Wire Line
	8250 1700 9200 1700
Wire Wire Line
	9200 1700 9200 2300
Wire Wire Line
	8250 2300 9200 2300
Connection ~ 9200 2300
Wire Wire Line
	9200 2300 9200 2800
$Comp
L Device:Fuse F?
U 1 1 64855944
P 9200 2950
AR Path="/648467B2/64855944" Ref="F?"  Part="1" 
AR Path="/648467F0/64855944" Ref="F?"  Part="1" 
F 0 "F?" H 9260 2996 50  0000 L CNN
F 1 "20A Fuse" H 9260 2905 50  0000 L CNN
F 2 "" V 9130 2950 50  0001 C CNN
F 3 "~" H 9200 2950 50  0001 C CNN
	1    9200 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:D D?
U 1 1 6485594A
P 9200 3250
AR Path="/648467B2/6485594A" Ref="D?"  Part="1" 
AR Path="/648467F0/6485594A" Ref="D?"  Part="1" 
F 0 "D?" V 9154 3329 50  0000 L CNN
F 1 "25HFR120 Reverse polarity" V 9245 3329 50  0000 L CNN
F 2 "" H 9200 3250 50  0001 C CNN
F 3 "~" H 9200 3250 50  0001 C CNN
	1    9200 3250
	0    1    1    0   
$EndComp
$Comp
L Switch:SW_SPST SW?
U 1 1 64855950
P 9200 3600
AR Path="/648467B2/64855950" Ref="SW?"  Part="1" 
AR Path="/648467F0/64855950" Ref="SW?"  Part="1" 
F 0 "SW?" V 9154 3698 50  0000 L CNN
F 1 "Master Power" V 9245 3698 50  0000 L CNN
F 2 "" H 9200 3600 50  0001 C CNN
F 3 "~" H 9200 3600 50  0001 C CNN
	1    9200 3600
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 64855956
P 9200 3800
AR Path="/648467B2/64855956" Ref="#PWR?"  Part="1" 
AR Path="/648467F0/64855956" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9200 3550 50  0001 C CNN
F 1 "GND" H 9205 3627 50  0000 C CNN
F 2 "" H 9200 3800 50  0001 C CNN
F 3 "" H 9200 3800 50  0001 C CNN
	1    9200 3800
	1    0    0    -1  
$EndComp
$Sheet
S 5200 4850 1850 1250
U 64855F83
F0 "CameraTrig Board" 50
F1 "file64855F82.sch" 50
F2 "+12" I L 5200 5100 50 
F3 "Gnd" I L 5200 5200 50 
F4 "Relay-White" I L 5200 5450 50 
F5 "Relay-Black" I L 5200 5400 50 
F6 "SMA-Antenna" I L 5200 5700 50 
F7 "LED-Armed-Pos" I R 7050 5150 50 
F8 "LED-Armed-Neg" I R 7050 5500 50 
$EndSheet
$Comp
L Device:LED D?
U 1 1 648580E1
P 7950 5250
F 0 "D?" V 7989 5132 50  0000 R CNN
F 1 "LED Armed Indicator" V 7898 5132 50  0000 R CNN
F 2 "" H 7950 5250 50  0001 C CNN
F 3 "~" H 7950 5250 50  0001 C CNN
	1    7950 5250
	0    -1   -1   0   
$EndComp
Text GLabel 7900 4950 0    50   Input ~ 0
LED-Armed-Pos
Text GLabel 7950 5600 0    50   Input ~ 0
LED-Armed-Neg
Wire Wire Line
	7900 4950 7950 4950
Wire Wire Line
	7950 4950 7950 5100
Wire Wire Line
	7950 5600 7950 5400
$EndSCHEMATC
