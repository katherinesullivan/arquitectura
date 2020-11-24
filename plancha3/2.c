#include <stdio.h> 
#include <math.h>


int myisnan2(float f) {
    return (f == f); // Si f es NaN va a dar falso porque comparar con NaN siempre da falso.
}

int main(void) {
    float g = 0.0;
    float f = 0.0 / g;
    printf("f: %f\n", f);
    if (f == NAN) // ADVERTENCIA: ‘NAN’ es una extension de GCC. 
        printf("Es NAN\n");
    if (isnan(f))
        printf("isNaN dice que si\n");
    if (myisnan(f)) 
        printf("");
    return 0; 
}