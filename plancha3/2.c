#include <stdio.h> 
#include <math.h>

// Macros definidas en el ej 1
#define EXP(x) ((*(int *) (&x) >> 23) & 0xff)
#define FRAC(x) (*(int *) (&x) & 0x7fffff)


int myisnan(float f) {
    return ((EXP(f) == 0xff) && (FRAC(f) != 0));
}

int myisnan2(float f) {
    return !(f == f); // Si f es NaN la comparación de igualdad va a dar falso porque comparar con NaN siempre da falso.
}

int main(void) {
    float g = 0.0;
    float f = 0.0 / g;
    float e = 1.0 / g;
    printf("f: %f\n", f);

    // NaN
    if (f == NAN) printf("Es NAN.\n"); // Comparar con NAN siempre da falso.
    if (isnan(f)) printf("isnan dice que si.\n");
    if (myisnan(f)) printf("myisnan dice que si.\n");
    if (myisnan2(f)) printf("myisnan2 dice que si.\n");
    
    // INF
    if (e == INFINITY) printf("Es INFINITY.\n"); // Comparar con INFINITY funciona.
    printf("%f\n", 2.0 + e); // Sumarle valores a +infinito es válido y devuelve +infinito.
    return 0; 
}