#include <stdio.h>
#include "guindows.h"

task t1, t2, t3, taskmain;


void ft1(){
	double d;
    printf("direccion d: %p\n", &d);
	for(d = -1;; d += 0.001) {
		printf("d=%f\n", d);
		TRANSFER(t1,t2);
	}
}

void ft2(){
	int j;
    printf("direccion j: %p\n", &j);
	for(j = 0; j < 10000; j++) {
		printf("j=%d\n", j);
		TRANSFER(t2,t3);
	}
}

void ft3() {
    unsigned i;
    printf("direccion i: %p\n", &i);
	for (i = 0; i < 5000; i++) {
        printf("t3: i=%u\n", i);
        TRANSFER(t3, t1);
	}
    TRANSFER(t3, taskmain);
}


int main(){
	stack(t1,ft1);
	stack(t2,ft2);
	stack(t3,ft3);
	TRANSFER(taskmain,t1);
	return 0;
}


/*
Resultado de ejecución:

direccion d: 0x7ffee3992a48
direccion j: 0x7ffee3993a4c
direccion i: 0x7ffee3994a4c

Podemos ver que la diferencia entre las direcciones de las variables locales de las corrutinas es de 4096 bytes 
(diferencia pedida por la función hace_stack), con la salvedad de que la diferencia entre la dirección de d con 
la dirección de j es de 4100 bytes. Intuimos que esta diferencia tiene 4 bytes más que los 4096 realmente pedidos 
porque la variable d definida en ft1 es un double y ocupa 4 bytes más que el resto de las variables. 
*/