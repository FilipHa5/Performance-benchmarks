#include <stdio.h>
//#include <stdlib.h>
//#include<time.h>
#include<sys/time.h>
//#include<sys/resource.h>


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

    int i;
    const int num_iter = 100000000;
    double a = 1.000001;
    //double b = 1.000001;
    //clock_t start, stop;

    //warm up - to increase CPU freq
    for(i=0; i<10*num_iter; i++){
        a = 1.00000001*a+0.000001;
    }

    //test
    double start = time_clock();
    //start = clock();

    for(i=0; i<num_iter; i++){
        a = 1.00000001*a+0.000001;
    }
    //stop = clock();
    double stop = time_clock();

    int nr_oper = 1*2*num_iter;
    double time = (stop-start);///CLOCKS_PER_SEC;
    float perf = nr_oper*1e-9/stop-start;
    
    printf("SUCCESS - LATENCY TEST FINISHED!\n");
    printf("Time of execution %i floating point operations: %lf\n", nr_oper, time);
    printf("Latency - time per operation: %f ns\n", (float)time*10e9/(float)nr_oper);
    printf("Performance: %f GFLOP/s\n", (float)(nr_oper*1e-9/time));
    }
