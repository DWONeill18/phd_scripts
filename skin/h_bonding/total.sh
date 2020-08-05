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


g_hbond_d -f $TRJ -s $TPR -n $NDX -num cer_cer.xvg -b $BEGINTIME -e $ENDTIME <<+
2
2
+

#g_hbond_d -f $TRJ -s $TPR -n $NDX -num cer_water.xvg -b $BEGINTIME -e $ENDTIME <<+
#2
#3
#+

exit 0
