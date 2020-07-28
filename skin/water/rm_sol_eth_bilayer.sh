#!/bin/bash

# Becky Notman
# Last modified 24-11-11

# Script identifies solvent molecules within a 
# region of a lipid membrane
# and creates an index file that feeds into
# the gromacs editconf program
# final output is a modified gromacs file

# Arguments are:
#      name of input.gro file
#      name of output.gro file

ARGS=2
E_WRONGARGS=65

# Check for proper no. of command line args
if [ $# -ne "$ARGS" ]
then
echo "Usage: `basename $0` input.gro output.gro"
exit $E_WRONGARGS
fi

# First we need to count the number of lines
# in the input.gro file

NL=`wc -l < $1`

# Number of atoms
NA=`expr $NL - 3`

echo "Number of atoms in " $1 "is" $NA

# Now we run an awk script that processes the input.gro
# file. The number of lines is passed to the script.

gawk -v NL=$NL '

# Find water molecules that are within a cutoff
# distance d from the centre of the nanotube

BEGIN { printf("[save_molecules]\n") } # add header to index file
BEGIN { FIELDWIDTHS = "5 5 5 5 8 8 8 8 8 8" }
{
  # strip leading spaces
  gsub(" ", "", $2)
  gsub(" ", "", $3)

  # CHECK THIS VALUE!!!
  zstart=0.34
  zend=6.5

  num=0

  il1=0
  il2=1
  il3=NL-1

  if(i!=il1 && i!=il2 && i!=il3)
  {
 
    if (($2 == "SOL") && ($3 == "OW"))
      {

        # atom z coordinate

	   z=$7

        if (z < zstart || z > zend)
          {
            # flag to keep track of entire molecules
            # (we will always reach the oxygen atom 1st)
            water=1

            # donot remove - add molecule to index file
            printf("%-5d ",$4)
            num++;
            if(num % 15 == 0)
              {
                printf("\n");
              }
          }
        else
          {
            water=0
            echo "found bad water"
          }
      }
    else if(($2 == "SOL") && ($3 != "OW"))
      {
        if(water == 1)
          {
            # write the rest of the molecule
            printf("%-5d ",$4)
            num++;
            if(num % 15 == 0)
              {
                printf("\n");
              }
          }
      }
    else if (($2 == "ETH") && ($3 == "C1"))
      {
        # atom z coordinate

	   z=$7

        if (z < zstart || z > zend)
          {
            # flag to keep track of entire molecules
            # (we will always reach the c1 atom 1st)
            eth=1

            # donot remove - add molecule to index file
            printf("%-5d ",$4)
            num++;
            if(num % 15 == 0)
              {
                printf("\n");
              }
          }
        else
          {
            eth=0
          }
      }
    else if(($2 == "ETH") && ($3 != "C1"))
      {
        if(eth == 1)
          {
            # write the rest of the molecule
            printf("%-5d ",$4)
            num++;
            if(num % 15 == 0)
              {
                printf("\n");
              }
          }
      }
    else
      {
        if($2 != "SOL" && $2 != "ETH")
          {
            # keep all the other molecules
            printf("%-5d ",$4)
            num++;
            if(num % 15 == 0)
              {
                printf("\n");
              }
          }
      }
  }

  printf("\n");

  i++; # Count the lines in the file
}' $1 > save.ndx

# Use the index file as the input for editconf, where
# editconf makes a new .gro file containing only
# those atoms listed in the index file (save.ndx).

editconf_d -f $1 -n save.ndx -o $2
