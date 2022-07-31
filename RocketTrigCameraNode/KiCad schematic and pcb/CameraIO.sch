EESchema Schematic File Version 4
LIBS:CameraTriggerSensorNodeOnly-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 10
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
L Connector:AudioJack3 J8
U 1 1 622178CA
P 6700 3600
F 0 "J8" H 6420 3533 50  0000 R CNN
F 1 "Camera 3.5mm" H 6420 3624 50  0000 R CNN
F 2 "Connector_Audio:Jack_3.5mm_CUI_SJ1-3533NG_Horizontal_CircularHoles" H 6700 3600 50  0001 C CNN
F 3 "~https://www.mouser.com/datasheet/2/670/sj1-353xng-1313133.pdf" H 6700 3600 50  0001 C CNN
	1    6700 3600
	-1   0    0    1   
$EndComp
Wire Wire Line
	6500 3500 6500 2900
$Comp
L Connector:AudioJack3 J9
U 1 1 622178D8
P 6800 2200
F 0 "J9" H 6520 2133 50  0000 R CNN
F 1 "Camera 2.5mm" H 6520 2224 50  0000 R CNN
F 2 "CameraTriggerPCB:CUI_SJ1-2503A" H 6800 2200 50  0001 C CNN
F 3 "~" H 6800 2200 50  0001 C CNN
	1    6800 2200
	-1   0    0    1   
$EndComp
Wire Wire Line
	7500 4400 7500 2750
Wire Wire Line
	7500 2750 6450 2750
Wire Wire Line
	6450 2750 6450 2200
Wire Wire Line
	6450 2200 6600 2200
Wire Wire Line
	7750 4500 7750 2450
Wire Wire Line
	7750 2450 6600 2450
$Comp
L power:GND #PWR050
U 1 1 6221790E
P 4800 5600
F 0 "#PWR050" H 4800 5350 50  0001 C CNN
F 1 "GND" H 4805 5427 50  0000 C CNN
F 2 "" H 4800 5600 50  0001 C CNN
F 3 "" H 4800 5600 50  0001 C CNN
	1    4800 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 5300 4800 5600
$Comp
L power:+5V #PWR049
U 1 1 62217919
P 4550 3500
F 0 "#PWR049" H 4550 3350 50  0001 C CNN
F 1 "+5V" H 4565 3673 50  0000 C CNN
F 2 "" H 4550 3500 50  0001 C CNN
F 3 "" H 4550 3500 50  0001 C CNN
	1    4550 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 3500 4600 3500
$Comp
L power:GND #PWR048
U 1 1 62217926
P 4450 3150
F 0 "#PWR048" H 4450 2900 50  0001 C CNN
F 1 "GND" H 4455 2977 50  0000 C CNN
F 2 "" H 4450 3150 50  0001 C CNN
F 3 "" H 4450 3150 50  0001 C CNN
	1    4450 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 3000 4450 3150
Wire Wire Line
	4450 2600 4700 2600
Wire Wire Line
	4700 2600 4700 3000
$Comp
L Isolator:ILD74 U3
U 1 1 62217930
P 5500 2000
F 0 "U3" H 5500 2325 50  0000 C CNN
F 1 "ILD74" H 5500 2234 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 5300 1800 50  0001 L CIN
F 3 "https://www.vishay.com/docs/83640/ild74.pdf" H 5500 2000 50  0001 L CNN
	1    5500 2000
	1    0    0    -1  
$EndComp
$Comp
L Isolator:ILD74 U3
U 2 1 62217936
P 5500 2500
F 0 "U3" H 5500 2825 50  0000 C CNN
F 1 "ILD74" H 5500 2734 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 5300 2300 50  0001 L CIN
F 3 "https://www.vishay.com/docs/83640/ild74.pdf" H 5500 2500 50  0001 L CNN
	2    5500 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 3000 5200 3000
Wire Wire Line
	5200 3000 5200 2600
Wire Wire Line
	5200 2400 5200 2100
Wire Wire Line
	4850 1900 4850 2250
Wire Wire Line
	4850 2250 4650 2250
Wire Wire Line
	6050 2350 6050 2100
Wire Wire Line
	6050 2100 5800 2100
Wire Wire Line
	5800 2400 6300 2400
Wire Wire Line
	6300 2400 6300 2900
Wire Wire Line
	6300 2900 6500 2900
Wire Wire Line
	5900 2600 5800 2600
Wire Wire Line
	5900 2600 5900 3700
$Comp
L Device:R R10
U 1 1 6221794B
P 4750 3500
F 0 "R10" V 4543 3500 50  0000 C CNN
F 1 "51" V 4634 3500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4680 3500 50  0001 C CNN
F 3 "~" H 4750 3500 50  0001 C CNN
F 4 " C880145 " V 4750 3500 50  0001 C CNN "LCSC"
	1    4750 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	5400 4500 7750 4500
