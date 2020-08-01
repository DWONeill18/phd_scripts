#!/bin/bash


# calculates order parameters of ceramide lipid hydrocarbon tails

# variables

START_GRO="cer.gro"
TRJ="joinedwhole.xtc"
BEGINTIME=0
TPR="cer.tpr"

# for each lipid tail we need to create an index file
# that contains the atom indices of each tail atom

# head group

make_ndx_d -f $START_GRO -o head_vector.ndx <<+
del 6
del 5
del 4
del 3
del 2
del 1
del 0
r CER2 & a C19
r CER2 & a C20
r CER2 & a O21
r CER2 & a H22
q
+

wait

# if necessary join up the trajectory files


# trjcat -f traj*.xtc -o $TRJ

# calculate the order parameters for each tail using g_order


g_order_d -f $TRJ -n head_vector.ndx -s $TPR -o order_vector.xvg -d z -szonly -b $BEGINTIME

rm sliced.xvg

	wait
done

exit 0
