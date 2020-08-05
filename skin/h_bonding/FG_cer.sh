#!/bin/bash


# calculates hydrogen bonds between various functional groups on CER2 between different leaflets [total hbonds]

# variables

TRJ="last_20ns.xtc"
TPR="npt_6.tpr"
NDX="0wpl_hb_index.ndx"

# for each lipid tail we need to create an index file
# that contains the atom indices of each tail atom


# calculate the hydrogen bonding using h_bond

BEGINTIME=0
ENDTIME=20000


g_hbond_d -f $TRJ -s $TPR -n $NDX -num G13_L1.xvg -b $BEGINTIME -e $ENDTIME <<+
13
17
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G13_L2.xvg -b $BEGINTIME -e $ENDTIME <<+
13
18
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G13_L3.xvg -b $BEGINTIME -e $ENDTIME <<+
13
19
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G13_L4.xvg -b $BEGINTIME -e $ENDTIME <<+
13
20
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G14_L1.xvg -b $BEGINTIME -e $ENDTIME <<+
14
17
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G14_L2.xvg -b $BEGINTIME -e $ENDTIME <<+
14
18
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G14_L3.xvg -b $BEGINTIME -e $ENDTIME <<+
14
19
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G14_L4.xvg -b $BEGINTIME -e $ENDTIME <<+
14
20
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G15_L1.xvg -b $BEGINTIME -e $ENDTIME <<+
15
17
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G15_L2.xvg -b $BEGINTIME -e $ENDTIME <<+
15
18
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G15_L3.xvg -b $BEGINTIME -e $ENDTIME <<+
15
19
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G15_L4.xvg -b $BEGINTIME -e $ENDTIME <<+
15
20
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G16_L1.xvg -b $BEGINTIME -e $ENDTIME <<+
16
17
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G16_L2.xvg -b $BEGINTIME -e $ENDTIME <<+
16
18
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G16_L3.xvg -b $BEGINTIME -e $ENDTIME <<+
16
19
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G16_L4.xvg -b $BEGINTIME -e $ENDTIME <<+
16
20
+

exit 0
