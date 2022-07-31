EESchema Schematic File Version 4
LIBS:CameraTriggerSensorNodeOnly-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 7
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
L SparkFun_SchematicComponents:Qwiic_Connector J?
U 1 1 62215286
P 3350 2950
AR Path="/62215286" Ref="J?"  Part="1" 
AR Path="/62213C22/62215286" Ref="J?"  Part="1" 
F 0 "J?" H 3407 3317 50  0000 C CNN
F 1 "I2C" H 3407 3226 50  0000 C CNN
F 2 "TerminalBlock_TE-Connectivity:TerminalBlock_TE_282834-4_1x04_P2.54mm_Horizontal" H 3330 3050 20  0001 C CNN
F 3 "" H 3300 2900 60  0001 C CNN
	1    3350 2950
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 6221528C
P 4550 2650
AR Path="/6221528C" Ref="#PWR?"  Part="1" 
AR Path="/62213C22/6221528C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4550 2500 50  0001 C CNN
F 1 "+3.3V" H 4565 2823 50  0000 C CNN
F 2 "" H 4550 2650 50  0001 C CNN
F 3 "" H 4550 2650 50  0001 C CNN
	1    4550 2650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62215292
P 3650 3350
AR Path="/62215292" Ref="#PWR?"  Part="1" 
AR Path="/62213C22/62215292" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3650 3100 50  0001 C CNN
F 1 "GND" H 3655 3177 50  0000 C CNN
F 2 "" H 3650 3350 50  0001 C CNN
F 3 "" H 3650 3350 50  0001 C CNN
	1    3650 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 3100 3650 3100
Wire Wire Line
	3650 3100 3650 3350
Text GLabel 3850 2800 2    50   Input ~ 0
SCL_qwiic
Text GLabel 3850 2900 2    50   Input ~ 0
SDA_qwiic
Wire Wire Line
	3550 2900 3850 2900
Wire Wire Line
	3550 2800 3850 2800
Wire Wire Line
	4550 3000 4550 2650
Wire Wire Line
	3550 3000 4550 3000
$Comp
L Connector:Conn_01x04_Male J?
U 1 1 622152A0
P 3300 2300
AR Path="/622152A0" Ref="J?"  Part="1" 
AR Path="/62213C22/622152A0" Ref="J?"  Part="1" 
F 0 "J?" H 3408 2581 50  0000 C CNN
F 1 " " H 3408 2490 50  0000 C CNN
F 2 "19-237_R6GHBHC-A01_2T:HDRV4W64P0X254_1X4_1016X635X1067P" H 3300 2300 50  0001 C CNN
F 3 "~" H 3300 2300 50  0001 C CNN
	1    3300 2300
	1    0    0    -1  
$EndComp
Text GLabel 3500 2200 2    50   Input ~ 0
SCL_qwiic
Text GLabel 3500 2300 2    50   Input ~ 0
SDA_qwiic
$Comp
L power:GND #PWR?
U 1 1 622152A8
P 3500 2500
AR Path="/622152A8" Ref="#PWR?"  Part="1" 
AR Path="/62213C22/622152A8" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3500 2250 50  0001 C CNN
F 1 "GND" H 3505 2327 50  0000 C CNN
F 2 "" H 3500 2500 50  0001 C CNN
F 3 "" H 3500 2500 50  0001 C CNN
	1    3500 2500
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 622152AE
P 4150 2250
AR Path="/622152AE" Ref="#PWR?"  Part="1" 
AR Path="/62213C22/622152AE" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4150 2100 50  0001 C CNN
F 1 "+3.3V" H 4165 2423 50  0000 C CNN
F 2 "" H 4150 2250 50  0001 C CNN
F 3 "" H 4150 2250 50  0001 C CNN
	1    4150 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 2400 4150 2400
Wire Wire Line
	4150 2400 4150 2250
$Comp
L power:GND #PWR?
U 1 1 62215837
P 5950 3750
F 0 "#PWR?" H 5950 3500 50  0001 C CNN
F 1 "GND" H 5955 3577 50  0000 C CNN
F 2 "" H 5950 3750 50  0001 C CNN
F 3 "" H 5950 3750 50  0001 C CNN
	1    5950 3750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6221583D
P 5700 3000
F 0 "#PWR?" H 5700 2850 50  0001 C CNN
F 1 "+5V" H 5715 3173 50  0000 C CNN
F 2 "" H 5700 3000 50  0001 C CNN
F 3 "" H 5700 3000 50  0001 C CNN
	1    5700 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 3000 5700 3100
$Comp
L Connector:Screw_Terminal_01x04 J?
U 1 1 62215844
P 6150 3450
F 0 "J?" H 6230 3442 50  0000 L CNN
F 1 "Serial" H 6230 3351 50  0000 L CNN
F 2 "TerminalBlock_TE-Connectivity:TerminalBlock_TE_282834-4_1x04_P2.54mm_Horizontal" H 6150 3450 50  0001 C CNN
F 3 "~" H 6150 3450 50  0001 C CNN
	1    6150 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 3300 5950 3300
Wire Wire Line
	5950 3300 5950 3350
Wire Wire Line
	5950 3650 5950 3750
Text GLabel 4850 4250 2    50   Input ~ 0
Rx_serial
Text GLabel 4850 4350 2    50   Input ~ 0
Tx_serial
Wire Wire Line
	5750 3450 5950 3450
Wire Wire Line
	5750 3550 5950 3550
$Comp
L Connector:Conn_01x04_Male J?
U 1 1 62215851
P 4650 4250
F 0 "J?" H 4758 4531 50  0000 C CNN
F 1 "Conn_01x04_Male" H 4758 4440 50  0000 C CNN
F 2 "19-237_R6GHBHC-A01_2T:HDRV4W64P0X254_1X4_1016X635X1067P" H 4650 4250 50  0001 C CNN
F 3 "~" H 4650 4250 50  0001 C CNN
	1    4650 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 4150 5150 4150
Wire Wire Line
	5150 4150 5150 3100
Wire Wire Line
	5150 3100 5700 3100
Connection ~ 5700 3100
Wire Wire Line
	5700 3100 5700 3300
$Comp
L power:GND #PWR?
U 1 1 6221585C
P 4850 4450
F 0 "#PWR?" H 4850 4200 50  0001 C CNN
F 1 "GND" H 4855 4277 50  0000 C CNN
F 2 "" H 4850 4450 50  0001 C CNN
F 3 "" H 4850 4450 50  0001 C CNN
	1    4850 4450
	1    0    0    -1  
$EndComp
Text GLabel 5750 3450 0    50   Input ~ 0
Rx_serial
Text GLabel 5750 3550 0    50   Input ~ 0
Tx_serial
$EndSCHEMATC
