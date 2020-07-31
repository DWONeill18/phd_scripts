#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

int main()

{
  FILE *fp = fopen("data.dat", "r") ;
 int c;
 int  newline_count = 0;

 /* count the newline characters */
 while ((c=fgetc(fp)) != EOF)
   {if (c == '\n')
       newline_count++;
   }
 printf("%i newline characters\n", newline_count);
 return 0;
}
