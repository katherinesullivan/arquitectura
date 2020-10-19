/*
Codigo en ASM:
.global main
main:
    movb $0xFE, %al 
    movb $-1, %bl 
    addb %bl, %al 
    incb %bl
    ret
*/
// Devuelve 253 como código de salida.

char main(){
    char a, b;
    a = 254;
    b = -1;
    a = a + b;
    b++;
    return a;
}