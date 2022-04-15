%
O80088(Detail Subprogram)
(G65 P80088 ABCD EFHMRKS)

(All Inputs MUST have a decimal point)

(A.1 is for Alphabetical Input)
(B.2 is for Numerical Input)
(C.3 is for Special Character Input)
(D.7 is for Sequential/Serial[SS] Variable) 
(E.8 is for Optional Padding) 
(F.9 is for Optional SS Number/Letter Boolean) 
(H.11 is for Optional SS Count Increment) 
(M.13 is for Optional SS Max Number) 
(R.18 is for Optional SS Reset Number) 
(K.6 is for Optional SS Dash) 
(S.19 is for Optional Spaces) 
(10 IS FOR DIGITS)
(12 IS FOR DECIMAL DIGITS) 
(500 is List Start) 
(501 is List UBound) 
(502 is List Index)
(503 is List Max)

G103 P1

(CLEANUP INPUTS)
#1=ABS[FIX[#1]]
#3=ABS[FIX[#3]]
#7=ABS[FIX[#7]]
#8=ABS[FIX[#8]]
#19=ROUND[#19]
#12=#0

(Add Leading Spaces)
WHILE[#19 LT 0]DO1
IF[#501 EQ #503]GOTO9002
#[#500+#501]=0
#501=[#501+1]
#19=[#19+1]
END1

(Check Null Input)
IF[[#1+#2+#3+#7] EQ #0]GOTO5

(CHECK INPUT EXCLUSIVITY)
IF[[#1+#2+#3+#7] EQ #1]GOTO10
IF[[#1+#2+#3+#7] EQ #2]GOTO20
IF[[#1+#2+#3+#7] EQ #3]GOTO30
IF[[#1+#2+#3+#7] EQ #7]GOTO40
GOTO9001

N10(APPEND LETTERS)

#12 = #1
#8=0
#9=0

(Check Single Digit)
IF[#1 LE 26] GOTO4

#11=0
#10=26
WHILE [#12 GT [#10+#9]]DO1
#10=#8
#11=26
WHILE [#10 GT 0] DO2
#11=[#11*26]
#10=[#10-1]
END2
#9=[#11+#9]
#8=[#8+1]
END1
#9=[#9-#11]

#12 = #1
#10=#8
#11=26
WHILE [#10 GT 1] DO1
#11=[#11 * 26]
#10=[#10 - 1]
END1
IF [#12 NE [#9 + #11]] GOTO1
WHILE [#8 GT 0] DO1
IF[#501 EQ #503]GOTO9002
#[#500 + #501]=26
#8=[#8 - 1]
#501=[#501 + 1]
END1
GOTO5 (Complete)

N1
WHILE[#8 GT 1]DO1
#10=[#8-1]
#11=26
WHILE [#10 GT 1] DO2
#11=[#11 * 26]
#10=[#10 - 1]
END2

IF[[#12-[FIX[#12/[#11]]*#11]] NE 0] GOTO2
IF[#501 EQ #503]GOTO9002
#[#500 + #501]=FIX[[#12-#11]/#11]
#12= [#12-[FIX[[#12-#11]/#11]*#11]]
#501=[#501 + 1]
GOTO3

N2
IF[#501 EQ #503]GOTO9002
#[#500 + #501]= FIX[#12/[#11]]
#12=[#12-[FIX[#12/[#11]]*#11]]
#501=[#501+1]

N3
#8=[#8-1]
END1
N4
IF[#501 EQ #503]GOTO9002
#[#500 + #501]= #12
#501=[#501 + 1]
N5
IF[#19 GT 0]GOTO50
G103
M99


(Number Subprogram) 
(Input #2 is a number) 
(Output is Digits appended to list) 
(Variable, Description, Type) 
(#500, Start of list range, Global)
(#501, Current list position, Global)
(#503, List max, Global)
(#2, input number, Local) 
(#10, digit counter, Local)
(#12 IS FOR DECIMAL DIGITS)
N20(Append Numbers)

(CHECK FOR NEGATIVE)
IF[#2GT0]GOTO21
IF[#501 EQ #503]GOTO9002
#[#500+#501]=38
#501=[#501+1]
#2=ABS[#2]

(CHECK FOR DECIMALS)
N21 IF[[FIX[#2]NE#2]]THEN #12=[[#2-[FIX[#2]]]*10]
IF[#12NE#0]THEN #2=FIX[#2]

(SEPERATE DIGITS)
#10=1
WHILE[#2GE10]DO1
#10=[#10+1]
#2=[#2/10]
END1

(Add Padding)
WHILE[#10 LT #8]DO1
IF[#501 EQ #503]GOTO9002
#[#500+#501]=27
#501=[#501+1]
#8=[#8-1]
END1

(QUEUE NUMBERS)
WHILE[#10 NE 1]DO1
IF[#501 EQ #503]GOTO9002
#[#500+#501]= [FIX[#2]+27]
#501=[#501+1]
#2=[10*[#2-FIX[#2]]]
#10=[#10-1]
END1
IF[#501 EQ #503]GOTO9002
#[#500+#501]= [ROUND[#2]+27]
#501=[#501+1]
IF[#12EQ#0]GOTO2

(TRUNCATE DECIMAL)
#10=1
WHILE[#10LT4]DO1
#12=#12*10
#10=#10+1
END1
#12=ROUND[#12]*.001

(QUEUE DECIMAL DIGITS)
IF[#501 EQ #503]GOTO9002
#[#500+#501]=37
#501=[#501+1]
WHILE[#12NE0]DO1
IF[#10EQ1]THEN #12=ROUND[#12]
IF[#501 EQ #503]GOTO9002
#[#500+#501]=[FIX[#12]+27]
#501=[#501+1]
#12=[[#12-FIX[#12]]*10]
#10=#10-1
END1
(TEST DECIMAL POINT)
IF[#[#500+#501-1]EQ37]THEN #501=[#501-1]
GOTO2

N1
WHILE[#7GT1]DO1
IF[#501 EQ #503]GOTO9002
#[#500+#501]=27
#501=[#501+1]
#7=[#7-1]
END1
IF[#501 EQ #503]GOTO9002
#[#500+#501]= [FIX[#2]+27]
#501=[#501+1]

N2
IF[#19 GT 0]GOTO50
G103 
M99

N30 (Special Characters)
IF[#501 EQ #503]GOTO9002
#[#500+#501]= [#3+36]
#501=[#501+1]
IF[#19 GT 0]GOTO50
G103 
M99

N40 (Serial Sequential)
(SET DEFAULT VALUES)
IF [#9 EQ #0] THEN #9 = 0
IF [#11 EQ #0] THEN #11 = 1
IF [#13 EQ #0] THEN #13 = -1
IF [#18 EQ #0] THEN #18 = 1
(TEST FOR LIMIT)
IF [#13 EQ -1] GOTO41
IF [#18 GT #13] GOTO9003
IF [#[#7] GT #13] THEN #[#7] = #18
(ADD DASH IF REQUESTED)
N41 IF[#6NE1.]GOTO42
IF[#501 EQ #503]GOTO9002
#[#500+#501]=38
#501=[#501+1]
(APPEND LETTERS/NUMBERS)
N42 IF [#9 EQ 0] GOTO43
IF [#9 EQ 1] GOTO44
N43 G65 P80088 B#[#7] E#8
GOTO45
N44 G65 P80088 A#[#7]
N45 #[#7] = #[#7] + #11
(TRAILING SPACES)
IF[#19 GT 0]GOTO50
G103 
M99


N50 (Add Trailing Spaces)
WHILE[#19 GT 0]DO1
IF[#501 EQ #503]GOTO9002
#[#500+#501]=0
#501=[#501+1]
#19=[#19-1]
END1
G103
M99

(ERROR CODES)
N9001 #3000=1(Missing Mandatory Input A,B,C or D)
N9002 #3000=2(Character Limit Reached)
N9003 #3000=3(R can not be greater than M)
%