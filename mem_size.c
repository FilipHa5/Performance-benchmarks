#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <sys/time.h>

#define PAGE_SIZE 4096

static struct timeval tp;
static struct timezone tzp;

double time_clock()
{


  struct timeval tk;
  struct timezone tzp;
  double daytime;

  gettimeofday(&tk, &tzp);

  daytime=(tk.tv_usec)/1e6+tk.tv_sec;

  return(daytime);
}

void main(){
  long int i,j,k,n, l;
  long int array_size = PAGE_SIZE;
  clock_t start, stop;
  double wallclock_time;

  for (k = 0; k<20; k++){
    double* array = malloc(array_size*sizeof(double));
    for (l=0; l<array_size; l++){
        array[l]++;
        }
    start = clock();
    wallclock_time = time_clock();
        for (j=0; j<100; j++){
            for (i= 0; i<array_size; i++){
                array[i]++;
            }
        }
    stop = clock();
    wallclock_time = time_clock() - wallclock_time;
    free(array);

    double calc_time = wallclock_time;//*/(double)(stop-start)/CLOCKS_PER_SEC;
    double time = calc_time*1.0e9/array_size;
    double throughput = sizeof(double)/(time/100);

    printf("Size %lf B, Time: %lf ns, ", (double)(array_size)*sizeof(double), time);
    printf("Throughput: %lf B/s\n", throughput);
    array_size*=2;
}
}