Wire Wire Line
	5400 4400 7500 4400
$Comp
L Isolator:ILD74 U2
U 1 1 62217953
P 5100 4400
F 0 "U2" H 5100 4725 50  0000 C CNN
F 1 "ILD74" H 5100 4634 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 4900 4200 50  0001 L CIN
F 3 "https://www.vishay.com/docs/83640/ild74.pdf" H 5100 4400 50  0001 L CNN
	1    5100 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 3500 4950 3500
Wire Wire Line
	4950 3500 4950 3550
Wire Wire Line
	4950 3750 4950 4050
Wire Wire Line
	4950 4050 4800 4050
Wire Wire Line
	4800 4050 4800 4300
$Comp
L Isolator:ILD74 U2
U 2 1 6221795E
P 5250 3650
F 0 "U2" H 5250 3975 50  0000 C CNN
F 1 "ILD74" H 5250 3884 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 5050 3450 50  0001 L CIN
F 3 "https://www.vishay.com/docs/83640/ild74.pdf" H 5250 3650 50  0001 L CNN
	2    5250 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 3600 5700 3600
Wire Wire Line
	5700 3600 5700 3550
Wire Wire Line
	5700 3550 5550 3550
Wire Wire Line
	5400 4400 5400 4300
Wire Wire Line
	5900 3700 5550 3700
Wire Wire Line
	5550 3700 5550 3750
$Comp
L Device:R R8
U 1 1 6221796B
P 4200 2200
F 0 "R8" V 3993 2200 50  0000 C CNN
F 1 "51" V 4084 2200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4130 2200 50  0001 C CNN
F 3 "~" H 4200 2200 50  0001 C CNN
F 4 " C880145 " V 4200 2200 50  0001 C CNN "LCSC"
	1    4200 2200
	0    1    1    0   
$EndComp
Wire Wire Line
	4350 2200 4650 2200
Wire Wire Line
	4650 2200 4650 2250
Wire Wire Line
	6600 2100 6100 2100
Wire Wire Line
	6100 2100 6100 2050
Wire Wire Line
	6100 2050 5800 2050
Wire Wire Line
	5800 2050 5800 1900
$Comp
L Device:LED D?
U 1 1 62221DE6
P 3650 5100
AR Path="/62221DE6" Ref="D?"  Part="1" 
AR Path="/62202BC8/62221DE6" Ref="D?"  Part="1" 
AR Path="/621D0B8B/62221DE6" Ref="D6"  Part="1" 
F 0 "D6" V 3689 4983 50  0000 R CNN
F 1 "LED Focus" V 3598 4983 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 3650 5100 50  0001 C CNN
F 3 "~" H 3650 5100 50  0001 C CNN
	1    3650 5100
	-1   0    0    1   
$EndComp
Text GLabel 3450 5100 0    50   Input ~ 0
Focus
Wire Wire Line
	3450 5100 3500 5100
$Comp
L Device:LED D?
U 1 1 62233CB2
P 3450 2800
AR Path="/62233CB2" Ref="D?"  Part="1" 
AR Path="/62202BC8/62233CB2" Ref="D?"  Part="1" 
AR Path="/621D0B8B/62233CB2" Ref="D5"  Part="1" 
F 0 "D5" H 3443 2545 50  0000 C CNN
F 1 "LED Trig" H 3443 2636 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 3450 2800 50  0001 C CNN
F 3 "~" H 3450 2800 50  0001 C CNN
	1    3450 2800
	-1   0    0    1   
$EndComp
Text GLabel 2950 2800 0    50   Input ~ 0
Shutter
Wire Wire Line
	4100 2800 4150 2800
Wire Wire Line
	3600 2800 3800 2800
Wire Wire Line
	3150 2250 3150 2800
Connection ~ 3150 2800
Wire Wire Line
	3150 2800 3300 2800
Wire Wire Line
	3100 2800 3150 2800
Wire Wire Line
	2950 2800 3150 2800
$Comp
L power:+5V #PWR?
U 1 1 622481D0
P 3700 2150
AR Path="/622481D0" Ref="#PWR?"  Part="1" 
AR Path="/62202BC8/622481D0" Ref="#PWR?"  Part="1" 
AR Path="/621D0B8B/622481D0" Ref="#PWR047"  Part="1" 
F 0 "#PWR047" H 3700 2000 50  0001 C CNN
F 1 "+5V" H 3715 2323 50  0000 C CNN
F 2 "" H 3700 2150 50  0001 C CNN
F 3 "" H 3700 2150 50  0001 C CNN
	1    3700 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 2150 3700 2250
