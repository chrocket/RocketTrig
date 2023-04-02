EESchema Schematic File Version 4
LIBS:CameraTriggerSensorNodeOnly-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 7
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
	4350 3450 4350 3500
Wire Wire Line
	4750 3500 4750 3650
Wire Wire Line
	4000 3500 4000 3650
$Comp
L power:GND #PWR?
U 1 1 62206606
P 4750 3650
AR Path="/62206606" Ref="#PWR?"  Part="1" 
AR Path="/6220007F/62206606" Ref="#PWR029"  Part="1" 
F 0 "#PWR029" H 4750 3400 50  0001 C CNN
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
AR Path="/6220007F/6220660C" Ref="#PWR026"  Part="1" 
F 0 "#PWR026" H 4000 3400 50  0001 C CNN
F 1 "GND" H 4005 3477 50  0000 C CNN
F 2 "" H 4000 3650 50  0001 C CNN
F 3 "" H 4000 3650 50  0001 C CNN
	1    4000 3650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4750 3150 4750 3200
Wire Wire Line
	4000 3200 4000 3150
$Comp
L Device:C C?
U 1 1 62206614
P 4000 3350
AR Path="/62206614" Ref="C?"  Part="1" 
AR Path="/6220007F/62206614" Ref="C3"  Part="1" 
F 0 "C3" H 4115 3396 50  0000 L CNN
F 1 "1uf" H 4115 3305 50  0000 L CNN
F 2 "Capacitor_SMD:C_Elec_4x5.4" H 4038 3200 50  0001 C CNN
F 3 "~" H 4000 3350 50  0001 C CNN
F 4 "C87863 " H 4000 3350 50  0001 C CNN "LCSC"
	1    4000 3350
	-1   0    0    -1  
$EndComp
$Comp
L Device:CP C?
U 1 1 6220661A
P 4750 3350
AR Path="/6220661A" Ref="C?"  Part="1" 
AR Path="/6220007F/6220661A" Ref="C4"  Part="1" 
F 0 "C4" H 4868 3396 50  0000 L CNN
F 1 "25uf" H 4868 3305 50  0000 L CNN
F 2 "Capacitor_SMD:C_Elec_4x5.4" H 4788 3200 50  0001 C CNN
F 3 "~" H 4750 3350 50  0001 C CNN
F 4 " C2895283 " H 4750 3350 50  0001 C CNN "LCSC"
	1    4750 3350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4050 3150 4000 3150
Wire Wire Line
	4750 3150 4700 3150
$Comp
L power:GND #PWR?
U 1 1 62206622
P 4350 3500
AR Path="/62206622" Ref="#PWR?"  Part="1" 
AR Path="/6220007F/62206622" Ref="#PWR028"  Part="1" 
F 0 "#PWR028" H 4350 3250 50  0001 C CNN
F 1 "GND" H 4355 3327 50  0000 C CNN
F 2 "" H 4350 3500 50  0001 C CNN
F 3 "" H 4350 3500 50  0001 C CNN
	1    4350 3500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4000 3100 4000 3150
Connection ~ 4000 3150
Wire Wire Line
	3350 3100 3650 3100
$Comp
L Device:D D?
U 1 1 6220662B
P 4700 2850
AR Path="/6220662B" Ref="D?"  Part="1" 
AR Path="/6220007F/6220662B" Ref="D6"  Part="1" 
F 0 "D6" V 4746 2771 50  0000 R CNN
F 1 "SR560-T" V 4655 2771 50  0000 R CNN
F 2 "Diode_SMD:D_SMA" H 4700 2850 50  0001 C CNN
F 3 "" H 4700 2850 50  0001 C CNN
F 4 "C154885" V 4700 2850 50  0001 C CNN "LCSC"
	1    4700 2850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4700 3000 4700 3150
Connection ~ 4700 3150
Wire Wire Line
	4700 3150 4650 3150
