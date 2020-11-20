#include <stdio.h>
#include <time.h>
#include <stdlib.h>

void sum(float *, float *, int);

int main() {
    int len = 4;
    float *a = malloc(sizeof(float) * len);
    float *b = malloc(sizeof(float) * len);
    for (int i = 0; i < len; i++) {
        a[i] = i + (i/10);
        b[i] = i - (i/10);
    }
    len++;

    clock_t begin, end;
    begin = clock();
    sum(a, b, len);
    end = clock();
    float tiempoEjecucion = (float) (end - begin) / CLOCKS_PER_SEC;

    for (int i = 0; i < len-1; i++) {
        printf("%f ", a[i]);
    }
    puts("");
    printf("instrucciones escalares: %f segundos.\n", tiempoEjecucion);
    return 0;
}