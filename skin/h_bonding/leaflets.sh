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


g_hbond_d -f $TRJ -s $TPR -n $NDX -num L1_L1.xvg -b $BEGINTIME -e $ENDTIME <<+
17
17
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num L1_L2.xvg -b $BEGINTIME -e $ENDTIME <<+
17
18
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num L1_L3.xvg -b $BEGINTIME -e $ENDTIME <<+
17
19
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num L1_L4.xvg -b $BEGINTIME -e $ENDTIME <<+
17
20
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num L2_L2.xvg -b $BEGINTIME -e $ENDTIME <<+
18
18
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num L2_L3.xvg -b $BEGINTIME -e $ENDTIME <<+
18
19
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num L2_L4.xvg -b $BEGINTIME -e $ENDTIME <<+
18
20
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num L3_L3.xvg -b $BEGINTIME -e $ENDTIME <<+
19
19
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num L3_L4.xvg -b $BEGINTIME -e $ENDTIME <<+
19
20
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num L4_L4.xvg -b $BEGINTIME -e $ENDTIME <<+
20
20
+

exit 0
