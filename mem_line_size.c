#include <stdlib.h>

#include <stdio.h>

#include <time.h>

#include <sys/time.h>

#define WORKING_SET_SIZE 4096*100//33554432
#define STRIDE_MAX 15

static struct timeval tp;
static struct timezone tzp;

double time_clock() {

  struct timeval tk;
  struct timezone tzp;
  double daytime;

  gettimeofday( & tk, & tzp);

  daytime = (tk.tv_usec) / 1e6 + tk.tv_sec;

  return (daytime);
}

void main() {
  long int i, j, k, n, l, m, array_size_iter;
  long int array_size = WORKING_SET_SIZE;
  clock_t start, stop;
  int stride = 1;
  double wallclock_time;

for (stride; stride<=STRIDE_MAX; stride++){
    double * array = malloc(array_size * sizeof(double));
    for (i = 0; i < array_size; i++) {
      array[i]++;
    }
    start = clock();
    wallclock_time = time_clock();
    for (j = 0; j < 10000; j++) {
      for (i = 0; i < array_size; i += stride) {
        array[i]++;
      }
    }
    stop = clock();
    wallclock_time = time_clock() - wallclock_time;
    free(array);

    double calc_time = wallclock_time; //*/(double)(stop-start)/CLOCKS_PER_SEC;
    double time = calc_time * 1.0e9 / (array_size/stride);
    double throughput = sizeof(double) / (time / 100);

    if (stride == 1){
      printf("\n\n== WORKING SET SIZE %lf B ==\n\n", (double)(array_size) * sizeof(double));
    }
    printf("Stride %i, Time (strided): %lf ns, " , stride, time);
    printf("Throughput: %lf B/s, \n", throughput);
}
}
