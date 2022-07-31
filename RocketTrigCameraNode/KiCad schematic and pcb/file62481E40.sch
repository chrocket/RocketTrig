EESchema Schematic File Version 4
LIBS:CameraTriggerSensorNodeOnly-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 9 10
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
L 4xxx:4050 U4
U 7 1 62481FA7
P 4000 4000
F 0 "U4" H 4230 4046 50  0000 L CNN
F 1 "CD4050BDR" H 4230 3955 50  0000 L CNN
F 2 "Package_SO:SOP-16_4.4x10.4mm_P1.27mm" H 4000 4000 50  0001 C CNN
F 3 "http://www.intersil.com/content/dam/intersil/documents/cd40/cd4050bms.pdf" H 4000 4000 50  0001 C CNN
F 4 "C352821" H 4000 4000 50  0001 C CNN "LCSC"
	7    4000 4000
	1    0    0    -1  
$EndComp
$Comp
L 4xxx:4050 U4
U 1 1 6248257C
P 4250 1550
F 0 "U4" H 4250 1867 50  0000 C CNN
F 1 "CD4050BDR" H 4250 1776 50  0000 C CNN
F 2 "Package_SO:SOP-16_4.4x10.4mm_P1.27mm" H 4250 1550 50  0001 C CNN
F 3 "http://www.intersil.com/content/dam/intersil/documents/cd40/cd4050bms.pdf" H 4250 1550 50  0001 C CNN
F 4 "C352821" H 4250 1550 50  0001 C CNN "LCSC"
	1    4250 1550
	1    0    0    -1  
$EndComp
$Comp
L 4xxx:4050 U4
U 2 1 62482C7A
P 4300 2050
F 0 "U4" H 4300 2367 50  0000 C CNN
F 1 "CD4050BDR" H 4300 2276 50  0000 C CNN
F 2 "Package_SO:SOP-16_4.4x10.4mm_P1.27mm" H 4300 2050 50  0001 C CNN
F 3 "http://www.intersil.com/content/dam/intersil/documents/cd40/cd4050bms.pdf" H 4300 2050 50  0001 C CNN
	2    4300 2050
	1    0    0    -1  
$EndComp
$Comp
L 4xxx:4050 U4
U 3 1 6248341F
P 4250 2550
F 0 "U4" H 4250 2867 50  0000 C CNN
F 1 "CD4050BDR" H 4250 2776 50  0000 C CNN
F 2 "Package_SO:SOP-16_4.4x10.4mm_P1.27mm" H 4250 2550 50  0001 C CNN
F 3 "http://www.intersil.com/content/dam/intersil/documents/cd40/cd4050bms.pdf" H 4250 2550 50  0001 C CNN
	3    4250 2550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR057
U 1 1 62485251
P 8950 2700
F 0 "#PWR057" H 8950 2450 50  0001 C CNN
F 1 "GND" H 8955 2527 50  0000 C CNN
F 2 "" H 8950 2700 50  0001 C CNN
F 3 "" H 8950 2700 50  0001 C CNN
	1    8950 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR056
U 1 1 62485A7B
P 7100 2800
F 0 "#PWR056" H 7100 2550 50  0001 C CNN
F 1 "GND" H 7105 2627 50  0000 C CNN
F 2 "" H 7100 2800 50  0001 C CNN
F 3 "" H 7100 2800 50  0001 C CNN
	1    7100 2800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR054
U 1 1 62485F54
P 4000 4500
F 0 "#PWR054" H 4000 4250 50  0001 C CNN
F 1 "GND" H 4005 4327 50  0000 C CNN
F 2 "" H 4000 4500 50  0001 C CNN
F 3 "" H 4000 4500 50  0001 C CNN
	1    4000 4500
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR053
U 1 1 62486305
P 4000 3500
F 0 "#PWR053" H 4000 3350 50  0001 C CNN
F 1 "+3.3V" H 4015 3673 50  0000 C CNN
F 2 "" H 4000 3500 50  0001 C CNN
F 3 "" H 4000 3500 50  0001 C CNN
	1    4000 3500
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR055
U 1 1 62486A31
P 7000 1450
F 0 "#PWR055" H 7000 1300 50  0001 C CNN
F 1 "+3.3V" H 7015 1623 50  0000 C CNN
F 2 "" H 7000 1450 50  0001 C CNN
F 3 "" H 7000 1450 50  0001 C CNN
	1    7000 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 1450 7000 2100
Wire Wire Line
	7000 2100 7250 2100
Wire Wire Line
	4550 2550 7000 2550
Wire Wire Line
	7000 2550 7000 2200
Wire Wire Line
	7000 2200 7250 2200
$Comp
L Connector:Micro_SD_Card J11
U 1 1 62483B7E
P 8150 2100
F 0 "J11" H 8100 2817 50  0000 C CNN
F 1 "Micro_SD_Card" H 8100 2726 50  0000 C CNN
F 2 "Connector_Card:microSD_HC_Hirose_DM3AT-SF-PEJM5" H 9300 2400 50  0001 C CNN
F 3 "http://katalog.we-online.de/em/datasheet/693072010801.pdf" H 8150 2100 50  0001 C CNN
F 4 "C114218" H 8150 2100 50  0001 C CNN "LCSC"
	1    8150 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 2800 7100 2300
Wire Wire Line
	7100 2300 7250 2300
Wire Wire Line
	7250 2400 6300 2400
Wire Wire Line
	6300 2400 6300 1750
Text GLabel 6300 1750 0    50   Input ~ 0
SD_Data_out
Text GLabel 3950 2550 0    50   Input ~ 0
SD_CLK
Wire Wire Line
	7250 2500 5000 2500
Wire Wire Line
	5000 2500 5000 2050
Wire Wire Line
	5000 2050 4600 2050
Text GLabel 4000 2050 0    50   Input ~ 0
SD_Data_in
Wire Wire Line
	4550 1550 5550 1550
Wire Wire Line
	5550 1550 5550 2000
Wire Wire Line
	5550 2000 7250 2000
Text GLabel 3950 1550 0    50   Input ~ 0
SD_CS
NoConn ~ 7250 1800
NoConn ~ 7250 1900
Text GLabel 3350 1100 0    50   Input ~ 0
SD_CS
Text GLabel 3300 1250 0    50   Input ~ 0
SD_Data_in
Text GLabel 3250 1400 0    50   Input ~ 0
SD_CLK
Wire Wire Line
	3350 1100 3500 1100
Wire Wire Line
	3300 1250 3500 1250
Wire Wire Line
	3250 1400 3450 1400
NoConn ~ 3500 1100
NoConn ~ 3500 1250
NoConn ~ 3450 1400
$EndSCHEMATC
