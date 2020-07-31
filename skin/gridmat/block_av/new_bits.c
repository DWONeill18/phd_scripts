	x = average1 - average;
				av_sum += pow(x,2);
				var2 = 1/b * av_sum; 
				fprintf (file2, "%f %f\n", average1, var2);
