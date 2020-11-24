#include <stdio.h>
// #include <ieee754.h>


#define EXP(x) ((*(int *) (&x) >> 23) & 0xff)
#define FRAC(x) (*(int *) (&x) & 0x7fffff)
#define SGN(x) ((*(int *) (&x) >> 31) & 0x1)


int main() {
    float f = -3.14;
    printf("%x\n", SGN(f));
    printf("%x\n", EXP(f));
    printf("%x\n", FRAC(f));
    return 0;
}