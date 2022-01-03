EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
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
L Lorize3:kbd_SK6812MINI-E L?
U 1 1 6217D6D3
P 5800 4800
AR Path="/6217D6D3" Ref="L?"  Part="1" 
AR Path="/62157E2E/6217D6D3" Ref="L1"  Part="1" 
F 0 "L1" H 5800 5062 51  0000 C CNN
F 1 "kbd_SK6812MINI" H 5800 4997 16  0000 C CNN
F 2 "lorize3:SK6812-MINI-E" H 5800 4800 60  0001 C CNN
F 3 "" H 5800 4800 60  0001 C CNN
	1    5800 4800
	-1   0    0    1   
$EndComp
Text GLabel 6000 4900 2    50   Input ~ 0
+5V
Text GLabel 6000 4400 2    50   Input ~ 0
+5V
Text GLabel 5600 4200 0    50   Input ~ 0
GND
Text GLabel 5600 4700 0    50   Input ~ 0
GND
Text GLabel 5300 5300 0    50   Input ~ 0
RGB-R
Wire Wire Line
	6000 4200 6050 4200
$Comp
L corne-chocolate-cache:Device_R R?
U 1 1 6217D6E0
P 5300 5150
AR Path="/6217D6E0" Ref="R?"  Part="1" 
AR Path="/62157E2E/6217D6E0" Ref="R11"  Part="1" 
F 0 "R11" H 5370 5196 50  0000 L CNN
F 1 "1k" H 5370 5105 50  0000 L CNN
F 2 "Keebio-Parts:Resistor-Hybrid-Back" V 5230 5150 50  0001 C CNN
F 3 "" H 5300 5150 50  0001 C CNN
	1    5300 5150
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-LED:LED-3MM-NO_SILK D?
U 1 1 6217D6E6
P 9200 4800
AR Path="/6217D6E6" Ref="D?"  Part="1" 
AR Path="/62157E2E/6217D6E6" Ref="D204"  Part="1" 
F 0 "D204" V 9415 4750 50  0000 C CNN
F 1 "LED-3MM" V 9324 4750 50  0000 C CNN
F 2 "lorize3:LED_3mm_Radial" H 9230 4950 20  0001 C CNN
F 3 "" H 9200 4800 50  0001 C CNN
	1    9200 4800
	0    -1   -1   0   
$EndComp
$Comp
L corne-chocolate-cache:Device_R R?
U 1 1 6217D6EC
P 8950 4800
AR Path="/6217D6EC" Ref="R?"  Part="1" 
AR Path="/62157E2E/6217D6EC" Ref="R4"  Part="1" 
F 0 "R4" V 8743 4800 50  0000 C CNN
F 1 "300" V 8834 4800 50  0000 C CNN
F 2 "Keebio-Parts:Resistor-Hybrid-Back" V 8880 4800 50  0001 C CNN
F 3 "" H 8950 4800 50  0001 C CNN
	1    8950 4800
	0    1    1    0   
$EndComp
Text GLabel 8550 4600 0    50   Input ~ 0
VCC
Text GLabel 9400 4800 2    50   Input ~ 0
C3-LED2
$Comp
L SparkFun-LED:LED-3MM-NO_SILK D?
U 1 1 6217D6F4
P 9200 4400
AR Path="/6217D6F4" Ref="D?"  Part="1" 
AR Path="/62157E2E/6217D6F4" Ref="D203"  Part="1" 
F 0 "D203" V 9415 4350 50  0000 C CNN
F 1 "LED-3MM" V 9324 4350 50  0000 C CNN
F 2 "lorize3:LED_3mm_Radial" H 9230 4550 20  0001 C CNN
F 3 "" H 9200 4400 50  0001 C CNN
	1    9200 4400
	0    -1   -1   0   
