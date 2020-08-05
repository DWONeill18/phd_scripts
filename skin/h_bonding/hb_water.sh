#!/bin/bash


# calculates hydrogen bonds between various functional groups on CER2 between different leaflets

# variables

TRJ="last_20ns.xtc"
TPR="npt_6.tpr"
NDX="0wpl_hb_index.ndx"

# for each lipid tail we need to create an index file
# that contains the atom indices of each tail atom


# calculate the hydrogen bonding using h_bond

BEGINTIME=0
ENDTIME=20000

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G13W.xvg -b $BEGINTIME -e $ENDTIME <<+
13
3
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G14W.xvg -b $BEGINTIME -e $ENDTIME <<+
14
3
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G15W.xvg -b $BEGINTIME -e $ENDTIME <<+
15
3
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G16W.xvg -b $BEGINTIME -e $ENDTIME <<+
16
3
+

exit 0
