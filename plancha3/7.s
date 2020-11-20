    .text
    .global main
main:
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
    movss (%rdi), %xmm0 # esta en el apunte3 (con funciones packed) pero o sea deberia funcar y no lo hace
    movss (%rsi), %xmm1
    addss %xmm0, %xmm1
    # guarda el resultado en "a"
    movss %xmm1, (%rdi)
    jmp sum

retorno:
    ret