$EndComp
$Comp
L corne-chocolate-cache:Device_R R?
U 1 1 6217D6FA
P 8950 4400
AR Path="/6217D6FA" Ref="R?"  Part="1" 
AR Path="/62157E2E/6217D6FA" Ref="R5"  Part="1" 
F 0 "R5" V 8743 4400 50  0000 C CNN
F 1 "300" V 8834 4400 50  0000 C CNN
F 2 "Keebio-Parts:Resistor-Hybrid-Back" V 8880 4400 50  0001 C CNN
F 3 "" H 8950 4400 50  0001 C CNN
	1    8950 4400
	0    1    1    0   
$EndComp
Text GLabel 9400 4400 2    50   Input ~ 0
C2-LED1
Wire Wire Line
	8800 4400 8800 4600
Text GLabel 9100 3100 2    50   Input ~ 0
LED1
Text GLabel 9100 3600 2    50   Input ~ 0
LED2
Wire Wire Line
	8500 3600 8500 3100
Text GLabel 8350 3600 0    50   Input ~ 0
VCC
$Comp
L corne-chocolate-cache:Device_R R?
U 1 1 6217D706
P 8650 3100
AR Path="/6217D706" Ref="R?"  Part="1" 
AR Path="/62157E2E/6217D706" Ref="R3"  Part="1" 
F 0 "R3" V 8443 3100 50  0000 C CNN
F 1 "300" V 8534 3100 50  0000 C CNN
F 2 "Keebio-Parts:Resistor-Hybrid-Back" V 8580 3100 50  0001 C CNN
F 3 "" H 8650 3100 50  0001 C CNN
	1    8650 3100
	0    1    1    0   
$EndComp
Connection ~ 8500 3600
$Comp
L corne-chocolate-cache:Device_R R?
U 1 1 6217D70F
P 8650 3600
AR Path="/6217D70F" Ref="R?"  Part="1" 
AR Path="/62157E2E/6217D70F" Ref="R2"  Part="1" 
F 0 "R2" V 8443 3600 50  0000 C CNN
F 1 "300" V 8534 3600 50  0000 C CNN
F 2 "Keebio-Parts:Resistor-Hybrid-Back" V 8580 3600 50  0001 C CNN
F 3 "" H 8650 3600 50  0001 C CNN
	1    8650 3600
	0    1    1    0   
$EndComp
$Comp
L SparkFun-LED:LED-3MM-NO_SILK D?
U 1 1 6217D715
P 8900 3600
AR Path="/6217D715" Ref="D?"  Part="1" 
AR Path="/62157E2E/6217D715" Ref="D202"  Part="1" 
F 0 "D202" V 9115 3550 50  0000 C CNN
F 1 "LED-3MM" V 9024 3550 50  0000 C CNN
F 2 "lorize3:LED_3mm_Radial" H 8930 3750 20  0001 C CNN
F 3 "" H 8900 3600 50  0001 C CNN
	1    8900 3600
	0    -1   -1   0   
$EndComp
$Comp
L SparkFun-LED:LED-3MM-NO_SILK D?
U 1 1 6217D71B
P 8900 3100
AR Path="/6217D71B" Ref="D?"  Part="1" 
AR Path="/62157E2E/6217D71B" Ref="D201"  Part="1" 
F 0 "D201" V 9115 3050 50  0000 C CNN
F 1 "LED-3MM" V 9024 3050 50  0000 C CNN
F 2 "lorize3:LED_3mm_Radial" H 8930 3250 20  0001 C CNN
F 3 "" H 8900 3100 50  0001 C CNN
	1    8900 3100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8550 4600 8800 4600
Connection ~ 8800 4600
Wire Wire Line
	8800 4600 8800 4800
Text GLabel 3150 4650 0    50   Input ~ 0
RGB-L
$Comp
L Lorize3:kbd_SK6812MINI-E L?
U 1 1 6217D725
P 5800 3800
AR Path="/6217D725" Ref="L?"  Part="1" 
AR Path="/62157E2E/6217D725" Ref="L3"  Part="1" 
F 0 "L3" H 5800 4062 51  0000 C CNN
F 1 "kbd_SK6812MINI" H 5800 3997 16  0000 C CNN
F 2 "lorize3:SK6812-MINI-E" H 5800 3800 60  0001 C CNN
F 3 "" H 5800 3800 60  0001 C CNN
	1    5800 3800
	-1   0    0    1   
