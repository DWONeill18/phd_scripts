/* Last modified 29/09/14 */
/* David O'Neill - adapted from gromacs */

#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
#define M_PI 3.14159265358979323846


main(int argc, char *argv[])
{
  FILE    *fout;
  double  r;

  double f, fprime;
  double g, gprime;
  double h, hprime;

  double C6;
  double C12;
  double alpha;
  double alpha_q;
  double alpha_qq;
  double cutoff = 0.9;

  double lower_limit = 0.1;

  double r_max = cutoff + 1.0;

  if(argc != 7) {
      
    printf("Usage: %s output.xvg C6 C12 alpha alpha_q alpha_qq\n", argv[0]);
      
    exit(1);
  }

  C6 = atof(argv[2]);
  C12 = atof(argv[3]);
  alpha = atof(argv[4]);
  alpha_q = atof(argv[5]);
  alpha_qq = atof(argv[6]);

//  double A = 4 * epsilon * pow(sigma,12);
//  double C = 4 * epsilon * pow(sigma,6);
//  double X = 4 * epsilon;
  
//  double rmin = pow(2,1.0/6.0) * sigma;

  printf("C6 = %lf, C12 = %lf, Alpha = %lf, Alpha_q = %lf, Alpha_qq = %lf\n" ,C6,C12,alpha,alpha_q,alpha_qq);

  printf("C6 = %+10.9E, C12 = %+10.9E\n",C6,C12);

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
      
		double	param_1 = r/alpha_q;
		double	param_2 = r/alpha_qq;
		double  p = 3.1415;	

	//	f = (erfc(param_1)/r) - (erfc(param_2)/r);
	//	fprime = ((erfc(r/alpha_qq))/pow(r,2))-((erfc(r/alpha_q))/pow(r,2))-((2*exp(-1*pow(r,2)/pow(alpha_q,2)))/(pow(M_PI,0.5)*alpha_q*r))+((2*exp(-1*pow(r,2)/pow(alpha_qq,2)))/(pow(M_PI,0.5)*alpha_qq*r));      


//		f = ((erf(r/alpha_qq))/r);
//		fprime = (2*exp(-1*pow(r,2)/pow(alpha_qq,2)))/(pow(M_PI,0.5)*alpha_qq*r) - ((erf(r/alpha_qq))/(pow(r,2)));


		f = 1/r;
		fprime = -1/pow(r,2);

	//	f = 0;
	//	fprime = 0;

	  g = C6 * (-1 / (pow(r,6)));
 	  gprime = C6 * (6/(pow(r,7)));

	  h = C12 * (1 / (pow(r,12)));
	  hprime = C12 * -(12/(pow(r,13)));

	//  g = 0;
	//  gprime = 0;
	//  h = 0;
	//  hprime = 0;

								       
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