$Comp
L Device:LED D?
U 1 1 62206635
P 3000 3650
AR Path="/62206635" Ref="D?"  Part="1" 
AR Path="/6220007F/62206635" Ref="D5"  Part="1" 
F 0 "D5" V 3039 3533 50  0000 R CNN
F 1 "PWR" V 2948 3533 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 3000 3650 50  0001 C CNN
F 3 "~" H 3000 3650 50  0001 C CNN
F 4 "C264544" V 3000 3650 50  0001 C CNN "LCSC"
	1    3000 3650
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6220663B
P 3000 4000
AR Path="/6220663B" Ref="#PWR?"  Part="1" 
AR Path="/6220007F/6220663B" Ref="#PWR022"  Part="1" 
F 0 "#PWR022" H 3000 3750 50  0001 C CNN
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
AR Path="/6220007F/62206645" Ref="#PWR024"  Part="1" 
F 0 "#PWR024" H 3350 2950 50  0001 C CNN
F 1 "+5V" H 3365 3273 50  0000 C CNN
F 2 "" H 3350 3100 50  0001 C CNN
F 3 "" H 3350 3100 50  0001 C CNN
	1    3350 3100
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LM7805_TO220 U?
U 1 1 6220664D
P 4350 3150
AR Path="/6220664D" Ref="U?"  Part="1" 
AR Path="/6220007F/6220664D" Ref="U1"  Part="1" 
F 0 "U1" H 4350 3392 50  0000 C CNN
F 1 "LM7805_TO220" H 4350 3301 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TO-252-2" H 4350 3375 50  0001 C CIN
F 3 "http://www.fairchildsemi.com/ds/LM/LM7805.pdf" H 4350 3100 50  0001 C CNN
F 4 " C310413" H 4350 3150 50  0001 C CNN "LCSC"
F 5 "" H 4350 3150 50  0001 C CNN "Field5"
	1    4350 3150
	-1   0    0    -1  
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
Wire Wire Line
	6950 3100 6650 3100
Connection ~ 6650 3100
$Comp
L power:+7.5V #PWR?
U 1 1 62206663
P 6650 2950
AR Path="/62206663" Ref="#PWR?"  Part="1" 
AR Path="/6220007F/62206663" Ref="#PWR030"  Part="1" 
F 0 "#PWR030" H 6650 2800 50  0001 C CNN
F 1 "+7.5V" H 6665 3123 50  0000 C CNN
F 2 "" H 6650 2950 50  0001 C CNN
F 3 "" H 6650 2950 50  0001 C CNN
	1    6650 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 2950 6650 3100
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
	6400 3100 6650 3100
Wire Wire Line
	4700 2700 5850 2700
Wire Wire Line
	6050 3100 6050 2950
Wire Wire Line
	6050 2950 6400 2950
Wire Wire Line
	6400 2950 6400 3100
NoConn ~ 5950 3100
$Comp
L SamacSys_Parts:AS11CB SW?
U 1 1 62206680
P 6150 3100
AR Path="/62206680" Ref="SW?"  Part="1" 
AR Path="/6220007F/62206680" Ref="SW2"  Part="1" 
F 0 "SW2" V 6604 3228 50  0000 L CNN
F 1 "AS11CB" V 6695 3228 50  0000 L CNN
F 2 "CameraTriggerPCB:AS11CB" H 7000 3200 50  0001 L CNN
F 3 "https://www.mouser.com/datasheet/2/295/Aslides-1663571.pdf" H 7000 3100 50  0001 L CNN
F 4 "Slide Switches" H 7000 3000 50  0001 L CNN "Description"
F 5 "11.6" H 7000 2900 50  0001 L CNN "Height"
F 6 "NKK Switches" H 7000 2800 50  0001 L CNN "Manufacturer_Name"
F 7 "AS11CB" H 7000 2700 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "633-AS11CB" H 7000 2600 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=633-AS11CB" H 7000 2500 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 7000 2400 50  0001 L CNN "RS Part Number"
F 11 "" H 7000 2300 50  0001 L CNN "RS Price/Stock"
	1    6150 3100
	0    1    1    0   
$EndComp
NoConn ~ 6150 4100
NoConn ~ 6050 4100
NoConn ~ 5750 3100
NoConn ~ 6150 3100
Wire Wire Line
	5850 2700 5850 3100
$Comp
L Device:R R?
U 1 1 6220668C
P 3000 3250
AR Path="/6220668C" Ref="R?"  Part="1" 
AR Path="/6220007F/6220668C" Ref="R8"  Part="1" 
F 0 "R8" H 3070 3296 50  0000 L CNN
F 1 "1K" H 3070 3205 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2930 3250 50  0001 C CNN
F 3 "~" H 3000 3250 50  0001 C CNN
F 4 "C21190" H 3000 3250 50  0001 C CNN "LCSC"
	1    3000 3250
	-1   0    0    1   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J?
U 1 1 6220991F
P 7600 3300
AR Path="/6220991F" Ref="J?"  Part="1" 
AR Path="/6220007F/6220991F" Ref="J4"  Part="1" 
F 0 "J4" H 7680 3292 50  0000 L CNN
F 1 " " H 7680 3201 50  0000 L CNN
F 2 "Connector_AMASS:AMASS_XT30U-F_1x02_P5.0mm_Vertical" H 7600 3300 50  0001 C CNN
F 3 "~" H 7600 3300 50  0001 C CNN
	1    7600 3300
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62209925
P 7800 3300
AR Path="/62209925" Ref="#PWR?"  Part="1" 
AR Path="/6220007F/62209925" Ref="#PWR032"  Part="1" 
F 0 "#PWR032" H 7800 3050 50  0001 C CNN
F 1 "GND" H 7805 3127 50  0000 C CNN
F 2 "" H 7800 3300 50  0001 C CNN
F 3 "" H 7800 3300 50  0001 C CNN
	1    7800 3300
	1    0    0    -1  