$EndComp
Text GLabel 6000 3900 2    50   Input ~ 0
+5V
Text GLabel 5600 3700 0    50   Input ~ 0
GND
$Comp
L corne-chocolate-cache:Device_R R?
U 1 1 6217D730
P 3150 4500
AR Path="/6217D730" Ref="R?"  Part="1" 
AR Path="/62157E2E/6217D730" Ref="R12"  Part="1" 
F 0 "R12" H 3220 4546 50  0000 L CNN
F 1 "1k" H 3220 4455 50  0000 L CNN
F 2 "Keebio-Parts:Resistor-Hybrid-Back" V 3080 4500 50  0001 C CNN
F 3 "" H 3150 4500 50  0001 C CNN
	1    3150 4500
	1    0    0    -1  
$EndComp
$Comp
L Lorize3:kbd_SK6812MINI-E L?
U 1 1 6217D739
P 3350 3950
AR Path="/6217D739" Ref="L?"  Part="1" 
AR Path="/62157E2E/6217D739" Ref="L5"  Part="1" 
F 0 "L5" H 3350 4212 51  0000 C CNN
F 1 "kbd_SK6812MINI" H 3350 4147 16  0000 C CNN
F 2 "lorize3:SK6812-MINI-E" H 3350 3950 60  0001 C CNN
F 3 "" H 3350 3950 60  0001 C CNN
	1    3350 3950
	-1   0    0    1   
$EndComp
Text GLabel 3550 3550 2    50   Input ~ 0
+5V
Text GLabel 3550 4050 2    50   Input ~ 0
+5V
Text GLabel 3150 3350 0    50   Input ~ 0
GND
Text GLabel 3150 3850 0    50   Input ~ 0
GND
$Comp
L Lorize3:kbd_SK6812MINI-E L?
U 1 1 6217D745
P 3350 2950
AR Path="/6217D745" Ref="L?"  Part="1" 
AR Path="/62157E2E/6217D745" Ref="L7"  Part="1" 
F 0 "L7" H 3350 3212 51  0000 C CNN
F 1 "kbd_SK6812MINI" H 3350 3147 16  0000 C CNN
F 2 "lorize3:SK6812-MINI-E" H 3350 2950 60  0001 C CNN
F 3 "" H 3350 2950 60  0001 C CNN
	1    3350 2950
	-1   0    0    1   
$EndComp
Text GLabel 3550 3050 2    50   Input ~ 0
+5V
Text GLabel 3150 2850 0    50   Input ~ 0
GND
Wire Wire Line
	3550 2850 3600 2850
Text GLabel 5700 2700 2    50   Input ~ 0
+5V
$Comp
L Connector_Generic:Conn_01x03 J?
U 1 1 6219DDB0
P 5600 2500
AR Path="/6219DDB0" Ref="J?"  Part="1" 
AR Path="/62157E2E/6219DDB0" Ref="J2"  Part="1" 
F 0 "J2" H 5680 2542 50  0000 L CNN
F 1 "Conn_01x03" H 5680 2451 50  0000 L CNN
F 2 "Connectors:1X03_LONGPADS" H 5600 2500 50  0001 C CNN
F 3 "~" H 5600 2500 50  0001 C CNN
	1    5600 2500
	0    -1   -1   0   
