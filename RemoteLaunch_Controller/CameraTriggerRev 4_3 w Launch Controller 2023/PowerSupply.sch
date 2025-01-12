EESchema Schematic File Version 4
LIBS:CameraTriggerSensorNodeOnly-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 7
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	4750 3500 4750 3650
Wire Wire Line
	4000 3500 4000 3650
$Comp
L power:GND #PWR?
U 1 1 62206606
P 4750 3650
AR Path="/62206606" Ref="#PWR?"  Part="1" 
AR Path="/6220007F/62206606" Ref="#PWR017"  Part="1" 
F 0 "#PWR017" H 4750 3400 50  0001 C CNN
F 1 "GND" H 4755 3477 50  0000 C CNN
F 2 "" H 4750 3650 50  0001 C CNN
F 3 "" H 4750 3650 50  0001 C CNN
	1    4750 3650
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6220660C
P 4000 3650
AR Path="/6220660C" Ref="#PWR?"  Part="1" 
AR Path="/6220007F/6220660C" Ref="#PWR014"  Part="1" 
F 0 "#PWR014" H 4000 3400 50  0001 C CNN
F 1 "GND" H 4005 3477 50  0000 C CNN
F 2 "" H 4000 3650 50  0001 C CNN
F 3 "" H 4000 3650 50  0001 C CNN
	1    4000 3650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4750 3150 4750 3200
$Comp
L Device:CP C?
U 1 1 62206614
P 4000 3350
AR Path="/62206614" Ref="C?"  Part="1" 
AR Path="/6220007F/62206614" Ref="C1"  Part="1" 
F 0 "C1" H 4115 3396 50  0000 L CNN
F 1 "1uf" H 4115 3305 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.4" H 4038 3200 50  0001 C CNN
F 3 "~" H 4000 3350 50  0001 C CNN
F 4 "C87863 " H 4000 3350 50  0001 C CNN "LCSC"
F 5 "" H 4000 3350 50  0001 C CNN "Field5"
	1    4000 3350
	-1   0    0    -1  
$EndComp
$Comp
L Device:CP C?
U 1 1 6220661A
P 4750 3350
AR Path="/6220661A" Ref="C?"  Part="1" 
AR Path="/6220007F/6220661A" Ref="C2"  Part="1" 
F 0 "C2" H 4868 3396 50  0000 L CNN
F 1 "25uf" H 4868 3305 50  0000 L CNN
F 2 "Capacitor_SMD:C_Elec_4x5.4" H 4788 3200 50  0001 C CNN
F 3 "~" H 4750 3350 50  0001 C CNN
F 4 " C2895283 " H 4750 3350 50  0001 C CNN "LCSC"
	1    4750 3350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4750 3150 4700 3150
Wire Wire Line
	3350 3100 3650 3100
$Comp
L Device:D D?
U 1 1 6220662B
P 4700 2850
AR Path="/6220662B" Ref="D?"  Part="1" 
AR Path="/6220007F/6220662B" Ref="D3"  Part="1" 
F 0 "D3" V 4746 2771 50  0000 R CNN
F 1 "B330A-13-F" V 4655 2771 50  0000 R CNN
F 2 "Diode_SMD:D_SMA" H 4700 2850 50  0001 C CNN
F 3 "https://www.mouser.com/ProductDetail/583-SR560-T" H 4700 2850 50  0001 C CNN
F 4 "C110485" V 4700 2850 50  0001 C CNN "LCSC"
	1    4700 2850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4700 3000 4700 3150
Connection ~ 4700 3150
$Comp
L Device:LED D?
U 1 1 62206635
P 3000 3650
AR Path="/62206635" Ref="D?"  Part="1" 
AR Path="/6220007F/62206635" Ref="D2"  Part="1" 
F 0 "D2" V 3039 3533 50  0000 R CNN
F 1 "PWR" V 2948 3533 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 3000 3650 50  0001 C CNN
F 3 "~" H 3000 3650 50  0001 C CNN
F 4 "C2286" V 3000 3650 50  0001 C CNN "LCSC"
F 5 " C389517 " V 3000 3650 50  0001 C CNN "Alt"
F 6 " C146215 " V 3000 3650 50  0001 C CNN "ALT"
	1    3000 3650
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6220663B
P 3000 4000
AR Path="/6220663B" Ref="#PWR?"  Part="1" 
AR Path="/6220007F/6220663B" Ref="#PWR010"  Part="1" 
F 0 "#PWR010" H 3000 3750 50  0001 C CNN
F 1 "GND" H 3005 3827 50  0000 C CNN
F 2 "" H 3000 4000 50  0001 C CNN
F 3 "" H 3000 4000 50  0001 C CNN
	1    3000 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 3100 3350 3100
