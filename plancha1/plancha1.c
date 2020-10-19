// ENTREGA SEMANA 4 ARQUITECTURA DEL COMPUTADOR
// INTEGRANTES: INES CIPULLO Y KATHERINE SULLIVAN

#include "stdio.h"
#include "assert.h"
#include "stdlib.h"
#include "string.h"

#define LENGTH 400


// EJERCICIO 1
/*
10000000 00000000 00000000 00000000 == 1 << 31
10000000 00000000 10000000 00000000 == (1 << 31) | (1 << 15) 
11111111 11111111 11111111 00000000 == -1 & ~0xFF
10101010 00000000 00000000 10101010 == 0xAA | (0xAA << 24) 
00000000 00000000 00000101 00000000 == 5 << 8
11111111 11111111 11111110 11111111 == -1 & ~(1 << 8)
11111111 11111111 11111111 11111111 == 0 - 1
00000000 00000000 00000000 00000000 == 0x80000000 + 0x80000000
*/


// EJERCICIO 2
int is_one(long n, int b) {
  return (n & (1 << b)) >> b;
}


// EJERCICIO 3
void printbin(unsigned long n) {
  int bit;
  for(int i = 63; i >= 0; i--) {
    bit = (n >> i) & 1;
    printf("%d", bit);
  }
  puts("");
}


// EJERCICIO 4
void rotar(int *a, int *b, int *c) {
  *a = *a ^ *c ^ *b;
  *c = *c ^ *b;
  *b = *b ^ *a ^ *c;
  *a = *a ^ *b;
  *c = *c ^ *a;
  *b = *b ^ *c;
}


// EJERCICIO 5
void codificar(int codigo) {
  char *entrada = malloc(sizeof(char) * (LENGTH+1));
  printf("Ingrese una palabra: ");
  scanf("%s", entrada);
  int length = strlen(entrada);
  char *codificacion = malloc(sizeof(char) * length+1);
  for(int i = 0; i < length; i++) {
    codificacion[i] = entrada[i] ^ codigo;
  }
  codificacion[length] = '\0';

  // En caso de ser necesaria la lectura de más de una palabra y/o más de
  // una línea dejamos comentado el código para la lectura de un
  // input más largo.

  // char *codificacion = malloc(sizeof(char) * LENGTH+1);
  // char c;
  // int i = 0;
  // while ( ( c=getchar() ) != EOF ) {
  //   codificacion[i] = c ^ codigo;
  //   i++;
  // }

  // Para marcar la finalización del input se debe hacer ctrl+d o ctrl+z
  // dependiendo de si estamos trabajando en Unix/Mas OS o Windows respectivamente.
  // Notar que si queremos leer más de una línea, debemos incrementar la constante global
  // LENGTH, por la cantidad de caracteres que tenga la entrada o un aproximado mayor a la cantidad real.

  // Imprime la palabra codificada.
  printf("%s", codificacion); 
  puts("");

  // Imprime el codigo ASCII en hexadecimal, lo cual permite la lectura 
  // en caso de encontrarnos con caracteres no imprimibles.
  for(int i=0; codificacion[i]!='\0'; i++){
    printf("%02hhX ", codificacion[i]);
  }
  puts("");

  free(codificacion);
}


/*
PREGUNTAS EJERCICIO 5

Para que el programa decodifique no habría que hacerle modificación
alguna al mismo, dada la propiedad conmuntativa del operador XOR.


Podríamos decir que no se gana nada codificando múltiples veces, puesto
que codificar una palabra primero con una clave c1 y luego con otra c2,
resulta en lo mismo que haber codificado la palabra con la clave c3=c1^c2.

Por lo tanto, para decodificarlo, solo se necesitaría encontrar c3. Lo mismo
que si se hubiese codificado la palabra una vez con una clave.

Sin embargo cabe hacer algunas salvedades a esto expuesto arriba. 

Si c1 y c2 son iguales, entonces, sería lo mismo que no haber codificado 
la palabra.

Si c1 y c2 son claves que se utilizan para codificar diferentes partes de la
palabra, en vez de aplicarlas una sobre el resultado de la otra, esto proveé
mayor encriptación.
*/


int main(int argc, char ** argv) {
  /* argv[0] es el nombre del ejecutable
  argv[1] es el codigo para usar en la funcion codificar */
  assert(argc == 2);

  long n = 0b00010100011100001010101000000111;
  int x = is_one(n, 33);
  int y = is_one(n, 9);
  printf("%d - %d\n", x, y);
  
  puts("");

  printbin(63);
  printbin(02721);
  printbin(678);

  puts("");

  int a = 89, b = 34, c = -2;
  printf("Antes de rotar:\na = %d\nb = %d\nc = %d\n", a, b, c);
  rotar(&a, &b, &c);
  printf("Despues de rotas:\na = %d\nb = %d\nc = %d\n", a, b, c);

  puts("");

  // Corre función codificar con el codigo pasado.
  int codigo = atoi(argv[1]);
  codificar(codigo);

  puts("");

  // Verifica ejercicio 1
  printf("%d\n", 0b10000000000000000000000000000000 == (1 << 31));
  printf("%d\n", 0b10000000000000001000000000000000 == ((1 << 31) | (1 << 15))); 
  printf("%d\n", 0b11111111111111111111111100000000 == (-1 & ~0xFF));
  printf("%d\n", 0b10101010000000000000000010101010 == (0xAA | (0xAA << 24)));
  printf("%d\n", 0b00000000000000000000010100000000 == (5 << 8));
  printf("%d\n", 0b11111111111111111111111011111111 == (-1 & ~(1 << 8)));
  printf("%d\n", 0b11111111111111111111111111111111 == (0 - 1));
  printf("%d\n", 0b00000000000000000000000000000000 == (0x80000000 + 0x80000000));

  return 0;
}