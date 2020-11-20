    .text
    .global sum
sum:
    # en rdi tenemos a cadena de flotantes
    # en rsi tenemos a b cadena de flotantes
    # en rdx tenemos a su longitud len
    decq %rdx
    jz retorno
    
    movss (%rdi), %xmm0 
    movss (%rsi), %xmm1
    addss %xmm0, %xmm1
    # guarda el resultado en "a"
    movss %xmm1, (%rdi)
    addq $4, %rdi
    addq $4, %rsi
    jmp sum

retorno:
    ret
