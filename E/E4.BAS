

 10  HGR 
 15 PI = 3.141592:TP = 6.2831
 20  HCOLOR= 3
 30 RX = 60
 34 RY = 80
 35 RY = 30
 45 S = 30
 50 ST = TP / S
 53 T3 = TP + ST
 55 OX = 140:OY = 80
 60 AN = TP / 12
 65 AN = PI / 12
 66 I = 0
 70 X1 = OX + RX *  SIN (I):Y1 = 
     OY + RY *  COS (I)
 80 DX = X1 - OX:DY = Y1 - OY
 85 D =  SQR (DX * DX + DY * DY)
 86  IF DX = 0 THEN A3 = 0: GOTO 
     95
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
 113  FOR AN = 1.0 TO 1.7 STEP 0.
     25
 115 N = 0
 120  FOR I = 0 TO T3 STEP ST
 130 X = OX + RX *  SIN (I)
 135 Y = OY + RY *  COS (I)
 140 DX = X - OX:DY = Y - OY
 145 D =  SQR (DX * DX + DY * DY)
     
 147  IF DX = 0 THEN A3 = I: GOTO 
     170
 150 A2 =  ATN (DY / DX)
 152  IF I > PI AND I < TP THEN A
     2 = A2 + PI
 155  PRINT A2
 160 A3 = A2 + AN
 170 X = OX + D *  SIN (A3)
 172 Y = OY + D *  COS (A3)
 177  IF (X < 0 OR X > 279 OR X1 < 
     0 OR X1 > 279 OR Y < 0 OR Y > 
     159 OR Y1 < 0 OR Y1 > 159) GOTO 
     190
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
 220  NEXT AN
