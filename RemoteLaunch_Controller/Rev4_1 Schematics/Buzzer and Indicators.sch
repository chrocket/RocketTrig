EESchema Schematic File Version 4
LIBS:CameraTriggerSensorNodeOnly-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 7
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
L Device:Buzzer BZ?
U 1 1 621FA6A9
P 5050 3250
AR Path="/621FA6A9" Ref="BZ?"  Part="1" 
AR Path="/621F5F45/621FA6A9" Ref="BZ1"  Part="1" 
F 0 "BZ1" H 5202 3279 50  0000 L CNN
F 1 "Buzzer" H 5202 3188 50  0000 L CNN
F 2 "Buzzer_Beeper:Buzzer_Murata_PKMCS0909E4000-R1" V 5025 3350 50  0001 C CNN
F 3 "https://www.mouser.com/ProductDetail/810-PS1240P02BT" V 5025 3350 50  0001 C CNN
F 4 "C255322" H 5050 3250 50  0001 C CNN "LCSC"
	1    5050 3250
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 621FA6B5
P 4600 3100
AR Path="/621FA6B5" Ref="#PWR?"  Part="1" 
AR Path="/621F5F45/621FA6B5" Ref="#PWR05"  Part="1" 
F 0 "#PWR05" H 4600 2950 50  0001 C CNN
F 1 "+3.3V" H 4615 3273 50  0000 C CNN
F 2 "" H 4600 3100 50  0001 C CNN
F 3 "" H 4600 3100 50  0001 C CNN
	1    4600 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 3100 4950 3100
Wire Wire Line
	4950 3100 4950 3150
Wire Wire Line
	4950 3350 4950 3400
Wire Wire Line
	4950 3400 4900 3400
$Comp
L Device:R R?
U 1 1 621FA6C6
P 4150 3600
AR Path="/621FA6C6" Ref="R?"  Part="1" 
AR Path="/621F5F45/621FA6C6" Ref="R2"  Part="1" 
F 0 "R2" H 4220 3646 50  0000 L CNN
F 1 "1K" H 4220 3555 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4080 3600 50  0001 C CNN
F 3 "~" H 4150 3600 50  0001 C CNN
F 4 "C21190" H 4150 3600 50  0001 C CNN "LCSC"
	1    4150 3600
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 621FA6CD
P 4600 3250
AR Path="/621FA6CD" Ref="R?"  Part="1" 
AR Path="/621F5F45/621FA6CD" Ref="R3"  Part="1" 
F 0 "R3" H 4670 3296 50  0000 L CNN
F 1 "1K" H 4670 3205 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4530 3250 50  0001 C CNN
F 3 "~" H 4600 3250 50  0001 C CNN
F 4 "C21190" H 4600 3250 50  0001 C CNN "LCSC"
	1    4600 3250
	-1   0    0    1   
$EndComp
Connection ~ 4600 3100
Wire Wire Line
	4900 3400 4900 3900
Connection ~ 4900 3400
Wire Wire Line
	4900 3400 4600 3400
Wire Wire Line
	4300 3600 4350 3600
Wire Wire Line
	4350 3600 4350 4100
Wire Wire Line
	4350 4100 4600 4100
$Comp
L power:GND #PWR?
U 1 1 621FA6DA
P 4900 4300
AR Path="/621FA6DA" Ref="#PWR?"  Part="1" 
AR Path="/621F5F45/621FA6DA" Ref="#PWR06"  Part="1" 
F 0 "#PWR06" H 4900 4050 50  0001 C CNN
F 1 "GND" H 4905 4127 50  0000 C CNN
F 2 "" H 4900 4300 50  0001 C CNN
F 3 "" H 4900 4300 50  0001 C CNN
	1    4900 4300
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:MMBT3904 Q?
U 1 1 621FA6E1
P 4800 4100
AR Path="/621FA6E1" Ref="Q?"  Part="1" 
AR Path="/621F5F45/621FA6E1" Ref="Q1"  Part="1" 
F 0 "Q1" H 4991 4146 50  0000 L CNN
F 1 "2SC1815" H 4991 4055 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5000 4025 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 4800 4100 50  0001 L CNN
F 4 " C181171 " H 4800 4100 50  0001 C CNN "LCSC"
	1    4800 4100
	1    0    0    -1  
$EndComp
Text GLabel 4000 3600 0    50   Input ~ 0
Buzzer
$EndSCHEMATC
