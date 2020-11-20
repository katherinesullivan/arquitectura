    .data
a: .float 0, 1, 2, 3
b: .float 4, 5, 6, 7
len: .long 4
i: .long 0
    
    .text
    .global main
main:
    movq $a, %rdi
    movq $b, %rsi
    movq len, %rdx
    incq %rdx
    call sum
    ret

    .global sum
sum:
    # en rdi tenemos a cadena de flotantes
    # en rsi tenemos a b cadena de flotantes
    # en rdx tenemos a su longitud len
    decq %rdx
    jz retorno
    # algo corte direccionamiento relativo para ir accediendo
    # a todos los elementos del array porque creo que esto solo accederia al primero 

    movss (%rdi, i, 4), %xmm0 # esta en el apunte3 (con funciones packed) pero o sea deberia funcar y no lo hace
    movss (%rsi, i, 4), %xmm1
    addss %xmm0, %xmm1
    # guarda el resultado en "a"
    movss %xmm1, (%rdi, i, 4)
    incl i
    jmp sum

retorno:
    ret
