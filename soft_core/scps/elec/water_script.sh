#!/bin/bash

MDP="nve.mdp"
TOPOL="topol.top"

for i in 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
do

GRO="new.$i.gro"
#Z=$(( i/10 ))
#printf "%d.%03d\n" $(( Z ))

Z=$(echo "scale=3; $i/10.0" | bc)
A=$(echo "scale=3; $Z - 0.066" | bc)
B=$(echo "scale=3; $Z - 0.004" | bc)

echo "water" > new.$i.gro
echo " 6" >> new.$i.gro

echo "    1SOL     OW    1   3.000   1.000   2.374  0.5747  0.6730 -0.5131" >> new.$i.gro
echo "    1SOL    HW1    2   3.038   1.035   2.289  0.6892  1.2401 -0.6925" >> new.$i.gro
echo "    1SOL    HW2    3   3.020   1.065   2.448 -0.8427 -0.5777 -1.1806" >> new.$i.gro
echo "    2SOL     OW    4   3.000   $Z   2.374 -0.4125 -0.0365  0.2718" >> new.$i.gro
echo "    2SOL    HW1    5   3.016   $A   2.448 -0.4705 -1.3343  1.4741" >> new.$i.gro
echo "    2SOL    HW2    6   3.075   $B   2.308  0.5017 -0.0222  1.2928" >> new.$i.gro
echo "   4.000   4.000  4.000 " >> new.$i.gro

TPR="$i"
grompp_d -f $MDP -c $GRO  -p $TOPOL -o $TPR
rm \#mdout.mdp.*
mdrun_d -s $TPR -o $i -x $i -cpi $i -c $i -e $i -g $i
done

exit 0

