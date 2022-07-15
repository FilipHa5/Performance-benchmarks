#include<stdlib.h>
#include<stdio.h>
#include<time.h>
#include<sys/time.h>

const int num_iter = 100000000;

static clock_t ct;
static struct timeval tp;
static struct timezone tzp;

double time_clock(){ 
    struct timeval tk;
    struct timezone tzp;
    double daytime;
    
    gettimeofday(&tk, &tzp);
    
    daytime=(tk.tv_usec)/1e6+tk.tv_sec;
    
    return(daytime);
}

void main(void){
    double wallclock_time;
    double a,b,c, sum;
    int i;

    clock_t start, stop;


     a = 1.000001;
     b = 1.000002;
     c = 1.000003;

     //warm up
    for(i=0;i<10*num_iter;i++){
        a = 1.00000001*a+0.000001;
    }
    a *= 0.000000001;

    //test
    start = clock();
    wallclock_time = time_clock();
    for(i=0;i<num_iter;i++){
        a = 1.00000001*a+0.000001; 
    }
    stop = clock();
    wallclock_time = time_clock() - wallclock_time;

    double nr_oper_local = 1 * 2.0 * num_iter;
    double time_elapsed = (stop-start)/CLOCKS_PER_SEC;
    sum = a+b+c;
    
    printf("\nResult of arithmetic operations: %lf\n", sum);
    printf("Time for executing %lf operations: %lf\n",nr_oper_local, wallclock_time);
    printf("Performance: %lf GFLOP/s\n\n",nr_oper_local*1.0e-9/wallclock_time);

    
}