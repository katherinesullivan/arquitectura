    .data
a: .float 0.1, 1.20, 0.90, 3.70
b: .float 4.56, 5.10, 6.10, 7.30
len: .long 4
    
    .text
    .global main
main:
    movq $a, %rdi
    movq $b, %rsi
    movq len, %rdx
    incq %rdx
    xorq %rcx, %rcx
    call sum
    ret

    .global sum
sum:
    # en rdi tenemos a cadena de flotantes
    # en rsi tenemos a b cadena de flotantes
    # en rdx tenemos a su longitud len
    decq %rdx
    jz retorno
    
    movss (%rdi, %rcx, 4), %xmm0 
    movss (%rsi, %rcx, 4), %xmm1
    addss %xmm0, %xmm1
    # guarda el resultado en "a"
    movss %xmm1, (%rdi, %rcx, 4)
    incq %rcx
    jmp sum

retorno:
    ret
