#include <stdlib.h>
#include <stdio.h>
#include <time.h>

#include<sys/time.h>

#define PAGE_SIZE 512
#define MULT 1

void main(){
  long int i,j,k,n, l;
  long int array_size = PAGE_SIZE*MULT;
  clock_t start, stop;

  for (k = 0; k<100; k++){
    double* array = malloc(array_size*sizeof(double));
    for (l=0; l<array_size; l++){
        array[l]++;
        }
    start = clock();
        for (j=0; j<100; j++){
            for (i= 0; i<array_size; i++){
                array[i]++;
            }
        }
    stop = clock();
    free(array);

    double calc_time = (double)(stop-start)/CLOCKS_PER_SEC;
    double t_unit = calc_time*10e9/array_size;

    printf("Size %i, Time: %lf s, ", array_size, calc_time);
    printf("Time per unit: %lf ns\n", t_unit);
    if (calc_time < 0.4) array_size*=2;
    else array_size+=2;
}
}

