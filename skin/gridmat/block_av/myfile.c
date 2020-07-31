/* ----- HEADERS ---- */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

/* ----- MAIN FUNCTION ----- */

int main ()
{
	FILE *fp = fopen("data.dat", "r");

	int num;

	char c;
	int newline_counter;

	while((c=fgetc(fp)) != EOF)
	{
		if (c == '\n')
		{
			++newline_counter;
		}
	}
	
	int i;

	for (i = 0; i < newline_counter; ++i)
	{
		fscanf(fp, "%d", &num);
		printf("%d\n", num);
	}

	fclose(fp);

	return 0;
}

