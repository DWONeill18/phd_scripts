/* David O'Neill - adapted from gromacs */

#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>

main(int argc, char *argv[])
{
  FILE    *fout;
  double  r;

  double f, fprime;
  double g, gprime;
  double h, hprime;

  double epsilon;
  double sigma;

  double cutoff = 0.9;

  double lower_limit = 0.1;

  double r_max = cutoff + 1.0;

  if(argc != 4) {
      
    printf("Usage: %s output.xvg sigma_(nm) epsilon_(kJ/mol)\n", argv[0]);
      
    exit(1);
  }

  sigma = atof(argv[2]);
  epsilon = atof(argv[3]);

  double A = 4 * epsilon * pow(sigma,12);
  double C = 4 * epsilon * pow(sigma,6);

  double rmin = pow(2,1.0/6.0) * sigma;

  printf("Sigma = %lf, Epsilon = %lf, Rmin = %lf\n",sigma,epsilon,rmin);

  printf("A(C12) = %+10.9E, C(C6) = %+10.9E\n",A,C);

  fout = fopen(argv[1], "w");

  /* check for error opening file */
    
  if(fout == NULL) {
      
    printf("Error opening file %s for writing\n", argv[1]);
      
    exit(1);
  }
    
  fprintf(fout, "#\n# Example LJ 6-12 Potential\n#\n");

  for (r=0; r<=r_max; r+=0.0005) {
    
    if (r < lower_limit) {

      f = 0;
      fprime = 0;

      g = 0;
      gprime = 0;

      h = 0;
      hprime = 0;

      fprintf(fout, "%12.10e   %12.10e %12.10e   %12.10e %12.10e   %12.10e %12.10e\n",
	      r,f,fprime,g,gprime,h,hprime);
    } 
    else {
      
      f = 1/r;
      fprime = (-1/(pow(r,2)));
      
      // -1 * C
      g = C * (-1 / (pow(r,6)));
      gprime = (6 * C)/(pow(r,7));
      
      h = A/(pow(r,12));
      hprime = (-12 * A)/(pow(r,13));

      double minus_fprime = -1 * fprime;
      double minus_gprime = -1 * gprime;
      double minus_hprime = -1 * hprime;
      
      fprintf(fout, "%12.10e   %12.10e %12.10e   %12.10e %12.10e   %12.10e %12.10e\n",
	      r,f,minus_fprime,g,minus_gprime,h,minus_hprime);
    }

  }

  fclose(fout);
  return(0);
}
