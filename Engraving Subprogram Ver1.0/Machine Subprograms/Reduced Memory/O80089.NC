%
O80089(Shape Subprogram)
(VERSION 1.0)
G103P1
IF[#2EQ#0]GOTO9010
IF[#24EQ#0]GOTO9011
IF[#25EQ#0]GOTO9012
IF[#26EQ#0]THEN#26=0
IF[#21EQ#0]THEN#21=1.
IF[#11EQ#0]THEN#11=.125
IF[#5EQ#0]THEN#5=5.
IF[#1EQ#0]THEN#1=0
IF[#9EQ#0]THEN#9=20.
IF[#19EQ#0]THEN#19=5000
IF[#7EQ#0]THEN#7=.003
IF[#17EQ#0]THEN#17=10.
IF[#23EQ#0]THEN#23=.25
IF[#8EQ#0]THEN#8=1.
IF[#21LT1]GOTO9013
IF[#21GT3]GOTO9013
IF[#5LT1]GOTO9014
IF[#5GT9]GOTO9014
IF[#8LT-1]GOTO9017
IF[#8EQ0]GOTO9017
IF[#8GT1]GOTO9017
#501=0
#502=0
#504=0
G65P#2A#3B#6
IF[#501EQ-1]GOTO9015
#504=[1+#501]
GOTO[1000*#21]
N1000#504=[[[#501]*[#11/2]]+[[#501-1]*[#11*#23]]]
M97P[1000+#5]
G90G00X#24Y#25S#19M03
G43H#4120Z[#26+.01]
WHILE[#502LT#501]DO1
G65P80090C#[#500+#502]X#24Y#25Z#7A#1H#11F#9Q#17
#24=#24+[COS[#1]*[[#23*#11]+#11/2]]
#25=#25+[SIN[#1]*[[#23*#11]+#11/2]]
#502=#502+1
END1
M99
N2000M97P2010
#32=ACOS[1-[[[#11/2]*[#11/2]]/[2*[[#18/2]*[#18/2]]]]]
#33=#23*[#32/2]
#504=[[[#501]*#32]+[[#501-1]*[#33]]]
IF[#504GT360]GOTO9016
M97P[2000+#5]
G90G0X[[COS[#1]*#18]+#24]Y[[SIN[#1]*#18]+#25]S#19M03
G43H#4120Z[#26+.01]
IF[#8EQ1.]GOTO2011
#502=#501-1
WHILE[#502GE0]DO1
GOTO2012
N2011WHILE[#502LT#501]DO1
N2012G65P80090C#[#500+#502]X[#24+[COS[#1]*[#18+[#11/2]]]]Y[#25+[SIN[#1]*[#18+[#11/2]]]]Z#7A[#1-[90*#8]]H#11F#9Q#17
#1=#1-[#32+#33]
#502=#502+#8
END1
M99
N3000G90G00X#24Y#25A#1S#19M03
#504=[[[#501]*[#11/2]]+[[#501-1]*[#11*#23]]]
IF[#22EQ#0]THEN#22=-1.
IF[#8EQ#0]THEN#8=1.
M97P[3019+[#22*10]+#8]
M97P[1000+#5]
G90G00X#24Y#25A#1S#19M03
G43H#4120Z[#26+.01]
WHILE[#502LT#501]DO1
G65P80090C#[#500+#502]X#24Y#25Z#7A#1H#11F#9Q#17
#24=#24+[COS[#1]*[[#23*#11]+#11/2]]
#25=#25+[SIN[#1]*[[#23*#11]+#11/2]]
#502=#502+1
END1
G107
M99
N1001#24=#24+[COS[#1]*[#11/4]]+[SIN[#1]*[#11/2]]
#25=#25+[SIN[#1]*[#11/4]]+[-COS[#1]*[#11/2]]
M99
N1002#24=#24-[COS[#1]*[[#504/2]-[#11/4]]]+[SIN[#1]*[#11/2]]
#25=#25-[SIN[#1]*[[#504/2]-[#11/4]]]+[-COS[#1]*[#11/2]]
M99
N1003#24=#24-[COS[#1]*[#504-[#11/4]]]+[SIN[#1]*[#11/2]]
#25=#25-[SIN[#1]*[#504-[#11/4]]]+[-COS[#1]*[#11/2]]
M99
N1004#24=#24+[COS[#1]*[#11/4]]
#25=#25+[SIN[#1]*[#11/4]]
M99
N1005#24=#24-[COS[#1]*[[#504/2]-[#11/4]]]
#25=#25-[SIN[#1]*[[#504/2]-[#11/4]]]
M99
N1006#24=#24-[COS[#1]*[#504-[#11/4]]]
#25=#25-[SIN[#1]*[#504-[#11/4]]]
M99
N1007#24=#24+[COS[#1]*[#11/4]]-[SIN[#1]*[#11/2]]
#25=#25+[SIN[#1]*[#11/4]]-[-COS[#1]*[#11/2]]
M99
N1008#24=#24-[COS[#1]*[[#504/2]-[#11/4]]]-[SIN[#1]*[#11/2]]
#25=#25-[SIN[#1]*[[#504/2]-[#11/4]]]-[-COS[#1]*[#11/2]]
M99
N1009#24=#24-[COS[#1]*[#504-[#11/4]]]-[SIN[#1]*[#11/2]]
#25=#25-[SIN[#1]*[#504-[#11/4]]]-[-COS[#1]*[#11/2]]
M99
N2001
N2004
N2007IF[#8EQ1.]THEN#1=#1-[#32/4]
IF[#8EQ-1.]THEN#1=#1+#504-[#32/2]-[#33/2]
M99
N2002
N2005
N2008#1=#1+[#504/2]-[#32/2]
M99
N2003
N2006
N2009IF[#8EQ1.]THEN#1=#1+#504-[#32/2]-[#33/2]
IF[#8EQ-1.]THEN#1=#1-[#32/4]
M99
N2010IF[#5LE6]THEN#18=#18-[#11/2]
IF[#5LE3]THEN#18=#18-[#11/2]
M99
N3000
N3041G107X0A0R#18
#1=0.
M99
N3001
N3040G107X0A0R#18
#1=180.
M99
N3010
N3031G107Y0A0R#18
#1=90.
M99
N3011
N3030G107Y0A0R#18
#1=270.
M99
N9010#3000=10(DETAIL BLOCK MISSING)
N9011#3000=11(X MISSING)
N9012#3000=12(Y MISSING)
N9013#3000=13(INVALID SHAPE)
N9014#3000=14(INVALID ALIGNMENT)
N9015#3000=15(NO DETAILS IN SUB)
N9016#3000=16(ENGRAVING WILL OVERLAP)
N9017#3000=17(INVALID DIRECTION)
%