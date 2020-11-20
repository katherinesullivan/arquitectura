#include <stdio.h>

void sum_simd(float *, float *, int);

int main() {
    int len = 4;
    float *a = malloc(sizeof(float) * len);
    float *b = malloc(sizeof(float) * len);
    for (int i = 0; i < len; i++) {
        a[i] = i + (i/10);
        b[i] = i - (i/10);
    }

    sum_simd(a, b, len);

    for (int i = 0; i < len; i++) {
        printf("%f ", a[i]);
    }
    puts("");
    return 0;
}