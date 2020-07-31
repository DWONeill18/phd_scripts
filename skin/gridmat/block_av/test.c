/* ----- HEADERS ---- */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

/* ----- MAIN FUNCTION ----- */

int main ()
{
	/* define variables */
	int  newline_count = 0;
	const int size_array = newline_count;
	int n, b, j, c, num;
	float data[size_array], sum=0.0, average, variance, vb, s, mag, bsum1=0, bsum2=0, bsum3=0, average1=0, average2=0, average3=0, intmag;
	float super_av;

	FILE *file = fopen("block_average.dat", "w");
	FILE *fp = fopen("data.dat", "r");


	/* count the newline characters */
	while ((c=fgetc(fp)) != EOF)
	{
		if (c == '\n')
		newline_count++;
	}

	printf("%i newline characters\n", newline_count);

	/* define array based on length of file */
	int* integers;

	integers = (int*) malloc (newline_count); 

	/*
	while ((read = getline(&line, &len, fp)) != -1) {
		printf("Retrieved line of length %zu :\n", read);
		printf("%s", line);
	}
	*/

	int i;
	int start=0;
	
	rewind(fp);

	for (i = 0; i < newline_count; ++i)
	{
		fscanf(fp, "%d", &num);	/* read an integer from the file */
		integers[i] = num;		/* store the interger in the array */
		printf("print of integer %d\n", integers[i]);
	
	}
	 
		/*storing numbers into an array*/

       
	for (b=1; b<newline_count+1; b++)
	{
	mag = newline_count * 1.00 / b;
	 intmag = ceil(mag);
	 printf("%f %f\n", mag, intmag);
		
	 super_av = 0;
		if (mag == intmag)
		{
		  bsum1=0;
		  for (start=0; start<newline_count; start+=mag)
				{
					bsum1 = 0;
					for (i=start; i<mag+start; i++)
						bsum1 += integers[i];
					average1 = bsum1/mag; 
					super_av += average1;
				}
		  	  super_av /= b * 1.00;
			fprintf (file, "%d %f\n", b, super_av);	
		}
	}
	
	fclose(file);
	return 0;
}

