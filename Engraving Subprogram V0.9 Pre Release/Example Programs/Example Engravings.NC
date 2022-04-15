%
O00001
(Engraving Test Program)

(Set Persistants)
#500= 510
#503= 54

(Start Up)
G90 G80 G17
G28 G91 Z0
T01 M06

(Select Test 1-10)
#200=10
GOTO#200


(Arc Test on 4" Dia Bolt Circle)
(Middle Center Justify)
(90 Degrees)
(Default Settings)
N1 G65 P80089 B1000. X0 Y0 R2.0 A90. J5. U2.
M30

(Arc Test on 4" Dia Circle)
(Bottom Left Justify)
(270. Degrees)
(Default Settings)
N2 G65 P80089 B1003. X0 Y0 R1.6 A44. J5. U2. W0.
M30

(Line Test Y-1.) 
(Zero Angle)
(Top Center Justify)
(Default Settings)
N3 G65 P80089 B1000 X0 Y-1. J2. U1.
M30

(Line Test X-1.) 
(Zero Angle)
(Right Bottom Justify)
(Default Settings)
N4 G65 P80089 B1000. X-1. Y0 J9. U1.
M30

(Line Test X-3.) 
(45 Deg Angle)
(Left Bottom Justify)
(Default Settings)
N5 G65 P80089 B1000. X1. Y1. J5. U1.
M30

(FULL CHARACTER SET LINEAR TEST) 
(Zero Angle)
(Center Bottom Justify)
(Default Settings)
N6 G65 P80089 B1001. X0. Y0. J5. U1. W.375
M30

(FULL CHARACTER SET ARC TEST) 
(Top Right Justify)
(Zero Degrees)
(Default Settings)
N7 G00 X2.25
G91 G02 X0 Y0 I-2.25 J0 
G90 G65 P80089 B1004. X0 Y0 R2.25 A90. J9. U2.
M30

(SERIAL NUMBER TEST) 
(MIDDLE CENTER Justify)
(Zero Degrees)
(Default Settings)
N8 
#100=1
#101=1
G65 P80089 B1002 X0 Y3.5 J5. U1.
G65 P80089 B1002 X0 Y3. J5. U1.
G65 P80089 B1002 X0 Y2.5 J5. U1.
G65 P80089 B1002 X0 Y2. J5. U1.
G65 P80089 B1002 X0 Y1.5 J5. U1.
G65 P80089 B1002 X0 Y1. J5. U1.
G65 P80089 B1002 X0 Y.5 J5. U1.
G65 P80089 B1002 X0 Y0. J5. U1.
M30

(SERIAL NUMBER TEST ARC) 
(MIDDLE CENTER Justify)
(Zero Degrees)
(Default Settings)
N9 
#100=1
#101=1
G65 P80089 B1002 X0 Y0 R3. A0. J3. U2. W0
G65 P80089 B1002 X0 Y0 R3. A60. J3. U2. W0
G65 P80089 B1002 X0 Y0 R3. A120. J3. U2. W0
G65 P80089 B1002 X0 Y0 R3. A180. J3. U2. W0
G65 P80089 B1002 X0 Y0 R3. A240. J3. U2. W0
G65 P80089 B1002 X0 Y0 R3. A300. J3. U2. W0
G65 P80089 B1002 X8. Y0 R3. A0. J3. U2. W0
G65 P80089 B1002 X8. Y0 R3. A60. J3. U2. W0
G65 P80089 B1002 X8. Y0 R3. A120. J3. U2. W0
G65 P80089 B1002 X8. Y0 R3. A180. J3. U2. W0
G65 P80089 B1002 X8. Y0 R3. A240. J3. U2. W0
G65 P80089 B1002 X8. Y0 R3. A300. J3. U2. W0
M30

N10 (360 DEGREES TEST)
#103=5
WHILE [#103 LT 361] DO1
G65 P80089 B1005 X0 Y0 R10. A#103 J5. U2. W0.001 H.25
END1
M30
%
(=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=)
(=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=)
%
O1005 (DEGREES)
G65 P80088 D103. H5.
M99
%
(=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=)
(=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=)
%
O1000 (TEST ENGRAVE)
G65 P80088 A355414. (TEST)
G65 P80088 A6455. S1. (ING )
G65 P80088 B123456. (123456)
G65 P80088 C2. S-1. (-)
G65 P80088 D100. E3. (Serial Number)
G65 P80088 D101. F1. (Sequential Letter)
M99
%
(=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=)
(=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=)
%
O1001 (FULL CHARACTER SET)
G65 P80088 A19010. (ABCD)
G65 P80088 A3543. (EFG)
G65 P80088 A5652. (HIJ)
G65 P80088 A7761. (KLM)
G65 P80088 A9870. (NOP)
G65 P80088 A11979. (QRS)
G65 P80088 A14088. (TUV)
G65 P80088 A16197. (WXY)
G65 P80088 A26. S1. (Z )
G65 P80088 B123456. (123456)
G65 P80088 B7890. (7890)
#106 = 1.
WHILE[#106 NE 16] DO1
G65 P80088 C#106
#106=#106+1
END1
M99
%
(=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=)
(=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=)
%
O1002 (SERIAL NUMBERS)
G65 P80088 C2.
G65 P80088 D100. E3. H[1/6] (Serial Number)
G65 P80088 D101. M6. R1. F1. (Sequential Letter)
M99
%
(=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=)
(=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=)
%
O1003 (SERIAL NUMBERS)
G65 P80088 A9. S1.(Serial Number)
G65 P80088 A8524. (Sequential Letter)
G65 P80088 A5. S1.
G65 P80088 A17311. S1.
G65 P80088 C9.
G65 P80088 B3. S1.
G65 P80088 C9.
G65 P80088 B3. S1.
G65 P80088 C9.
G65 P80088 B3.
M99
%
(=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=)
(=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=)
%
O1004 (11 X'S)
#106 = 1.
WHILE[#106 NE 12] DO1
G65 P80088 A24.
#106=#106+1
END1
M99
%