$EndComp
$Comp
L power:+7.5V #PWR?
U 1 1 6220992B
P 7800 3200
AR Path="/6220992B" Ref="#PWR?"  Part="1" 
AR Path="/6220007F/6220992B" Ref="#PWR031"  Part="1" 
F 0 "#PWR031" H 7800 3050 50  0001 C CNN
F 1 "+7.5V" H 7815 3373 50  0000 C CNN
F 2 "" H 7800 3200 50  0001 C CNN
F 3 "" H 7800 3200 50  0001 C CNN
	1    7800 3200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 6220F1DC
P 9550 4000
AR Path="/6220F1DC" Ref="C?"  Part="1" 
AR Path="/6220007F/6220F1DC" Ref="C5"  Part="1" 
F 0 "C5" H 9665 4046 50  0000 L CNN
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
AR Path="/6220007F/6220F1E2" Ref="#PWR036"  Part="1" 
F 0 "#PWR036" H 10000 4000 50  0001 C CNN
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
AR Path="/6220007F/6220F1E8" Ref="#PWR034"  Part="1" 
F 0 "#PWR034" H 9550 4100 50  0001 C CNN
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
AR Path="/6220007F/6220F1F0" Ref="#PWR035"  Part="1" 
F 0 "#PWR035" H 10000 3500 50  0001 C CNN
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
AR Path="/6220007F/6220F1F6" Ref="#PWR033"  Part="1" 
F 0 "#PWR033" H 9550 3500 50  0001 C CNN
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
AR Path="/6220007F/6220F1FF" Ref="C6"  Part="1" 
F 0 "C6" H 10115 4046 50  0000 L CNN
F 1 "0.01 μF" H 10115 3955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 10038 3850 50  0001 C CNN
F 3 "~" H 10000 4000 50  0001 C CNN
F 4 "C1525" H 10000 4000 50  0001 C CNN "LCSC"
	1    10000 4000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR021
U 1 1 62212DAD
P 2650 5100
F 0 "#PWR021" H 2650 4850 50  0001 C CNN
F 1 "GND" H 2655 4927 50  0000 C CNN
F 2 "" H 2650 5100 50  0001 C CNN
F 3 "" H 2650 5100 50  0001 C CNN
	1    2650 5100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR023
U 1 1 62212DB3
P 3000 5100
F 0 "#PWR023" H 3000 4850 50  0001 C CNN
F 1 "GND" H 3005 4927 50  0000 C CNN
F 2 "" H 3000 5100 50  0001 C CNN
F 3 "" H 3000 5100 50  0001 C CNN
	1    3000 5100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR020
U 1 1 62212DB9
P 2250 5200
F 0 "#PWR020" H 2250 4950 50  0001 C CNN
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
L Connector:TestPoint GND1
U 1 1 62212DD2
P 4150 5050
F 0 "GND1" H 4208 5168 50  0000 L CNN
F 1 "TestPoint" H 4208 5077 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5000-5004_Miniature" H 4350 5050 50  0001 C CNN
F 3 "~" H 4350 5050 50  0001 C CNN
	1    4150 5050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR027
U 1 1 62212DD8
P 4150 5400
F 0 "#PWR027" H 4150 5150 50  0001 C CNN
F 1 "GND" H 4155 5227 50  0000 C CNN
F 2 "" H 4150 5400 50  0001 C CNN
F 3 "" H 4150 5400 50  0001 C CNN
	1    4150 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 5050 4150 5400
$Comp
L Connector:TestPoint TP2
U 1 1 62212DDF
P 3700 5050
F 0 "TP2" H 3758 5168 50  0000 L CNN
F 1 "Gnd" H 3758 5077 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5000-5004_Miniature" H 3900 5050 50  0001 C CNN
F 3 "~" H 3900 5050 50  0001 C CNN
	1    3700 5050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR025
U 1 1 62212DE5
P 3700 5300
F 0 "#PWR025" H 3700 5050 50  0001 C CNN
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
L power:GND #PWR019
U 1 1 62212DF2
P 1650 5100
F 0 "#PWR019" H 1650 4850 50  0001 C CNN
F 1 "GND" H 1655 4927 50  0000 C CNN
F 2 "" H 1650 5100 50  0001 C CNN
F 3 "" H 1650 5100 50  0001 C CNN
	1    1650 5100
	1    0    0    -1  
$EndComp
$EndSCHEMATC
