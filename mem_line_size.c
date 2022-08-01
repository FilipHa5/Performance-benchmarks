#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <sys/time.h>
#include <sys/times.h>
#include <math.h>

#define WORKING_SET_SIZE 409600 //33554432
#define STRIDE_MAX 15

static struct timeval tp;
static struct timezone tzp;

double time_clock()
{
	struct timeval tk;
	struct timezone tzp;
	double daytime;

	gettimeofday(&tk, &tzp);

	daytime = (tk.tv_usec) / 1e6 + tk.tv_sec;

	return (daytime);
}

void main()
{
	long int i, j;
	long int array_size = WORKING_SET_SIZE;
	clock_t start, stop;
	int stride = 1;
	double wallclock_time;

	for (stride; stride <= STRIDE_MAX; stride++)
	{
		double *array = malloc(array_size* sizeof(double));
    //warmup
		for (i = 0; i < array_size; i+=8)
		{
			array[i]++;
		}

		start = clock();
		wallclock_time = time_clock();
		for (i = 0; i < 1000; i++)
		{
			for (j = 0; j < array_size; j += stride)
			{
				array[j]++;
			}
		}

		stop = clock();
		wallclock_time = time_clock() - wallclock_time;
		free(array);

		//double calc_time = (double)(stop-start)/CLOCKS_PER_SEC;
		//double throughput = (array_size * sizeof(double) * 1000)*9.31*1e-10/ wallclock_time;
    long int nr_accesses =  1000 * (WORKING_SET_SIZE/stride);

		if (stride == 1)
		{
			printf("\n\n== WORKING SET SIZE %i B ==\n\n", (int)array_size *sizeof(double));
		}

		printf("Stride %i, Time per accesses: %lf ns \n", stride, wallclock_time*1.0e9 / nr_accesses);
		//printf("Throughput: %lf GB/s, \n", throughput);
	}
}