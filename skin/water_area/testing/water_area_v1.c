/* David O'Neill                   
 * Last updated 14th Dec 2013 
 *
 * Compile using: gcc -lm gromacs_traj.c -o gromacs_traj
 *
 * This code reads a gromacs gro-format trajectory file.
 * 
 * To generate the input file you need to process the
 * gromacs xtc file using g_traj
 *
 * e.g. g_traj -f traj.xtc -s topol.tpr -oxt traj.gro
 *
 * You can use the -ng flag or index files to write
 * trajectory files of subsets of atoms which might
 * make the large files easier to handle.
 *
 * The name of the input file is input to the 
 * programme as a command line argument.
 *
 * The code has been written as a sample code to calculate
 * the distance between two atoms. The minimum image
 * convention is applied to take into account periodic
 * boundary conditions.
 *
 * For simplicity, memory allocation is static. Be aware of
 * the MAX_ATOMS constant.
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

double dist(double ax, double ay, double az,
	    double bx, double by, double bz);
double magnitude(double ax, double ay, double az);
void minimumImage(double *a, double *b, double *c,
		  double bxx, double byy, double bzz);
void removeSpace(char *str);

int main(int argc, char *argv[])
{
 


 /* declare variables */

  const int MAX_LINE  = 120;
  const int MAX_ATOMS = 100000;
  const int gridx = 10;
  const int gridy = 10;
  int i,j,k,l,n;
  int atom1,atom2; /* variables used for the test calculation */
  int nFrames;
  int nAtoms;
  int atomIndex[MAX_ATOMS];
  int residueNumber[MAX_ATOMS];
  char testChar;
  char line[MAX_LINE];
  char keyword[8],junk[8];
  char tpResidueName[8], tpAtomName[8];
  char residueName[MAX_ATOMS][8], atomName[MAX_ATOMS][8];
  double time;
  double x[MAX_ATOMS],y[MAX_ATOMS],z[MAX_ATOMS];
  double distance;
  double averageDistance;
  double dx,dy,dz;
  double bxx,byy,bzz; /* box vectors - needed if using minimum image */
  int gridz, gridcounter_x[gridx], gridcounter_y[gridy], tot_covered;
  float width_x, width_y, width_z, Lx, Ly, Lz, min, max, percentage;

  FILE *ipf; /* input file */

  /* initialise variables */

  nFrames = 0;
  n = 0;
  averageDistance = 0;

  /* later on we calculate the distance between atoms 20 and 30 */
  /* don't forget that c arrays start at zero so we subtract 1 */
  
  atom1 = 20 - 1;
  atom2 = 30 - 1;

  /* check for correct number of command line arguments */

  if(argc !=2) {

    printf("Usage: %s filename\n",argv[0]);
    exit(1);
  }

  /* open file for reading */
  /* argv[1] is the name of the file */

  printf("Opening file %s\n\n",argv[1]);
  ipf = fopen(argv[1], "r");

  /* check for error opening file */

  if(ipf == NULL) {
    
    printf("Error opening file\n");
    exit(1);
  }
  
  /* first, count the number of frames in the file */
  /* to do this, read the entire file and count the occurances */
  /* of the word "frame" */

  printf("Counting number of frames.\n\n");

  while(fgets(line, sizeof(line), ipf)!= NULL) {

    /* get a line from the file */
    /* fgets() returns NULL when it reaches an error or end of file */ 

    /* check the first character of the line */

    testChar = line [0];

    if (testChar == 'f') {

      /* we have found a new frame */

      nFrames ++;
    }
  }

  /* print the number of frames */

  printf("The file %s contains %d frames.\n\n", argv[1], nFrames);

  /* now read the coordinates data frame by frame */

  /* position the file pointer at the first character of the file */

  fseek(ipf, 0, SEEK_SET);

  for(i=0; i<nFrames; i++) {
    
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

    if (nAtoms > MAX_ATOMS) {
      
      printf("Number of atoms exceeds maximum. Try increasing MAX_ATOMS\n");
    }

    /* read in atom information including coordinates */

    for(j=0; j<nAtoms; j++) {

      fgets(line, sizeof(line), ipf);

      /* note use of c not s as white-space is part of the formatting */

      sscanf(line, "%5i%5c%5c%5i%8lf%8lf%8lf",
	     &residueNumber[j], residueName[j], atomName[j], &atomIndex[j],
	     &x[j], &y[j], &z[j]);

      removeSpace(residueName[j]);
      removeSpace(atomName[j]);

      /* printf("%5d%5s%5s%5d%8.3lf%8.3lf%8.3lf\n", residueNumber[j], */
      /* residueName[j], atomName[j], atomIndex[j], x[j], y[j], z[j]); */
    }

    /* read in the box vectors */

    fgets(line, sizeof(line), ipf);

    sscanf(line, "%10lf%10lf%10lf", &bxx, &byy, &bzz);

    printf("The box dimensions are %6.3lf, %6.3lf, %6.3lf\n", bxx, byy, bzz);

/* Loop over water */

for (i=0; i<gridx; i++)
{
	gridcounter_x[i]=0;
}

for (i=0; i<gridy; i++)
{
	gridcounter_y[i]=0;
}

width_x = bxx/gridx;
width_y = byy/gridy;

for (j=0; j<nAtoms; j++)
{
	if (strcmp (atomName[j], "OW") == 0)
		{printf ("Water molecule found!\n");
			if (z[j]>Lz)
			{
				for (i=0; i<gridx; i++)
				{
					min = i*width_x;
    				max = (i+1)*width_x;
					if (x[j]>=min && x[j]<max)
					{	
						printf ("Located water in x direction in grid %i\n", i);
						gridcounter_x[i] ++;
					}
					else
						printf ("Water not found in this sector\n");
				}
				for (i=0; i<gridy; i++)
				{
					min = i*width_y;
					max = (i+1)*width_y;
					if (y[j]>=min && y[j]<max)
					{	
						printf ("Located water in y direction in grid %i\n", i);
						gridcounter_y[i] ++;
					}
					else 
						printf ("Water not found in this sector\n");
				}
			}
 		 
		}

/*	else {
		(printf("No water found!\n"));
} */
		}
}
		tot_covered = gridcounter_x[i];
		percentage = 100*tot_covered/(gridx*gridy);
		printf ("Percentage of grid covered is %f\n", percentage);
		
  
  
  
  /* close the input file */
  fclose(ipf);

  return(0);
}

void removeSpace(char *str)
{
  /* this function removes whitespace from a string */
  /* I just copied it from a random web page - it seems to do the trick */
  /* but beware that I haven't checked it properly yet! */

  char *p1 = str;
  char *p2 = str;
  
  do
    while (*p2 == ' ') {
      
      p2++;
    }
  while (*p1++ = *p2++);
}
