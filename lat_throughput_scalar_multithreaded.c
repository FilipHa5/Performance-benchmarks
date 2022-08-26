#include <stdio.h>
#include <omp.h>
#include <sys/time.h>

const int num_iter = 100000000;

double time_clock(){ 
    struct timeval tk;
    struct timezone tzp;
    double daytime;

    gettimeofday(&tk, &tzp);

    daytime=(tk.tv_usec)/1e6+tk.tv_sec;

    return(daytime);
}

void main(void){
    //omp_set_num_threads( 2 );
    long i,j ;
    double a = 1.0000001, sum;
    double b, wallclock_time;

    #pragma omp parallel for
    for(i=0;i<10*num_iter;i++){
        a = 1.00000001*a+0.000001; 
    }
    a*=0.0000001;

    wallclock_time =time_clock(); 
    #pragma omp parallel for //default(none)
    for(i=0;i<num_iter;i++){
        a = 1.00000001*a+0.000001; 
    }
    wallclock_time = time_clock() - wallclock_time;
    sum = a;
    printf("%lf\n", wallclock_time);

    double nr_oper_local = 1 * 2.0 * num_iter;
    //double time_elapsed = (stop-start) / CLOCKS_PER_SEC;
    double latency = wallclock_time * 1.0e9 / nr_oper_local;
    sum = a+b;

    printf("\nResult of arithmetic operations: %lf\n", sum);
    printf("Time for executing %lf operations: %lf s\n",nr_oper_local, wallclock_time);
    printf("Latency: %lf ns\n", latency);
    printf("Performance: %lf GFLOP/s\n\n",nr_oper_local*1.0e-9/wallclock_time);
}