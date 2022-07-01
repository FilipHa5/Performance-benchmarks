#include<time.h>

void latency(nr_oper){

    clock_t start, stop;
    double a = 1.000001;
    float time = 0;

    //warm up - to increase CPU freq
    for(int i=0; i<10*nr_oper, i++){
        a = 1.00000001*a+0.000001;
    }
    a = 1.000001;

    //test
    start = clock();
    for(int i=0; i<nr_oper, i++){
        a = 1.00000001*a+0.000001;
    }
    start = clock();

    float nr_oper_cor = 2*nr_oper;
    double time = (double)(stop-start)/CLOCKS_PER_SEC;
    printf("SUCCESS - LATENCY TEST FINISHED!\n");
    printf("Time of execution %i floating point operations: %lf\n", nr_oper_cor, time);
    printf("Latency - time per operation: %lf", time/nr_oper_cor);
    printf("Performance: %f GFLOP/s\n", nr_oper_cor*10e-9/time);
}