Connection ~ 3350 3100
Wire Wire Line
	3000 3400 3000 3500
Wire Wire Line
	3000 3800 3000 4000
$Comp
L power:+5V #PWR?
U 1 1 62206645
P 3350 3100
AR Path="/62206645" Ref="#PWR?"  Part="1" 
AR Path="/6220007F/62206645" Ref="#PWR012"  Part="1" 
F 0 "#PWR012" H 3350 2950 50  0001 C CNN
F 1 "+5V" H 3365 3273 50  0000 C CNN
F 2 "" H 3350 3100 50  0001 C CNN
F 3 "" H 3350 3100 50  0001 C CNN
	1    3350 3100
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP1+?
U 1 1 62206653
P 3650 3100
AR Path="/62206653" Ref="TP1+?"  Part="1" 
AR Path="/6220007F/62206653" Ref="TP1+1"  Part="1" 
F 0 "TP1+1" H 3708 3218 50  0000 L CNN
F 1 "+5V" H 3708 3127 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5010-5014_Multipurpose" H 3850 3100 50  0001 C CNN
F 3 "~" H 3850 3100 50  0001 C CNN
	1    3650 3100
	1    0    0    -1  
$EndComp
Connection ~ 3650 3100
Wire Wire Line
	3650 3100 4000 3100
$Comp
L power:PWR_FLAG #FLG?
U 1 1 6220665B
P 6950 3100
AR Path="/6220665B" Ref="#FLG?"  Part="1" 
AR Path="/6220007F/6220665B" Ref="#FLG03"  Part="1" 
F 0 "#FLG03" H 6950 3175 50  0001 C CNN
F 1 "PWR_FLAG" H 6950 3273 50  0000 C CNN
F 2 "" H 6950 3100 50  0001 C CNN
F 3 "~" H 6950 3100 50  0001 C CNN
	1    6950 3100
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 6220666A
P 4900 3150
AR Path="/6220666A" Ref="#FLG?"  Part="1" 
AR Path="/6220007F/6220666A" Ref="#FLG02"  Part="1" 
F 0 "#FLG02" H 4900 3225 50  0001 C CNN
F 1 "PWR_FLAG" H 4900 3323 50  0000 C CNN
F 2 "" H 4900 3150 50  0001 C CNN
F 3 "~" H 4900 3150 50  0001 C CNN
	1    4900 3150
	1    0    0    -1  
$EndComp
Connection ~ 4750 3150
Wire Wire Line
	4750 3150 4900 3150
Wire Wire Line
	4700 2700 5850 2700
$Comp
L Device:R R?
U 1 1 6220668C
P 3000 3250
AR Path="/6220668C" Ref="R?"  Part="1" 
AR Path="/6220007F/6220668C" Ref="R4"  Part="1" 
F 0 "R4" H 3070 3296 50  0000 L CNN
F 1 "1K" H 3070 3205 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2930 3250 50  0001 C CNN
F 3 "~" H 3000 3250 50  0001 C CNN
F 4 "C21190" H 3000 3250 50  0001 C CNN "LCSC"
	1    3000 3250
	-1   0    0    1   
$EndComp
$Comp
L Device:C C?
U 1 1 6220F1DC
P 9550 4000
AR Path="/6220F1DC" Ref="C?"  Part="1" 
AR Path="/6220007F/6220F1DC" Ref="C3"  Part="1" 
F 0 "C3" H 9665 4046 50  0000 L CNN
F 1 "0.01 μF" H 9665 3955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 9588 3850 50  0001 C CNN
F 3 "~" H 9550 4000 50  0001 C CNN
F 4 "C1525" H 9550 4000 50  0001 C CNN "LCSC"
	1    9550 4000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6220F1E2
P 10000 4250
AR Path="/6220F1E2" Ref="#PWR?"  Part="1" 
AR Path="/6220007F/6220F1E2" Ref="#PWR022"  Part="1" 
F 0 "#PWR022" H 10000 4000 50  0001 C CNN
F 1 "GND" H 10005 4077 50  0000 C CNN
F 2 "" H 10000 4250 50  0001 C CNN
F 3 "" H 10000 4250 50  0001 C CNN
	1    10000 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6220F1E8
