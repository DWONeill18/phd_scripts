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
	float data[size_array], sum=0.0, average, variance, vb, s, mag, bsum1=0, bsum2=0, bsum3=0, average1=0, average2=0, average3=0, average4=0, intmag;

	FILE *file = fopen("block_average.dat", "w");
	FILE *fp = fopen("data.dat", "r");
	FILE *file2 = fopen("info.dat", "w");
	FILE *file3 = fopen("variance.dat", "w");


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
	
	rewind(fp);

	for (i = 0; i < newline_count; ++i)
	{
		fscanf(fp, "%d", &num);	/* read an integer from the file */
		integers[i] = num;		/* store the interger in the array */
		printf("print of integer %d\n", integers[i]);
	
	}


	float x, k, av_sum=0, av_sum1=0, av_sum2=0, av_sum3=0, av_sum4=0, var2, all;

	for (i=0; i < newline_count; ++i)
	  all += integers[i];

	average = all/newline_count;
	printf("Average = %.2f\n", average);
	 
		/*storing numbers into an array*/

       
	for (b=1; b<newline_count+1; b++)
	{
	mag = newline_count * 1.00 / b;
	 intmag = ceil(mag);
	 printf("%f %f\n", mag, intmag);

		if (mag == intmag)
		
		{
			bsum1=0;
			k=mag;
			for (j=0; j<newline_count; j+=mag)	  
			{
			for (i=j; i<k; i++)
			bsum1 += integers[i];
		 	average1 = bsum1/mag;
			fprintf (file, "%d %f %f %f\n", b, mag, bsum1, average1);
			k+=mag;
			x = average1 - average;
			av_sum1 += pow(x,2);
			fprintf (file2, "%f %f\n", x, av_sum1);
			bsum1=0;
			}

		}

		var2 = 1/b * av_sum1;
		fprintf (file3, "%f\n", var2);
		
	}

	fclose(file);
	return 0;
}

