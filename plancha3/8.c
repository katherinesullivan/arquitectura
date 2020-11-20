#include <stdio.h>
#include <time.h>

void sum_simd(float *, float *, int);

int main() {
    int len = 4;
    float *a = malloc(sizeof(float) * len);
    float *b = malloc(sizeof(float) * len);
    for (int i = 0; i < len; i++) {
        a[i] = i + (i/10);
        b[i] = i - (i/10);
    }

    clock_t begin, end;
    begin = clock();
    sum_simd(a, b, len);
    end = clock();
    float tiempoEjecucion = (float) (end - begin) / CLOCKS_PER_SEC;

    for (int i = 0; i < len; i++) {
        printf("%f ", a[i]);
    }
    puts("");
    printf("La función tardo %f segundos.", tiempoEjecucion);
    return 0;
}