P 9550 4350
AR Path="/6220F1E8" Ref="#PWR?"  Part="1" 
AR Path="/6220007F/6220F1E8" Ref="#PWR020"  Part="1" 
F 0 "#PWR020" H 9550 4100 50  0001 C CNN
F 1 "GND" H 9555 4177 50  0000 C CNN
F 2 "" H 9550 4350 50  0001 C CNN
F 3 "" H 9550 4350 50  0001 C CNN
	1    9550 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 4350 9550 4150
Wire Wire Line
	10000 4150 10000 4250
$Comp
L power:+3.3V #PWR?
U 1 1 6220F1F0
P 10000 3650
AR Path="/6220F1F0" Ref="#PWR?"  Part="1" 
AR Path="/6220007F/6220F1F0" Ref="#PWR021"  Part="1" 
F 0 "#PWR021" H 10000 3500 50  0001 C CNN
F 1 "+3.3V" H 10015 3823 50  0000 C CNN
F 2 "" H 10000 3650 50  0001 C CNN
F 3 "" H 10000 3650 50  0001 C CNN
	1    10000 3650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6220F1F6
P 9550 3650
AR Path="/6220F1F6" Ref="#PWR?"  Part="1" 
AR Path="/6220007F/6220F1F6" Ref="#PWR019"  Part="1" 
F 0 "#PWR019" H 9550 3500 50  0001 C CNN
F 1 "+5V" H 9565 3823 50  0000 C CNN
F 2 "" H 9550 3650 50  0001 C CNN
F 3 "" H 9550 3650 50  0001 C CNN
	1    9550 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 3850 9550 3650
Wire Wire Line
	10000 3650 10000 3850
$Comp
L Device:C C?
U 1 1 6220F1FF
P 10000 4000
AR Path="/6220F1FF" Ref="C?"  Part="1" 
AR Path="/6220007F/6220F1FF" Ref="C4"  Part="1" 
F 0 "C4" H 10115 4046 50  0000 L CNN
F 1 "0.01 μF" H 10115 3955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 10038 3850 50  0001 C CNN
F 3 "~" H 10000 4000 50  0001 C CNN
F 4 "C1525" H 10000 4000 50  0001 C CNN "LCSC"
	1    10000 4000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 62212DAD
P 2650 5100
F 0 "#PWR09" H 2650 4850 50  0001 C CNN
F 1 "GND" H 2655 4927 50  0000 C CNN
F 2 "" H 2650 5100 50  0001 C CNN
F 3 "" H 2650 5100 50  0001 C CNN
	1    2650 5100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 62212DB3
P 3000 5100
F 0 "#PWR011" H 3000 4850 50  0001 C CNN
F 1 "GND" H 3005 4927 50  0000 C CNN
F 2 "" H 3000 5100 50  0001 C CNN
F 3 "" H 3000 5100 50  0001 C CNN
	1    3000 5100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 62212DB9
P 2250 5200
F 0 "#PWR08" H 2250 4950 50  0001 C CNN
F 1 "GND" H 2255 5027 50  0000 C CNN
F 2 "" H 2250 5200 50  0001 C CNN
F 3 "" H 2250 5200 50  0001 C CNN
	1    2250 5200
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 62212DBF
P 2250 5050
F 0 "H2" H 2350 5099 50  0000 L CNN
F 1 " " H 2350 5008 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.7mm_Pad" H 2250 5050 50  0001 C CNN
F 3 "~" H 2250 5050 50  0001 C CNN
	1    2250 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 5150 2250 5200
$Comp
L Mechanical:MountingHole_Pad H3
U 1 1 62212DC6
P 2650 5000
F 0 "H3" H 2750 5049 50  0000 L CNN
F 1 " " H 2750 4958 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.7mm_Pad" H 2650 5000 50  0001 C CNN
F 3 "~" H 2650 5000 50  0001 C CNN
	1    2650 5000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H4
U 1 1 62212DCC
P 3000 5000
F 0 "H4" H 3100 5049 50  0000 L CNN
F 1 " " H 3100 4958 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.7mm_Pad" H 3000 5000 50  0001 C CNN
F 3 "~" H 3000 5000 50  0001 C CNN
	1    3000 5000
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP2_5
U 1 1 62212DD2
P 4150 5050
F 0 "TP2_5" H 4208 5168 50  0000 L CNN
F 1 "+5V" H 4208 5077 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5010-5014_Multipurpose" H 4350 5050 50  0001 C CNN
F 3 "~" H 4350 5050 50  0001 C CNN
	1    4150 5050
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP1_GND1
U 1 1 62212DDF
P 3700 5050
F 0 "TP1_GND1" H 3758 5168 50  0000 L CNN
F 1 "GND" H 3758 5077 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5010-5014_Multipurpose" H 3900 5050 50  0001 C CNN
F 3 "~" H 3900 5050 50  0001 C CNN
	1    3700 5050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 62212DE5