Wire Wire Line
	3700 2250 4050 2250
Wire Wire Line
	4050 2250 4050 2200
$Comp
L Connector:TestPoint TP4Fire?
U 1 1 622481D9
P 3150 2250
AR Path="/622481D9" Ref="TP4Fire?"  Part="1" 
AR Path="/62202BC8/622481D9" Ref="TP4Fire?"  Part="1" 
AR Path="/621D0B8B/622481D9" Ref="TP4Fire1"  Part="1" 
F 0 "TP4Fire1" H 3208 2368 50  0000 L CNN
F 1 "Fire" H 3208 2277 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5010-5014_Multipurpose" H 3350 2250 50  0001 C CNN
F 3 "~" H 3350 2250 50  0001 C CNN
	1    3150 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 1900 5200 1900
$Comp
L Device:R R?
U 1 1 621D4992
P 3950 2800
AR Path="/621ECC98/621D4992" Ref="R?"  Part="1" 
AR Path="/621D0B8B/621D4992" Ref="R7"  Part="1" 
F 0 "R7" V 3743 2800 50  0000 C CNN
F 1 "1K" V 3834 2800 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3880 2800 50  0001 C CNN
F 3 "~" H 3950 2800 50  0001 C CNN
F 4 "C22843" V 3950 2800 50  0001 C CNN "LCSC"
	1    3950 2800
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 621D9835
P 4300 5100
AR Path="/621ECC98/621D9835" Ref="R?"  Part="1" 
AR Path="/621D0B8B/621D9835" Ref="R9"  Part="1" 
F 0 "R9" V 4093 5100 50  0000 C CNN
F 1 "1K" V 4184 5100 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4230 5100 50  0001 C CNN
F 3 "~" H 4300 5100 50  0001 C CNN
F 4 "C22843" V 4300 5100 50  0001 C CNN "LCSC"
	1    4300 5100
	0    1    1    0   
$EndComp
$Comp
L Transistor_BJT:MMBT3904 Q?
U 1 1 621DAEDB
P 4350 2800
AR Path="/621E1C5F/621DAEDB" Ref="Q?"  Part="1" 
AR Path="/621D0B8B/621DAEDB" Ref="Q3"  Part="1" 
F 0 "Q3" H 4541 2846 50  0000 L CNN
F 1 "MMBT3904" H 4541 2755 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 4550 2725 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 4350 2800 50  0001 L CNN
F 4 "C8512" H 4350 2800 50  0001 C CNN "LCSC"
	1    4350 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 4500 4800 4900
$Comp
L Transistor_BJT:MMBT3904 Q?
U 1 1 621E676C
P 4700 5100
AR Path="/621E1C5F/621E676C" Ref="Q?"  Part="1" 
AR Path="/621D0B8B/621E676C" Ref="Q4"  Part="1" 
F 0 "Q4" H 4891 5146 50  0000 L CNN
F 1 "MMBT3904" H 4891 5055 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 4900 5025 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 4700 5100 50  0001 L CNN
F 4 "C8512" H 4700 5100 50  0001 C CNN "LCSC"
	1    4700 5100
	1    0    0    -1  
$EndComp
Connection ~ 4800 4900
Wire Wire Line
	4800 4900 4800 4950
Wire Wire Line
	3800 5100 4150 5100
Wire Wire Line
	4450 5100 4500 5100
$Comp
L Device:R R12
U 1 1 621EE218
P 6250 3700
F 0 "R12" V 6043 3700 50  0000 C CNN
F 1 "0" V 6134 3700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6180 3700 50  0001 C CNN
F 3 "~" H 6250 3700 50  0001 C CNN
F 4 " C17477 " V 6250 3700 50  0001 C CNN "LCSC"
	1    6250 3700
	0    1    1    0   
$EndComp
Wire Wire Line
	6400 3700 6500 3700
Wire Wire Line
	5900 3700 6100 3700
Connection ~ 5900 3700
Wire Wire Line
	6600 2300 6600 2350
$Comp
L Device:R R11
U 1 1 621F141B
P 6250 2350
F 0 "R11" V 6043 2350 50  0000 C CNN
F 1 "0" V 6134 2350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6180 2350 50  0001 C CNN
F 3 "~" H 6250 2350 50  0001 C CNN
F 4 " C17477 " V 6250 2350 50  0001 C CNN "LCSC"
	1    6250 2350
	0    1    1    0   
$EndComp
Wire Wire Line
	6400 2350 6600 2350
Connection ~ 6600 2350
Wire Wire Line
	6600 2350 6600 2450
Wire Wire Line
	6050 2350 6100 2350
$EndSCHEMATC
