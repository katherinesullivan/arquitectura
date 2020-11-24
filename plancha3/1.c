#include <stdio.h>
//#include <ieee754.h>


#define EXP(x) ((*(int *) (&x) >> 23) & 0xff)
#define FRAC(x) (*(int *) (&x) & 0x7fffff)

int main() {
    float f = 3.14;
    printf("%x\n", EXP(f));
    printf("%b\n", 8388607);
    return 0;
}