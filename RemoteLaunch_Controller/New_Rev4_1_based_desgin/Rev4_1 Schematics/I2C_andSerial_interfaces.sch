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
L power:GND #PWR027
U 1 1 6220C570
P 4500 3100
F 0 "#PWR027" H 4500 2850 50  0001 C CNN
F 1 "GND" H 4505 2927 50  0000 C CNN
F 2 "" H 4500 3100 50  0001 C CNN
F 3 "" H 4500 3100 50  0001 C CNN
	1    4500 3100
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x04 J6
U 1 1 6220C7F5
P 6150 2800
F 0 "J6" H 6230 2792 50  0000 L CNN
F 1 "qwiic" H 6230 2701 50  0000 L CNN
F 2 "Connector_JST:JST_SH_SM04B-SRSS-TB_1x04-1MP_P1.00mm_Horizontal" H 6150 2800 50  0001 C CNN
F 3 "~" H 6150 2800 50  0001 C CNN
F 4 "C160404" H 6150 2800 50  0001 C CNN "LCSC"
	1    6150 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 2700 4500 2700
Wire Wire Line
	4500 2700 4500 3100
Wire Wire Line
	5750 2900 5950 2900
Wire Wire Line
	5750 3000 5950 3000
$Comp
L power:+3.3V #PWR028
U 1 1 62211166
P 5750 2500
F 0 "#PWR028" H 5750 2350 50  0001 C CNN
F 1 "+3.3V" H 5765 2673 50  0000 C CNN
F 2 "" H 5750 2500 50  0001 C CNN
F 3 "" H 5750 2500 50  0001 C CNN
	1    5750 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 2500 5750 2800
Wire Wire Line
	5750 2800 5950 2800
Text GLabel 5750 3000 0    50   Input ~ 0
SCL_qwiic
Text GLabel 5750 2900 0    50   Input ~ 0
SDA_qwiic
$EndSCHEMATC
