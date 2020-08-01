#!/bin/bash


# calculates order parameters of ceramide lipid hydrocarbon tails

# variables

START_GRO="npt_9.tpr"
TRJ="combined_2.xtc"
BEGINTIME=0
TPR="npt_9.tpr"

# for each lipid tail we need to create an index file
# that contains the atom indices of each tail atom

# 1st tail

make_ndx_d -f $START_GRO -o tail_1.ndx <<+
del 6
del 5
del 4
del 3
del 2
del 1
del 0
r CER2 & a C27
r CER2 & a C28
r CER2 & a C29
r CER2 & a C30
r CER2 & a C31
r CER2 & a C32
r CER2 & a C33
r CER2 & a C34
r CER2 & a C35
r CER2 & a C36
r CER2 & a C37
r CER2 & a C38
r CER2 & a C39
r CER2 & a C40
r CER2 & a C41
r CER2 & a C42
r CER2 & a C43
r CER2 & a C44
r CER2 & a C45
r CER2 & a C46
r CER2 & a C47
r CER2 & a C48
r CER2 & a C49
q
+

wait

# 2nd tail

make_ndx_d -f $START_GRO -o tail_2.ndx <<+
del 6
del 5
del 4
del 3
del 2
del 1
del 0
r CER2 & a C15
r CER2 & a C14
r CER2 & a C13
r CER2 & a C12
r CER2 & a C11
r CER2 & a C10
r CER2 & a C9
r CER2 & a C8
r CER2 & a C7
r CER2 & a C6
r CER2 & a C5
r CER2 & a C4
r CER2 & a C3
r CER2 & a C2
r CER2 & a C1
q
+

wait

# if necessary join up the trajectory files


# trjcat -f traj*.xtc -o $TRJ

# calculate the order parameters for each tail using g_order

for i in 1 2
do

    g_order_d -f $TRJ -n tail_$i.ndx -s $TPR -o order_tail_$i.xvg -d z -szonly -b $BEGINTIME

    rm sliced.xvg

	wait
done

exit 0
