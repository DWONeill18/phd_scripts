#!/bin/bash

# David O'Neill

## (1) Declare varaibles

TPR="0.tpr"       # The name of the input tpr file
XTC_ALL="0_R.xtc"  # The name of your trajectory file
INDEX="index.ndx"
NG="2"

## (3) Run g_density to calculate densities across the box

# The numbers refer to the groups that you want to select from the index file

for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14
do

#BEGINTIME=$(( (i-1) * 10000 ))
#ENDTIME=$(( i * 10000 ))

g_density_d -f $XTC_ALL -s $TPR -o all_density.xvg -sl 100 -ng $NG <<+
2
3
+

done
wait

exit 0
