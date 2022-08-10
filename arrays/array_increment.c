#include <stdio.h>
#include <math.h>
#include <time.h>
#include <stdlib.h>
#include <sys/time.h>
#include <sys/times.h>


const int cache_size = 4; // MB

double time_clock()
{
	struct timeval tk;
	struct timezone tzp;
	double daytime;

	gettimeofday(&tk, &tzp);

	daytime = (tk.tv_usec) / 1e6 + tk.tv_sec;

	return (daytime);
}

int calc_qty_elements (const int cs){
    int qty_of_elements;
    int cache_size = cs;
    int bytes = cache_size*1024*1024;
    
    qty_of_elements = bytes/sizeof(double);

    return qty_of_elements;
}

void main (void){
    int i, j, repeat;
    double wallclock_time;
    double perf;
    double sum;
    int dim_length = sqrt(calc_qty_elements(cache_size));
    double array [dim_length][dim_length];

    for (i=0; i<dim_length; i++){
        for (j=0; j<dim_length; j++){
            array[i][j] = 0 + ((double)(1-0)*rand()/(RAND_MAX));
        }
    }
    // ------------- ACCESS BY COLUMNS ------------------------
    wallclock_time = time_clock();
    for(repeat=0; repeat<100; repeat++){
        for (i=0; i<dim_length; i++){
            for (j=0; j<dim_length; j++){
                array[i][j]++;
            }
        }
    }
    wallclock_time = time_clock() - wallclock_time;

    for (i=0; i<dim_length; i+=10){
        for (j=0; j<dim_length; j+=10){
            sum += array[i][j];
        }
    }
    int nr_oper = 100*dim_length*dim_length;
    perf = nr_oper/1.0e9/wallclock_time;

    printf("\n == ACCESS BY COLUMNS == \n");
    printf("\nExecuted: %d increment operations", nr_oper);
    //printf("Sum: %lf", sum);
    printf("\nWallclock time: %lf s\n", wallclock_time);
    printf("Performance: %lf GFLOP/s\n\n", perf);

    // ------------- ACCESS BY ROWS ------------------------
    wallclock_time = time_clock();
    for(repeat=0; repeat<100; repeat++){
        for (j=0; j<dim_length; j++){
            for (i=0; i<dim_length; i++){
                array[i][j]++;
            }
        }
    }
    wallclock_time = time_clock() - wallclock_time;

    for (i=0; i<dim_length; i+=10){
        for (j=0; j<dim_length; j+=10){
            sum += array[i][j];
        }
    }
    nr_oper = 100*dim_length*dim_length;
    perf = nr_oper/1.0e9/wallclock_time;

    printf(" == ACCESS BY ROWS == \n");
    printf("\nExecuted: %d increment operations", nr_oper);
    //printf("Sum: %lf", sum);
    printf("\nWallclock time: %lf s\n", wallclock_time);
    printf("Performance: %lf GFLOP/s\n\n", perf);

}