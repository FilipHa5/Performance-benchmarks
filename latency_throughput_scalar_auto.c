#include<stdlib.h>
#include<stdio.h>
#include<time.h>
#include<sys/time.h>

const int num_iter = 100000000;
const int num_var = 1;

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
    double val = 1.000000;
    double add = 0.000001;
    int i, j;
    int start_size = 10;

    clock_t start, stop;

    double* array = malloc(start_size * sizeof(double));
    
    //fill the array
    for(i = 0; i<start_size; i++){
        array[i] = val + add;
        add += 0.000001;
    }
    add = 0.000001;

    //warm up
    for(i = 0; i<start_size; i++){
        array[i] = val * array[i] + add;
    }
    //reset
    for(i = 0; i<10000; i++){
        array[0] = 1.00000001*array[0]+0.000001;
    }
    array[0] *= 0.000000001;

    //test
    wallclock_time = time_clock();
    for(i = 0; i<num_iter; i++){
        for(j=0; j<num_var; j++){
            array[j] = val * array[j] + add;
        }
    }
    wallclock_time = time_clock() - wallclock_time;

    //sum
    for(i = 0; i<start_size; i++){
        sum += array[i];
    }

    double nr_oper_local = num_var * 2.0 * num_iter;
    double time_elapsed = (stop-start)/CLOCKS_PER_SEC;
    
    printf("\nResult of arithmetic operations: %lf\n", sum);
    printf("Time for executing %lf operations: %lf\n",nr_oper_local, wallclock_time);
    printf("Performance: %lf GFLOP/s\n\n",nr_oper_local*1.0e-9/wallclock_time);

    
}