P 3700 5300
F 0 "#PWR013" H 3700 5050 50  0001 C CNN
F 1 "GND" H 3705 5127 50  0000 C CNN
F 2 "" H 3700 5300 50  0001 C CNN
F 3 "" H 3700 5300 50  0001 C CNN
	1    3700 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 5300 3700 5050
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 62212DEC
P 1650 5000
F 0 "H1" H 1750 5049 50  0000 L CNN
F 1 " " H 1750 4958 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.7mm_Pad" H 1650 5000 50  0001 C CNN
F 3 "~" H 1650 5000 50  0001 C CNN
	1    1650 5000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 62212DF2
P 1650 5100
F 0 "#PWR07" H 1650 4850 50  0001 C CNN
F 1 "GND" H 1655 4927 50  0000 C CNN
F 2 "" H 1650 5100 50  0001 C CNN
F 3 "" H 1650 5100 50  0001 C CNN
	1    1650 5100
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J1
U 1 1 6483BD89
P 5900 2200
F 0 "J1" V 5864 2012 50  0000 R CNN
F 1 "Pwr switch" V 5773 2012 50  0000 R CNN
F 2 "CameraTriggerPCB:CUI_TB007-508-02BE" H 5900 2200 50  0001 C CNN
F 3 "~" H 5900 2200 50  0001 C CNN
F 4 "TB007-508-02BE " H 5900 2200 50  0001 C CNN "Description"
	1    5900 2200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5850 2700 5850 2400
Wire Wire Line
	5850 2400 5900 2400
Wire Wire Line
	6000 2400 6000 2950
Wire Wire Line
	6400 2950 6400 3100
Wire Wire Line
	6000 2950 6050 2950
$Comp
L power:+5V #PWR015
U 1 1 6488EC40
P 4150 5050
F 0 "#PWR015" H 4150 4900 50  0001 C CNN
F 1 "+5V" H 4165 5223 50  0000 C CNN
F 2 "" H 4150 5050 50  0001 C CNN
F 3 "" H 4150 5050 50  0001 C CNN
	1    4150 5050
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP3_3_3
U 1 1 6488FAD3
P 4600 5050
F 0 "TP3_3_3" H 4658 5168 50  0000 L CNN
F 1 "+3.3V" H 4658 5077 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5010-5014_Multipurpose" H 4800 5050 50  0001 C CNN
F 3 "~" H 4800 5050 50  0001 C CNN
	1    4600 5050
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR041
U 1 1 64890234
P 4600 5050
F 0 "#PWR041" H 4600 4900 50  0001 C CNN
F 1 "+3.3V" H 4615 5223 50  0000 C CNN
F 2 "" H 4600 5050 50  0001 C CNN
F 3 "" H 4600 5050 50  0001 C CNN
	1    4600 5050
	-1   0    0    1   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J10
U 1 1 6483808B
P 5800 3600
F 0 "J10" H 5718 3275 50  0000 C CNN
F 1 "SW" H 5718 3366 50  0000 C CNN
F 2 "Connector_AMASS:AMASS_XT30U-F_1x02_P5.0mm_Vertical" H 5800 3600 50  0001 C CNN
F 3 "~" H 5800 3600 50  0001 C CNN
	1    5800 3600
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR044
U 1 1 64839A77
P 6000 3600
F 0 "#PWR044" H 6000 3350 50  0001 C CNN
F 1 "GND" H 6005 3427 50  0000 C CNN
F 2 "" H 6000 3600 50  0001 C CNN
F 3 "" H 6000 3600 50  0001 C CNN
	1    6000 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 2950 6050 3500
Wire Wire Line
	6050 3500 6000 3500
Connection ~ 6050 2950
Wire Wire Line
	6050 2950 6400 2950
Wire Wire Line
	4000 3100 4000 3200
Wire Wire Line
	4600 3100 4600 3150
Wire Wire Line
	4650 3150 4700 3150
Wire Wire Line
	4600 3150 4700 3150
