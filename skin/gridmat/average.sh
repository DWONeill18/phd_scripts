#!/bin/bash

for i in {1..11}	
do
	awk '{ total += $1; count++ } END { print total/count }' output.frame$i.20x20.average_thickness.dat >> average_num.dat

	wait
done

	awk '{ total += $1; count++ } END { print total/count }' average_num.dat > average_all.dat

exit 0
