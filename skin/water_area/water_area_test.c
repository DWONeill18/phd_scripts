/* David O'Neill                   
* Last updated 11th December 2013
*
* Compile using: gcc -lm gromacs_traj.c -o gromacs_traj
*
* This code reads a gromacs gro-format trajectory file.
*/

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

/* Code for calculating area of which water covers */

/* Define variables */

int gridx, gridy, gridz, gridcounter_x, gridcounter_y, tot_covered;
float width_x, width_y, width_z, Lx, Ly, Lz, min, max, percentage;
void removeSpace(char *str);
char argv[1], arg[1];

int main(int argc, char *arg[])
{
/* Define grid */

gridx = 10;
gridy = 10;
gridcounter_x = 0;
gridcounter_y = 0;
width_x = Lx/gridx;
width_y = Ly/gridy;

/* Declare variables */

const int MAX_LINE  = 120;
const int MAX_ATOMS = 100000;
int i,j,k,l,n;
int nFrames;
int nAtoms;
int atomIndex[MAX_ATOMS];
int residueNumber[MAX_ATOMS];
int gridcounter_x[nAtoms];
int gridcounter_y[nAtoms];
char testChar;
char line[MAX_LINE];
char keyword[8],junk[8];
char tpResidueName[8], tpAtomName[8];
char residueName[MAX_ATOMS][8], atomName[MAX_ATOMS][8];
double time;
double x[MAX_ATOMS],y[MAX_ATOMS],z[MAX_ATOMS];
double bxx,byy,bzz; /* box vectors - needed if using minimum image */
FILE *ipf; /* input file */

/* check for correct number of command line arguments */

if(argc !=2) {

printf("Usage: %s filename\n",argv[0]);
exit(1);
                                                                       }
/* open file for reading */
/* argv[1] is the name of the file */

printf("Opening file %s\n\n",argv[1]);
ipf = fopen(arg[1], "r");

/* check for error opening file */

  if(ipf == NULL) {

  printf("Error opening file\n");
  exit(1);
						  }

/* first, count the number of frames in the file */
/* to do this, read the entire file and count the occurances */
/* of the word "frame" */

printf("Counting number of frames.\n\n");

while(fgets(line, sizeof(line), ipf)!= NULL) 
{

/* get a line from the file */
/* fgets() returns NULL when it reaches an error or end of file */

/* check the first character of the line */
testChar = line [0];

	if (testChar == 'f') 
	{

/* we have found a new frame */

		nFrames ++;
	}                                                                             
}


/* print the number of frames */

printf("The file %s contains %d frames.\n\n", argv[1], nFrames);

/* now read the coordinates data frame by frame */

/* position the file pointer at the first character of the file */

	fseek(ipf, 0, SEEK_SET);

	for(i=0; i<nFrames; i++) 
	{

/* first line contains the time */

		fgets(line, sizeof(line), ipf);

/* convert the text to numbers */

		sscanf(line, "%s%s%lf", &keyword, &junk, &time);

/* print out what you read in */

		printf("Reading %s %s %6.2lf ps\n\n", keyword, junk, time);

/* next line contains the number of atoms */

		fgets(line, sizeof(line), ipf);
		sscanf(line, "%i", &nAtoms);
		printf("The number of atoms in frame %d is %d\n\n",(i+1),nAtoms);

/* check MAX_ATOMS has not been exceeded */

		if (nAtoms > MAX_ATOMS) 
		{
			printf("Number of atoms exceeds maximum. Try increasing MAX_ATOMS\n");
		}
	}
/* read in atom information */

for (j=0; j<nAtoms; j++)
{	fgets (line, sizeof (line), ipf);
	sscanf (line, "%5i%5c%5c%5i%8lf%8lf%8lf", &residueNumber[j], &residueName[j], &atomName[j], &atomIndex[j], &x[j], &y[j], &z[j]);
	removeSpace (residueName[j]);
	removeSpace (atomName[j]);
	printf("%5d%5s%5s%5d%8.31f%8.31f%8.31f\n", &residueNumber[j], &residueName[j], &atomName[j], &atomIndex[j], &x[j], &y[j], &z[j]);
}

/* read in box vectors */

fgets (line, sizeof (line), ipf);
sscanf (line, "%10lf%10lf%10lf", &Lx, &Ly, &Lz);	        
printf("The box dimensions are %6.3lf, %6.3lf, %6.3lf\n", Lx, Ly, Lz);

/* loop over water */

for (j=0; j<nAtoms; j++)
{
	if (strcmp (atomName[j], "OW") == 0)
		printf ("Water molecules found!");
		{if (z[j]>(Lz/2))
			{
				for (i=0; i<gridx; i++)
				{
					min = i*width_x;
    				max = (i+1)*width_x;
					if (x[j]>=min && x[j]<max)
					{	
						printf ("Located water in x direction in grid %i\n", i);
						gridcounter_x[k] ++;
					}
					else
						printf ("Water not found in this sector");
				}
				for (i=0; i<gridy; i++)
				{
					min = i*width_y;
					max = (i+1)*width_y;
					if (y[j]>=min && y[j]<max)
					{	
						printf ("Located water in y direction in grid %i\n", i);
						gridcounter_y[l] ++;
					}
					else 
						printf ("Water not found in this sector");
				}
			}
 		 else if
		 		(printf("No water found!"));
		}
}

		tot_covered = gridcounter_y[l];
		percentage = 100*tot_covered/(gridx*gridy);
		printf ("Percentage of grid covered is %f\n", percentage);
		
return 0;
}

void removeSpace(char *str)
{
			/* this function removes whitespace from a string */
			/* I just copied it from a random web page - it seems to do the trick */
			/* but beware that I haven't checked it properly yet! */

		char *p1 = str;
		char *p2 = str;
			
			do
				while (*p2 == ' ') 
				{
                	p2++;
                 }
			while (*p1++ = *p2++);
}