$Comp
L power:GND #PWR?
U 1 1 62206622
P 4000 2350
AR Path="/62206622" Ref="#PWR?"  Part="1" 
AR Path="/6220007F/62206622" Ref="#PWR016"  Part="1" 
F 0 "#PWR016" H 4000 2100 50  0001 C CNN
F 1 "GND" H 4005 2177 50  0000 C CNN
F 2 "" H 4000 2350 50  0001 C CNN
F 3 "" H 4000 2350 50  0001 C CNN
	1    4000 2350
	1    0    0    1   
$EndComp
Wire Wire Line
	4000 3100 4000 2750
Wire Wire Line
	4000 2750 4150 2750
Connection ~ 4000 3100
Wire Wire Line
	4450 3050 4450 3150
Wire Wire Line
	4450 3150 4600 3150
Connection ~ 4600 3150
$Comp
L Regulator_Linear:LM7805_TO220 U?
U 1 1 6220664D
P 4300 2350
AR Path="/6220664D" Ref="U?"  Part="1" 
AR Path="/6220007F/6220664D" Ref="U1"  Part="1" 
F 0 "U1" H 4300 2592 50  0000 C CNN
F 1 "AMS1117CD-5.0" H 4300 2501 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223" H 4300 2575 50  0001 C CIN
F 3 "http://www.fairchildsemi.com/ds/LM/LM7805.pdf" H 4300 2300 50  0001 C CNN
F 4 "C6187" H 4300 2350 50  0001 C CNN "LCSC"
F 5 "" H 4300 2350 50  0001 C CNN "Field5"
	1    4300 2350
	1    0    0    1   
$EndComp
Wire Wire Line
	4500 2600 4950 2600
Wire Wire Line
	4500 3050 4450 3050
Wire Wire Line
	4500 2600 4500 3050
Wire Wire Line
	4150 2750 4150 2600
Wire Wire Line
	4150 2600 3650 2600
Wire Wire Line
	3650 2600 3650 1950
Wire Wire Line
	3650 1950 4300 1950
Wire Wire Line
	4300 1950 4300 2050
Wire Wire Line
	6400 3100 6950 3100
$Comp
L Connector:TestPoint TP4_12
U 1 1 649CA0F0
P 5100 5000
F 0 "TP4_12" H 5158 5118 50  0000 L CNN
F 1 "+12" H 5158 5027 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5010-5014_Multipurpose" H 5300 5000 50  0001 C CNN
F 3 "~" H 5300 5000 50  0001 C CNN
	1    5100 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 2600 4950 2350
Wire Wire Line
	4950 2350 4600 2350
Connection ~ 4600 2350
Wire Wire Line
	4600 2350 4550 2350
$Comp
L power:+12V #PWR018
U 1 1 649D16D3
P 4600 2350
F 0 "#PWR018" H 4600 2200 50  0001 C CNN
F 1 "+12V" H 4615 2523 50  0000 C CNN
F 2 "" H 4600 2350 50  0001 C CNN
F 3 "" H 4600 2350 50  0001 C CNN
	1    4600 2350
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR038
U 1 1 649D408B
P 5100 5000
F 0 "#PWR038" H 5100 4850 50  0001 C CNN
F 1 "+12V" H 5115 5173 50  0000 C CNN
F 2 "TestPoint:TestPoint_Keystone_5000-5004_Miniature" H 5100 5000 50  0001 C CNN
F 3 "" H 5100 5000 50  0001 C CNN
	1    5100 5000
	-1   0    0    1   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J11
U 1 1 64A33809
P 5500 3600
F 0 "J11" H 5418 3275 50  0000 C CNN
F 1 "pwr" H 5418 3366 50  0000 C CNN
F 2 "CameraTriggerPCB:CUI_TB007-508-02BE" H 5500 3600 50  0001 C CNN
F 3 "~" H 5500 3600 50  0001 C CNN
	1    5500 3600
	-1   0    0    1   
$EndComp
Wire Wire Line
	5700 3500 5700 2950
Wire Wire Line
	5700 2950 6000 2950
Connection ~ 6000 2950
$Comp
L power:GND #PWR042
U 1 1 64A352E1
P 5700 3600
F 0 "#PWR042" H 5700 3350 50  0001 C CNN
F 1 "GND" H 5705 3427 50  0000 C CNN
F 2 "" H 5700 3600 50  0001 C CNN
F 3 "" H 5700 3600 50  0001 C CNN
	1    5700 3600
	1    0    0    -1  
$EndComp
$EndSCHEMATC
