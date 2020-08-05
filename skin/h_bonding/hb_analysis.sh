#!/bin/bash


# calculates hydrogen bonds between various functional groups on CER2 between different leaflets [total hbonds]

# variables

TRJ="last_20ns.xtc"
TPR="npt_6.tpr"
NDX="0wpl_hb_index.ndx"

# for each lipid tail we need to create an index file
# that contains the atom indices of each tail atom


# calculate the hydrogen bonding using h_bond

for i in 1 2 3 4
do

BEGINTIME=$(((i-1)*5000))
ENDTIME=$((i*5000))

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G21_total.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
21
2
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G22_total.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
22
2
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G23_total.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
23
2
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G24_total.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
24
2
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G25_total.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
25
2
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G26_total.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
26
2
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G27_total.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
27
2
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G28_total.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
28
2
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G29_total.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
29
2
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G30_total.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
30
2
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G31_total.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
31
2
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G32_total.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
32
2
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G33_total.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
33
2
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G34_total.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
34
2
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G35_total.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
35
2
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G36_total.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
36
2
+

	wait

done

exit 0