$EndComp
Text GLabel 3450 2450 3    50   Input ~ 0
+5V
Text GLabel 3250 2450 3    50   Input ~ 0
GND
$Comp
L Connector_Generic:Conn_01x03 J?
U 1 1 6219E341
P 3350 2250
AR Path="/6219E341" Ref="J?"  Part="1" 
AR Path="/62157E2E/6219E341" Ref="J1"  Part="1" 
F 0 "J1" H 3430 2292 50  0000 L CNN
F 1 "Conn_01x03" H 3430 2201 50  0000 L CNN
F 2 "Connectors:1X03_LONGPADS" H 3350 2250 50  0001 C CNN
F 3 "~" H 3350 2250 50  0001 C CNN
	1    3350 2250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3350 2450 3350 2700
Text Notes 8550 1600 0    157  ~ 0
Blinky lights
$Comp
L Jumper:Jumper_2_Bridged JP4
U 1 1 62210800
P 4500 3250
F 0 "JP4" H 4500 3445 50  0000 C CNN
F 1 "Jumper_2_Bridged" H 4500 3354 50  0000 C CNN
F 2 "lorize3:ThickJumper" H 4500 3250 50  0001 C CNN
F 3 "~" H 4500 3250 50  0001 C CNN
	1    4500 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 3600 8500 3600
Wire Wire Line
	8350 3600 8500 3600
Wire Wire Line
	4100 3250 4300 3250
Wire Wire Line
	4700 3250 5050 3250
$Comp
L keebio:Hole H2
U 1 1 61892D41
P 2250 6750
F 0 "H2" H 2436 6803 60  0000 L CNN
F 1 "Hole" H 2436 6697 60  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 2250 6750 60  0001 C CNN
F 3 "" H 2250 6750 60  0001 C CNN
	1    2250 6750
	1    0    0    -1  
$EndComp
$Comp
L keebio:Hole H1
U 1 1 618935CD
P 1400 6700
F 0 "H1" H 1586 6753 60  0000 L CNN
F 1 "Hole" H 1586 6647 60  0000 L CNN
F 2 "Keebio-Parts:breakaway-mousebites" H 1400 6700 60  0001 C CNN
F 3 "" H 1400 6700 60  0001 C CNN
	1    1400 6700
	1    0    0    -1  
$EndComp
$Comp
L keebio:Hole H3
U 1 1 61894CE6
P 2950 6800
F 0 "H3" H 3136 6853 60  0000 L CNN
F 1 "Hole" H 3136 6747 60  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 2950 6800 60  0001 C CNN
F 3 "" H 2950 6800 60  0001 C CNN
	1    2950 6800
	1    0    0    -1  
$EndComp
$Comp
L keebio:Hole H4
U 1 1 618952F2
P 3800 6800
F 0 "H4" H 3986 6853 60  0000 L CNN
F 1 "Hole" H 3986 6747 60  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 3800 6800 60  0001 C CNN
F 3 "" H 3800 6800 60  0001 C CNN
	1    3800 6800
	1    0    0    -1  
$EndComp
$Comp
L keebio:Hole H5
U 1 1 61895977
P 4550 6850
F 0 "H5" H 4736 6903 60  0000 L CNN
F 1 "Hole" H 4736 6797 60  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 4550 6850 60  0001 C CNN
F 3 "" H 4550 6850 60  0001 C CNN
	1    4550 6850
	1    0    0    -1  
$EndComp
$Comp
L keebio:Hole H7
U 1 1 61895FE3
P 6300 6750
F 0 "H7" H 6486 6803 60  0000 L CNN
F 1 "Hole" H 6486 6697 60  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 6300 6750 60  0001 C CNN
F 3 "" H 6300 6750 60  0001 C CNN
	1    6300 6750
	1    0    0    -1  
$EndComp
$Comp
L keebio:Hole H6
U 1 1 61896535
P 5350 6800
F 0 "H6" H 5536 6853 60  0000 L CNN
F 1 "Hole" H 5536 6747 60  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 5350 6800 60  0001 C CNN
F 3 "" H 5350 6800 60  0001 C CNN
	1    5350 6800
	1    0    0    -1  
