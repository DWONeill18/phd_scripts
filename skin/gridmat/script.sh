#!bin/bash

#Davd O'Neill
#Last modified 16/10/13

## (1) Declare varaibles

START_GRO="npt_5.tpr" # The name of the input (starting) gro file
TPR="npt_5.tpr"       # The name of the input tpr file
OUT_ONE="test_1.gro"    # The name of the output file you want to create
OUT_TWO="test_2.gro"    # The name of the output file you want to create
#NG=1                      # The number of groups you want to compute the density for
NDX="bilayer_separate.ndx"          # The name of the index file you want to create
XTC_ONE="combined.xtc"  # The name of your trajectory file
XTC_TWO="combined_2.xtc"  # The name of your trajectory file
BEGINTIME=0             # The time in ps that you want to start averaging from
ENDTIME=1000		# The time in ps that we finsih averaging

## (2) Create the index file (you will need to run some tests to get this right for your system)

# The first group is all the atoms in one bilayer
# The second group is all the atoms in the second bilayer

make_ndx_d -f $START_GRO -o $NDX <<+

r 1-284
r 285-568
name 3 bilayer1
name 4 bilayer2
q
+
                                                                                    
wait

## (3) Run trjconv_d to cut into separate bilayers

# The numbers refer to the groups that you want to select from the index file
 
trjconv_d -f $XTC_ONE -n $NDX -s $TPR -o $OUT_ONE -b $BEGINTIME -e $ENDTIME -skip 100 -sep <<+
3
4
+
genconf_d -f $OUT_ONE -o $OUT_ONE -renumber
genconf_d -f $OUT_TWO -o $OUT_TWO -renumber
## (4) Run GridMat

perl GridMAT-MD.pl param_one
perl GridMAT-MD.pl param_two

exit 0

#repeat

#cut average_answers
#calculate average it for thickness at each frame
#paste into another file 
