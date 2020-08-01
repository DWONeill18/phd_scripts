#!/bin/bash


## (1) Declare varaibles

START_GRO="npt_6.tpr" # The name of the input (starting) gro file
TPR="npt_6.tpr"       # The name of the input tpr file
OUT="head.xvg"    # The name of the output file you want to create
NG=1                      # The number of groups you want to compute the density for
NDX="density.ndx"          # The name of the index file you want to create
XTC_ALL="combined_2.xtc"  # The name of your trajectory file

## (2) Create the index file (you will need to run some tests to get this right for your system)

# The first group is all the ceramide tail atoms
# The second group is all the ceramide short tail atoms
# The third group is all the ceramide long tail atoms
# The fourth group is the headgroup atoms
# The fifth group is the terminal tail atoms
# The sixth group is atom C1
# The seventh group is atom C2

make_ndx_d -f $START_GRO -o $NDX <<+
a C1 | a C2 | a C3 | a C4 | a C5 | a C6 | a C7 | a C8 | a C9 | a C10 | a C11 | a C12 | a C13 | a C14 | a C15 | a C27 | a C28 | a C29 | a C30 | a C31 | a C32 | a C33 | a C34 | a C35 | a C36 | a C37 | a C38 | a C39 | a C40 | a C41 | a C42 | a C43 | a C44 | a C45 | a C46 | a C47 | a C48 | a C49 
a C1 | a C2 | a C3 | a C4 | a C5 | a C6 | a C7 | a C8 | a C9 | a C10 | a C11 | a C12 | a C13 | a C14 | a C15
a C27 | a C28 | a C29 | a C30 | a C31 | a C32 | a C33 | a C34 | a C35 | a C36 | a C37 | a C38 | a C39 | a C40 | a C41 | a C42 | a C43 | a C44 | a C45 | a C46 | a C47 | a C48 | a C49
a C16 | a O17 | a H18 | a C19 | a C20 | a O21 | a H22 | a N23 | a H24 | a C25 | a O26
a C1 | a C49
a C1
a C49
name 6 all_tail
name 7 tail_1
name 8 tail_2
name 9 headgroup
q
+
                                                                                                          
wait

## (3) Run g_density to calculate densities across the box

# The numbers refer to the groups that you want to select from the index file

for i in 1 2 3 4
do

BEGINTIME=$(( (i-1) * 5000 ))
ENDTIME=$(( i * 5000 ))

g_density_d -f $XTC_ALL -n $NDX -s $TPR -o head_$i.xvg -ng $NG -d z -sl 50 -b $BEGINTIME -e $ENDTIME <<+
9
+

done
wait

## (4) Open the output in xmgrace

xmgrace -nxy head_1.xvg head_2.xvg head_3.xvg head_4.xvg  &

exit 0