$EndComp
$Comp
L keebio:Hole H8
U 1 1 618B3BCA
P 1550 7300
F 0 "H8" H 1736 7353 60  0000 L CNN
F 1 "Hole" H 1736 7247 60  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 1550 7300 60  0001 C CNN
F 3 "" H 1550 7300 60  0001 C CNN
	1    1550 7300
	1    0    0    -1  
$EndComp
$Comp
L keebio:Hole H9
U 1 1 618B4C56
P 2200 7300
F 0 "H9" H 2386 7353 60  0000 L CNN
F 1 "Hole" H 2386 7247 60  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 2200 7300 60  0001 C CNN
F 3 "" H 2200 7300 60  0001 C CNN
	1    2200 7300
	1    0    0    -1  
$EndComp
$Comp
L keebio:Hole H10
U 1 1 618BA919
P 2950 7250
F 0 "H10" H 3136 7303 60  0000 L CNN
F 1 "Hole" H 3136 7197 60  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 2950 7250 60  0001 C CNN
F 3 "" H 2950 7250 60  0001 C CNN
	1    2950 7250
	1    0    0    -1  
$EndComp
$Comp
L keebio:Hole H11
U 1 1 618BB85C
P 3700 7300
F 0 "H11" H 3886 7353 60  0000 L CNN
F 1 "Hole" H 3886 7247 60  0000 L CNN
F 2 "Keebio-Parts:breakaway-mousebites" H 3700 7300 60  0001 C CNN
F 3 "" H 3700 7300 60  0001 C CNN
	1    3700 7300
	1    0    0    -1  
$EndComp
$Comp
L keebio:Hole H12
U 1 1 618BC8E4
P 4600 7350
F 0 "H12" H 4786 7403 60  0000 L CNN
F 1 "Hole" H 4786 7297 60  0000 L CNN
F 2 "Keebio-Parts:breakaway-mousebites" H 4600 7350 60  0001 C CNN
F 3 "" H 4600 7350 60  0001 C CNN
	1    4600 7350
	1    0    0    -1  
$EndComp
$Comp
L keebio:Hole H14
U 1 1 61C41F5C
P 5300 7150
F 0 "H14" H 5486 7203 60  0000 L CNN
F 1 "Hole" H 5486 7097 60  0000 L CNN
F 2 "Keebio-Parts:breakaway-mousebites" H 5300 7150 60  0001 C CNN
F 3 "" H 5300 7150 60  0001 C CNN
	1    5300 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 4700 5550 4700
$Comp
L Lorize3:kbd_SK6812MINI-E L?
U 1 1 618DEFCD
P 5800 3300
AR Path="/618DEFCD" Ref="L?"  Part="1" 
AR Path="/62157E2E/618DEFCD" Ref="L4"  Part="1" 
F 0 "L4" H 5800 3562 51  0000 C CNN
F 1 "kbd_SK6812MINI" H 5800 3497 16  0000 C CNN
F 2 "lorize3:SK6812-MINI-E" H 5800 3300 60  0001 C CNN
F 3 "" H 5800 3300 60  0001 C CNN
	1    5800 3300
	-1   0    0    1   
$EndComp
Text GLabel 6000 3400 2    50   Input ~ 0
+5V
Text GLabel 5550 3200 0    50   Input ~ 0
GND
Wire Wire Line
	5600 3200 5550 3200
Text GLabel 5500 2700 0    50   Input ~ 0
GND
Wire Wire Line
	5600 3000 5050 3000
Wire Wire Line
	5050 3000 5050 3250
$Comp
L Jumper:Jumper_2_Open JP12
U 1 1 6193E3D7
P 5350 4400
F 0 "JP12" H 5304 4498 50  0000 C TNN
F 1 "Jumper_2_Open" H 5395 4498 50  0001 C TNN
F 2 "lorize3:JUMPER_SMD_2DUB" H 5350 4400 50  0001 C CNN
F 3 "~" H 5350 4400 50  0001 C CNN
	1    5350 4400
	-1   0    0    1   
