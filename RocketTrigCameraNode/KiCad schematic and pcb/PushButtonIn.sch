EESchema Schematic File Version 4
LIBS:CameraTriggerSensorNodeOnly-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 10
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
L Switch:SW_Push SW4
U 1 1 62216905
P 2900 3550
F 0 "SW4" H 2900 3835 50  0000 C CNN
F 1 "SW_Poll" H 2900 3744 50  0000 C CNN
F 2 "Button_Switch_THT:KSA_Tactile_SPST" H 2900 3750 50  0001 C CNN
F 3 "~http://www.ckswitches.com/media/1457/ksa_ksl.pdf" H 2900 3750 50  0001 C CNN
	1    2900 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR041
U 1 1 6221690B
P 2700 3550
F 0 "#PWR041" H 2700 3300 50  0001 C CNN
F 1 "GND" H 2705 3377 50  0000 C CNN
F 2 "" H 2700 3550 50  0001 C CNN
F 3 "" H 2700 3550 50  0001 C CNN
	1    2700 3550
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW5
U 1 1 62216926
P 2900 4150
F 0 "SW5" H 2900 4435 50  0000 C CNN
F 1 "SW_Arm" H 2900 4344 50  0000 C CNN
F 2 "Button_Switch_THT:KSA_Tactile_SPST" H 2900 4350 50  0001 C CNN
F 3 "~http://www.ckswitches.com/media/1457/ksa_ksl.pdf" H 2900 4350 50  0001 C CNN
	1    2900 4150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR042
U 1 1 6221692C
P 2700 4150
F 0 "#PWR042" H 2700 3900 50  0001 C CNN
F 1 "GND" H 2705 3977 50  0000 C CNN
F 2 "" H 2700 4150 50  0001 C CNN
F 3 "" H 2700 4150 50  0001 C CNN
	1    2700 4150
	1    0    0    -1  
$EndComp
Text GLabel 3100 4150 2    50   Input ~ 0
ArmIn
Wire Wire Line
	3350 3550 3850 3550
Wire Wire Line
	3100 3550 3350 3550
Connection ~ 3350 3550
Wire Wire Line
	3350 3550 3350 3500
Text GLabel 3850 3550 2    50   Input ~ 0
Poll
$Comp
L Device:C C9
U 1 1 6221693A
P 3350 3350
F 0 "C9" H 3465 3396 50  0000 L CNN
F 1 "0.01 μF" H 3465 3305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 3388 3200 50  0001 C CNN
F 3 "~" H 3350 3350 50  0001 C CNN
F 4 "C1525" H 3350 3350 50  0001 C CNN "LCSC"
	1    3350 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C8
U 1 1 62216941
P 3100 4000
F 0 "C8" H 3215 4046 50  0000 L CNN
F 1 "0.01 μF" H 3215 3955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 3138 3850 50  0001 C CNN
F 3 "~" H 3100 4000 50  0001 C CNN
F 4 "C1525" H 3100 4000 50  0001 C CNN "LCSC"
	1    3100 4000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR046
U 1 1 62216947
P 3900 3200
F 0 "#PWR046" H 3900 2950 50  0001 C CNN
F 1 "GND" H 3905 3027 50  0000 C CNN
F 2 "" H 3900 3200 50  0001 C CNN
F 3 "" H 3900 3200 50  0001 C CNN
	1    3900 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 3200 3900 3200
$Comp
L power:GND #PWR045
U 1 1 6221694E
P 3650 3850
F 0 "#PWR045" H 3650 3600 50  0001 C CNN
F 1 "GND" H 3655 3677 50  0000 C CNN
F 2 "" H 3650 3850 50  0001 C CNN
F 3 "" H 3650 3850 50  0001 C CNN
	1    3650 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 3850 3650 3850
$Comp
L Switch:SW_Push SW3
U 1 1 6220DD19
P 2550 2250
F 0 "SW3" H 2550 2535 50  0000 C CNN
F 1 "SW_trig" H 2550 2444 50  0000 C CNN
F 2 "Button_Switch_THT:KSA_Tactile_SPST" H 2550 2450 50  0001 C CNN
F 3 "~http://www.ckswitches.com/media/1457/ksa_ksl.pdf" H 2550 2450 50  0001 C CNN
	1    2550 2250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR040
U 1 1 6220DD1F
P 2350 2250
F 0 "#PWR040" H 2350 2000 50  0001 C CNN
F 1 "GND" H 2355 2077 50  0000 C CNN
F 2 "" H 2350 2250 50  0001 C CNN
F 3 "" H 2350 2250 50  0001 C CNN
	1    2350 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 2250 3150 2250
Wire Wire Line
	2750 2250 3000 2250
Connection ~ 3000 2250
Wire Wire Line
	3000 2250 3000 2200
$Comp
L Device:C C7
U 1 1 6220DD2B
P 3000 2050
F 0 "C7" H 3115 2096 50  0000 L CNN
F 1 "0.01 μF" H 3115 2005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 3038 1900 50  0001 C CNN
F 3 "~" H 3000 2050 50  0001 C CNN
F 4 "C1525" H 3000 2050 50  0001 C CNN "LCSC"
	1    3000 2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR044
U 1 1 6220DD31
P 3550 1900
F 0 "#PWR044" H 3550 1650 50  0001 C CNN
F 1 "GND" H 3555 1727 50  0000 C CNN
F 2 "" H 3550 1900 50  0001 C CNN
F 3 "" H 3550 1900 50  0001 C CNN
	1    3550 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 1900 3550 1900
Text GLabel 3500 2250 2    50   Input ~ 0
PbTrigIn
$Comp
L Connector:Screw_Terminal_01x02 J7
U 1 1 6220EDA0
P 2800 2600
F 0 "J7" H 2880 2592 50  0000 L CNN
F 1 "Trig in" H 2880 2501 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_PT-1,5-2-3.5-H_1x02_P3.50mm_Horizontal" H 2800 2600 50  0001 C CNN
F 3 "~https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1308389_EUROSTYLE_TERMINAL_BLOCKS&DocType=CS&DocLang=English" H 2800 2600 50  0001 C CNN
	1    2800 2600
	-1   0    0    1   
$EndComp
Wire Wire Line
	3000 2500 3150 2500
Wire Wire Line
	3150 2500 3150 2250
Connection ~ 3150 2250
Wire Wire Line
	3150 2250 3500 2250
$Comp
L power:GND #PWR043
U 1 1 6220F2D6
P 3000 2600
F 0 "#PWR043" H 3000 2350 50  0001 C CNN
F 1 "GND" H 3005 2427 50  0000 C CNN
F 2 "" H 3000 2600 50  0001 C CNN
F 3 "" H 3000 2600 50  0001 C CNN
	1    3000 2600
	1    0    0    -1  
$EndComp
$EndSCHEMATC
