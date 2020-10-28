    .text
    .global main
main:
    movq $0, %rcx
    movq $65, %rbx

while:
    decq %rbx
    jz retorno

    rorq $1, %rax
    adcq $0, %rcx
    jmp while

retorno:
    movq %rcx, %rax
    # El retorno es cuantos bits en 1 tiene el entero de 64 bits
    # que estaba almacenado en el registro rax.
    # Comentando esta línea ese valor quedaría en rcx y no perdemos el
    # entero que había en rax.
    ret