$EndComp
$Comp
L keebio:Hole H15
U 1 1 6196E386
P 6150 7200
F 0 "H15" H 6336 7253 60  0000 L CNN
F 1 "Hole" H 6336 7147 60  0000 L CNN
F 2 "Keebio-Parts:breakaway-mousebites" H 6150 7200 60  0001 C CNN
F 3 "" H 6150 7200 60  0001 C CNN
	1    6150 7200
	1    0    0    -1  
$EndComp
Text GLabel 9500 4250 2    50   Input ~ 0
C2
Text GLabel 9400 4900 2    50   Input ~ 0
C3
Wire Wire Line
	9400 4900 9400 4800
Wire Wire Line
	9500 4250 9400 4250
Wire Wire Line
	9400 4250 9400 4400
$Comp
L Lorize3:kbd_SK6812MINI-E L?
U 1 1 6217D759
P 3350 3450
AR Path="/6217D759" Ref="L?"  Part="1" 
AR Path="/62157E2E/6217D759" Ref="L6"  Part="1" 
F 0 "L6" H 3350 3712 51  0000 C CNN
F 1 "kbd_SK6812MINI-E" H 3350 3647 16  0000 C CNN
F 2 "lorize3:SK6812-MINI-E" H 3350 3450 60  0001 C CNN
F 3 "" H 3350 3450 60  0001 C CNN
	1    3350 3450
	-1   0    0    1   
$EndComp
Wire Wire Line
	3600 2700 3350 2700
Wire Wire Line
	4100 4300 3150 4300
Wire Wire Line
	4100 3250 4100 4300
Wire Wire Line
	3150 4050 3150 4300
Connection ~ 3150 4300
Wire Wire Line
	3150 4300 3150 4350
Wire Wire Line
	3550 3850 3550 3700
Wire Wire Line
	3550 3700 3150 3700
Wire Wire Line
	3150 3700 3150 3550
Wire Wire Line
	3550 3350 3550 3200
Wire Wire Line
	3550 3200 3150 3200
Wire Wire Line
	3150 3200 3150 3050
Wire Wire Line
	3600 2700 3600 2850
Wire Wire Line
	5700 3400 5600 3400
Wire Wire Line
	6000 3200 6000 2950
Wire Wire Line
	6000 2950 5600 2950
Wire Wire Line
	5600 2700 5600 2950
Connection ~ 5600 2950
Wire Wire Line
	5600 2950 5600 3000
Wire Wire Line
	6000 3700 6000 3550
Wire Wire Line
	6000 3550 5600 3550
Wire Wire Line
	5600 3550 5600 3400
Connection ~ 5600 3400
Wire Wire Line
	5600 3900 5600 4050
Wire Wire Line
	5600 4050 6050 4050
Wire Wire Line
	6050 4050 6050 4200
$Comp
L Lorize3:kbd_SK6812MINI-E L?
U 1 1 6217D753
P 5800 4300
AR Path="/6217D753" Ref="L?"  Part="1" 
AR Path="/62157E2E/6217D753" Ref="L2"  Part="1" 
F 0 "L2" H 5800 4562 51  0000 C CNN
F 1 "kbd_SK6812MINI" H 5800 4497 16  0000 C CNN
F 2 "lorize3:SK6812-MINI-E" H 5800 4300 60  0001 C CNN
F 3 "" H 5800 4300 60  0001 C CNN
	1    5800 4300
	-1   0    0    1   
$EndComp
Wire Wire Line
	6000 4700 6000 4550
Wire Wire Line
	6000 4550 5600 4550
Wire Wire Line
	5600 4550 5600 4400
Wire Wire Line
	5150 4400 5150 4900
Wire Wire Line
	5150 4900 5300 4900
Wire Wire Line
	5300 4900 5300 5000
Connection ~ 5300 4900
Wire Wire Line
	5300 4900 5600 4900
Wire Wire Line
	5550 4400 5600 4400
Connection ~ 5600 4400
$EndSCHEMATC
