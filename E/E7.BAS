
 2  REM  APPLE-II-ELLIPSES 2020
 3  HGR 
 4  REM  RUN FROM HERE TO SKIP HGR/CLEAN AND OVERLAY NEW DRAWINGS
 5  REM  DRAWING OF ELLIPSES, INCLUDING ROTATION. BY TODOR ARNAUDOV - TOSH, AKA TWENKID. HTTP://TWENKID.COM. 4.10.2020
 7  REM  SIN AND COS ARE EXCHANGED, BUT IT'S FINE (BY DEFAULT OX+RX(COS(I
     ): OY+RY*SIN(I)
 8  REM  EXTEND TO DRAW DIFF SIZES, AXES, PATTERNS OF INCLUSION ETC. ENCO
     DE IN SOME CODE WHICH DEFINES IT
 9  REM  CODED USING APPLEIN 1.29. FOR QUICK DRAWING ADJUST THE EMULATOR 
     TO MAX SPEED
 10  REM : HGR
 11  POKE  - 16304,0: REM  SWITCH TO GRAPHICS WITHOUT CLEAR SCREEN
 13  REM  7.10.2020 DD.MM.YY - MORE PARAMETERS. SHOULD BE WITH A PROGRAMM
     ABLE SEQUENCE AND INTERACTIVE ADJUSTMENT
 14  REM  SEE 900-1000 FOR PARAMS AND ADJUSTMENTS PER STEP
 15 PI = 3.141592:TP = 6.2831
 19 C = 1
 20  HCOLOR= C
 30 RX = 60
 34 RY = 80
 35 RY = 30
 40 RY = 4
 41 RX = 5
 42  GOSUB 900: REM  INIT
 45 S = 30
 50 ST = TP / S
 53 T3 = TP + ST
 55 OX = 140:OY = 80
 60 AN = TP / 12
 62 AN = TP / 17
 70 X1 = OX + RX *  SIN (I):Y1 = OY + RY *  COS (I)
 80 DX = X1 - OX:DY = Y1 - OY
 85 D =  SQR (DX * DX + DY * DY)
 86  IF DX = 0 THEN A3 = 0: GOTO 95
 90 A2 =  ATN (DY / DX)
 93 A3 = A2 + AN
 94  PRINT "A3????"
 95 X1 = OX + D *  SIN (A3)
 99 Y1 = OY + D *  COS (A3)
 100  PRINT DX,DY
 101  HPLOT OX,OY
 102  GOTO 110
 105  HPLOT X1,Y1
 110 XS = X1:YS = Y1
 111 C1 = 1.0:C2 = TP:C3 = PI / 1.5
 112 C3 = PI / 17
 113  FOR AN = C1 TO C2 + C3 STEP C3
 114 N = 0:C = C + 1: IF C = 4 THEN C = 5
 115  IF C = 8 THEN C = 1
 116  HCOLOR= C
 118  IF SA = 1 THEN AN = C1: REM  DONT ROTATE THE ELLIPSE. SAME ANGLE
 119  IF CC = 1 THEN  HCOLOR= C9
 120  FOR I = 0 TO T3 STEP ST
 130 X = OX + RX *  SIN (I)
 135 Y = OY + RY *  COS (I)
 140 DX = X - OX:DY = Y - OY
 145 D =  SQR (DX * DX + DY * DY)
 147  IF DX = 0 THEN A3 = I: GOTO 170
 150 A2 =  ATN (DY / DX)
 152  IF I > PI AND I < TP THEN A2 = A2 + PI
 155  PRINT A2
 160 A3 = A2 + AN
 170 X = OX + D *  SIN (A3)
 172 Y = OY + D *  COS (A3)
 177  IF (X < 0 OR X > 279 OR X1 < 0 OR X1 > 279 OR Y < 0 OR Y > 159 OR Y
     1 < 0 OR Y1 > 159) GOTO 190
 179  IF N < 2 GOTO 189
 180  REM  HPLOT X1,Y1 TO X,Y
 181  REM  HPLOT X,Y:     
 182  HPLOT X1,Y1 TO X,Y
 189  REM 
 190  REM 
 195 X1 = X:Y1 = Y
 197  PRINT X1,Y1: PRINT X,Y
 198 N = N + 1
 199  PRINT N
 200  NEXT 
 210  REM 
 212  GOSUB 1100: REM  ADJUST PARAMS
 220  NEXT AN
 899  END 
 900  REM  INIT
 910 R9 = 5: REM  STEP CHANGE RADIUS X
 915 R8 = 3: REM  STEP CHANGE RY
 918 R8 = 12
 920 SA = 1: REM  SAME ANGLE
 922 SA = 0
 924 C9 = 3
 925 O9 =  - 3:O8 =  - 2
 928 O9 = 3:O8 = 2
 930 O9 = 0:O8 = 0:R9 = 4:R8 = 4
 935 CC = 1
 999  RETURN 
 1100  REM  ADJUST PAR
 1104  REM  SHOULD BE WITH RECORDS: DATA ... ETC. OR GENERATED, FOR EACH 
     STEP
 1110 RX = RX + R9:RY = RY + R8
 1120 OX = OX + O9:OY = OY + O8
 1199  RETURN 
