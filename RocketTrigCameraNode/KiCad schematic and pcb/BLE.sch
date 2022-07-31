EESchema Schematic File Version 4
LIBS:CameraTriggerSensorNodeOnly-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 10 10
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
L RF_Bluetooth:RN4871 U5
U 1 1 5FE17E1D
P 5250 3050
F 0 "U5" H 5250 3831 50  0000 C CNN
F 1 "RN4871" H 5250 3740 50  0000 C CNN
F 2 "RF_Module:Microchip_RN4871" H 5250 2350 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/50002489A.pdf" H 4750 3600 50  0001 C CNN
	1    5250 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 2750 4550 2750
Wire Wire Line
	4350 2850 4550 2850
$Comp
L Device:LED_Small D?
U 1 1 5FEAFDDC
P 3300 3575
AR Path="/5F78726A/5FEAFDDC" Ref="D?"  Part="1" 
AR Path="/5FDFDAEC/5FEAFDDC" Ref="D?"  Part="1" 
AR Path="/5FE15022/5FEAFDDC" Ref="D?"  Part="1" 
AR Path="/624CA218/5FEAFDDC" Ref="D51"  Part="1" 
F 0 "D51" V 3350 3500 50  0000 R CNN
F 1 "BLUE" V 3250 3500 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric" V 3300 3575 50  0001 C CNN
F 3 "~" V 3300 3575 50  0001 C CNN
F 4 "C72041" H 3300 3575 50  0001 C CNN "LCSC"
	1    3300 3575
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5FEAFDE6
P 3300 3875
AR Path="/5F78726A/5FEAFDE6" Ref="R?"  Part="1" 
AR Path="/5FDFDAEC/5FEAFDE6" Ref="R?"  Part="1" 
AR Path="/5FE15022/5FEAFDE6" Ref="R?"  Part="1" 
AR Path="/624CA218/5FEAFDE6" Ref="R51"  Part="1" 
F 0 "R51" H 3200 3825 50  0000 C CNN
F 1 "1k5" H 3175 3925 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 3300 3875 50  0001 C CNN
F 3 "~" H 3300 3875 50  0001 C CNN
F 4 "C22843" H 3300 3875 50  0001 C CNN "LCSC"
	1    3300 3875
	-1   0    0    1   
$EndComp
Wire Wire Line
	3300 3775 3300 3675
Wire Wire Line
	3300 3375 3300 3475
Wire Wire Line
	3400 3375 3300 3375
Text GLabel 3400 3375 2    50   Input ~ 0
LED_TXRX
Text GLabel 4550 3250 0    50   Input ~ 0
LED_TXRX
Wire Wire Line
	5250 1750 5250 1800
$Comp
L Device:C C51
U 1 1 5FEB1562
P 5600 2200
F 0 "C51" H 5715 2246 50  0000 L CNN
F 1 "100n" H 5715 2155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 5638 2050 50  0001 C CNN
F 3 "~" H 5600 2200 50  0001 C CNN
F 4 "C1525" H 5600 2200 50  0001 C CNN "LCSC"
	1    5600 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 2050 5600 2050
Wire Wire Line
	5250 2050 5250 2450
Wire Wire Line
	4450 3150 4550 3150
Text GLabel 4350 2750 0    50   Input ~ 0
UART1_TX
Text GLabel 4350 2850 0    50   Input ~ 0
UART1_RX
Text GLabel 4450 3150 0    50   Input ~ 0
BLE_reset
NoConn ~ 5950 2850
NoConn ~ 5950 2950
NoConn ~ 5950 3050
NoConn ~ 5950 3150
NoConn ~ 5950 3250
NoConn ~ 5950 3350
NoConn ~ 4550 3350
NoConn ~ 4550 2950
NoConn ~ 5950 2750
Wire Wire Line
	3300 3975 3300 4100
Wire Wire Line
	5150 3650 5250 3650
$Comp
L power:GND #PWR061
U 1 1 624A5388
P 5600 2350
F 0 "#PWR061" H 5600 2100 50  0001 C CNN
F 1 "GND" H 5605 2177 50  0000 C CNN
F 2 "" H 5600 2350 50  0001 C CNN
F 3 "" H 5600 2350 50  0001 C CNN
	1    5600 2350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR060
U 1 1 624A58E2
P 5250 3650
F 0 "#PWR060" H 5250 3400 50  0001 C CNN
F 1 "GND" H 5255 3477 50  0000 C CNN
F 2 "" H 5250 3650 50  0001 C CNN
F 3 "" H 5250 3650 50  0001 C CNN
	1    5250 3650
	1    0    0    -1  
$EndComp
Connection ~ 5250 3650
Wire Wire Line
	5250 3650 5350 3650
$Comp
L power:GND #PWR058
U 1 1 624A5ACE
P 3300 4100
F 0 "#PWR058" H 3300 3850 50  0001 C CNN
F 1 "GND" H 3305 3927 50  0000 C CNN
F 2 "" H 3300 4100 50  0001 C CNN
F 3 "" H 3300 4100 50  0001 C CNN
	1    3300 4100
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR059
U 1 1 624A5DB4
P 5250 1750
F 0 "#PWR059" H 5250 1600 50  0001 C CNN
F 1 "+3.3V" H 5265 1923 50  0000 C CNN
F 2 "" H 5250 1750 50  0001 C CNN
F 3 "" H 5250 1750 50  0001 C CNN
	1    5250 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R13
U 1 1 624ABADC
P 5250 1900
F 0 "R13" H 5320 1946 50  0000 L CNN
F 1 "0" H 5320 1855 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 5180 1900 50  0001 C CNN
F 3 "~" H 5250 1900 50  0001 C CNN
F 4 "C269749" H 5250 1900 50  0001 C CNN "LCSC"
	1    5250 1900
	1    0    0    -1  
$EndComp
Connection ~ 5250 1750
Connection ~ 5250 2050
$EndSCHEMATC
