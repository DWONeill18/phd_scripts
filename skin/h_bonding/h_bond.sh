#!/bin/bash


# calculates hydrogen bonds between various functional groups on CER2 between different leaflets

# variables

TRJ="last_20ns.xtc"
TPR="npt_6.tpr"
NDX="0wpl_hb_index.ndx"

# for each lipid tail we need to create an index file
# that contains the atom indices of each tail atom


# calculate the hydrogen bonding using h_bond

for i in 1 2 3 4
do

BEGINTIME=$(((i-1)*5000))
ENDTIME=$(((i*5000)))

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G21G21.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
21
21
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G21G22.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
21
22
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G21G23.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
21
23
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G21G24.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
21
24
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G21G25.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
21
25
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G21G26.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
21
26
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G21G27.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
21
27
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G21G28.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
21
28
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G21G29.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
21
29
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G21G30.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
21
30
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G21G31.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
21
31
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G21G32.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
21
32
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G21G33.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
21
33
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G21G34.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
21
34
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G21G35.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
21
35
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G21G36.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
21
36
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G22G22.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
22
22
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G22G23.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
22
23
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G22G24.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
22
24
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G22G25.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
22
25
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G22G26.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
22
26
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G22G27.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
22
27
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G22G28.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
22
28
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G22G29.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
22
29
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G22G30.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
22
30
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G22G31.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
22
31
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G22G32.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
22
32
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G22G33.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
22
33
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G22G34.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
22
34
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G22G35.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
22
35
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G22G36.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
22
36
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G23G23.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
23
23
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G23G24.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
23
24
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G23G25.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
23
25
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G23G26.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
23
26
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G23G27.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
23
27
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G23G28.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
23
28
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G23G29.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
23
29
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G23G30.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
23
30
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G23G31.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
23
31
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G23G32.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
23
32
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G23G33.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
23
33
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G23G34.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
23
34
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G23G35.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
23
35
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G23G36.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
23
36
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G24G24.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
24
24
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G24G25.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
24
25
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G24G26.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
24
26
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G24G27.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
24
27
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G24G28.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
24
28
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G24G29.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
24
29
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G24G30.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
24
30
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G24G31.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
24
31
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G24G32.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
24
32
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G24G33.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
24
33
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G24G34.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
24
34
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G24G35.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
24
35
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G24G36.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
24
36
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G25G25.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
25
25
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G25G26.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
25
26
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G25G27.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
25
27
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G25G28.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
25
28
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G25G29.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
25
29
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G25G30.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
25
30
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G25G31.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
25
31
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G25G32.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
25
32
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G25G33.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
25
33
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G25G34.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
25
34
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G25G35.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
25
35
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G25G36.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
25
36
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G26G26.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
26
26
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G26G27.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
26
27
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G26G28.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
26
28
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G26G29.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
26
29
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G26G30.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
26
30
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G26G31.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
26
31
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G26G32.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
26
32
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G26G33.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
26
33
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G26G34.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
26
34
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G26G35.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
26
35
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G26G36.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
26
36
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G27G27.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
27
27
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G27G28.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
27
28
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G27G29.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
27
29
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G27G30.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
27
30
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G27G31.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
27
31
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G27G32.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
27
32
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G27G33.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
27
33
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G27G34.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
27
34
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G27G35.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
27
35
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G27G36.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
27
36
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G28G28.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
28
28
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G28G29.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
28
29
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G28G30.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
28
30
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G28G31.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
28
31
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G28G32.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
28
32
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G28G33.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
28
33
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G28G34.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
28
34
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G28G35.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
28
35
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G28G36.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
28
36
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G29G29.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
29
29
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G29G30.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
29
30
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G29G31.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
29
31
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G29G32.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
29
32
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G29G33.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
29
33
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G29G34.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
29
34
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G29G35.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
29
35
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G29G36.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
29
36
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G30G30.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
30
30
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G30G31.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
30
31
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G30G32.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
30
32
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G30G33.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
30
33
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G30G34.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
30
34
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G30G35.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
30
35
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G30G36.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
30
36
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G31G31.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
31
31
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G31G32.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
31
32
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G31G33.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
31
33
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G31G34.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
31
34
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G31G35.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
31
35
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G31G36.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
31
36
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G32G32.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
32
32
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G32G33.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
32
33
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G32G34.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
32
34
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G32G35.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
32
35
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G32G36.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
32
36
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G33G33.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
33
33
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G33G34.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
33
34
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G33G35.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
33
35
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G33G36.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
33
36
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G34G34.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
34
34
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G34G35.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
34
35
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G34G36.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
34
36
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G35G35.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
35
35
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G35G36.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
35
36
+

g_hbond_d -f $TRJ -s $TPR -n $NDX -num G36G36.$i.xvg -b $BEGINTIME -e $ENDTIME <<+
36
36
+

	wait

done

exit 0
