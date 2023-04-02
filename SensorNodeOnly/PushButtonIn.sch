EESchema Schematic File Version 4
LIBS:CameraTriggerSensorNodeOnly-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 7
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
L Switch:SW_Push SW3
U 1 1 62216905
P 2900 3550
F 0 "SW3" H 2900 3835 50  0000 C CNN
F 1 "SW_Poll" H 2900 3744 50  0000 C CNN
F 2 "Button_Switch_THT:KSA_Tactile_SPST" H 2900 3750 50  0001 C CNN
F 3 "~http://www.ckswitches.com/media/1457/ksa_ksl.pdf" H 2900 3750 50  0001 C CNN
	1    2900 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR044
U 1 1 6221690B
P 2700 3550
F 0 "#PWR044" H 2700 3300 50  0001 C CNN
F 1 "GND" H 2705 3377 50  0000 C CNN
F 2 "" H 2700 3550 50  0001 C CNN
F 3 "" H 2700 3550 50  0001 C CNN
	1    2700 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR047
U 1 1 62216911
P 3200 2950
F 0 "#PWR047" H 3200 2700 50  0001 C CNN
F 1 "GND" H 3205 2777 50  0000 C CNN
F 2 "" H 3200 2950 50  0001 C CNN
F 3 "" H 3200 2950 50  0001 C CNN
	1    3200 2950
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR046
U 1 1 62216917
P 3200 2100
F 0 "#PWR046" H 3200 1950 50  0001 C CNN
F 1 "+3.3V" H 3215 2273 50  0000 C CNN
F 2 "" H 3200 2100 50  0001 C CNN
F 3 "" H 3200 2100 50  0001 C CNN
	1    3200 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 2100 3200 2500
Wire Wire Line
	3200 2800 3200 2950
$Comp
L Device:R_POT RV1
U 1 1 6221691F
P 3200 2650
F 0 "RV1" H 3130 2696 50  0000 R CNN
F 1 "1K" H 3130 2605 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Alps_RK09K_Single_Vertical" H 3200 2650 50  0001 C CNN
F 3 "https://www.mouser.com/ProductDetail/ALPS/RK09K1130A8G?qs=sGAEpiMZZMtC25l1F4XBU3JeeCo7XMTlBi0F3pTrQUE%3D" H 3200 2650 50  0001 C CNN
	1    3200 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 2650 3550 2650
$Comp
L Switch:SW_Push SW4
U 1 1 62216926
P 2900 4150
F 0 "SW4" H 2900 4435 50  0000 C CNN
F 1 "SW_Arm" H 2900 4344 50  0000 C CNN
F 2 "Button_Switch_THT:KSA_Tactile_SPST" H 2900 4350 50  0001 C CNN
F 3 "~http://www.ckswitches.com/media/1457/ksa_ksl.pdf" H 2900 4350 50  0001 C CNN
	1    2900 4150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR045
U 1 1 6221692C
P 2700 4150
F 0 "#PWR045" H 2700 3900 50  0001 C CNN
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
Text GLabel 3550 2650 2    50   Input ~ 0
Threshold
$Comp
L Device:C C8
U 1 1 6221693A
P 3350 3350
F 0 "C8" H 3465 3396 50  0000 L CNN
F 1 "0.01 μF" H 3465 3305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 3388 3200 50  0001 C CNN
F 3 "~" H 3350 3350 50  0001 C CNN
F 4 "C1525" H 3350 3350 50  0001 C CNN "LCSC"
	1    3350 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 62216941
P 3100 4000
F 0 "C7" H 3215 4046 50  0000 L CNN
F 1 "0.01 μF" H 3215 3955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 3138 3850 50  0001 C CNN
F 3 "~" H 3100 4000 50  0001 C CNN
F 4 "C1525" H 3100 4000 50  0001 C CNN "LCSC"
	1    3100 4000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR050
U 1 1 62216947
P 3900 3200
F 0 "#PWR050" H 3900 2950 50  0001 C CNN
F 1 "GND" H 3905 3027 50  0000 C CNN
F 2 "" H 3900 3200 50  0001 C CNN
F 3 "" H 3900 3200 50  0001 C CNN
	1    3900 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 3200 3900 3200
$Comp
L power:GND #PWR048
U 1 1 6221694E
P 3650 3850
F 0 "#PWR048" H 3650 3600 50  0001 C CNN
F 1 "GND" H 3655 3677 50  0000 C CNN
F 2 "" H 3650 3850 50  0001 C CNN
F 3 "" H 3650 3850 50  0001 C CNN
	1    3650 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 3850 3650 3850
Text GLabel 3800 4450 2    50   Input ~ 0
ANALOG_IN
Wire Wire Line
	3750 4350 3750 4250
Wire Wire Line
	3800 4450 3750 4450
$Comp
L power:GND #PWR049
U 1 1 62216958
P 3750 4250
F 0 "#PWR049" H 3750 4000 50  0001 C CNN
F 1 "GND" H 3755 4077 50  0000 C CNN
F 2 "" H 3750 4250 50  0001 C CNN
F 3 "" H 3750 4250 50  0001 C CNN
	1    3750 4250
	-1   0    0    1   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J9
U 1 1 6221695E
P 3550 4450
F 0 "J9" H 3630 4442 50  0000 L CNN
F 1 "Analog in" H 3630 4351 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_PT-1,5-2-3.5-H_1x02_P3.50mm_Horizontal" H 3550 4450 50  0001 C CNN
F 3 "~https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1308389_EUROSTYLE_TERMINAL_BLOCKS&DocType=CS&DocLang=English" H 3550 4450 50  0001 C CNN
	1    3550 4450
	-1   0    0    1   
$EndComp
$EndSCHEMATC
