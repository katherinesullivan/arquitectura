    .data
a: .float 0, 1, 2, 3
b: .float 4, 5, 6, 7
len: .quad 4
i: .long 0 # creo que para los contadores habria que usar registros
j: .long 0
    
    .text
    .global main
main:
    movq $a, %rdi
    movq $b, %rsi
    movq len, %rdx
    incq %rdx
    call sum
    ret

    
    .global sum_simd
sum_simd:
    # notar que en este caso los argumentos
    # son punteros y vienen en rdi y rsi respectivamente
    cmpq $4, %rdx
    jle sum

    mull $16, j

    # copia 4 floats de "a" a xmm0
    movaps j(%rdi), %xmm0
    # copia 4 floats de "b" a xmm1
    movaps j(%rsi), %xmm1
    # suma los 4 floats a la vez
    addps %xmm0, %xmm1
    # guarda el resultado en "a"
    movaps %xmm1, j(%rdi)
    
    incq j
    subq $4, %rdx
    jz retorno
    jmp sum_simd


sum:
    decq %rdx
    jz retorno

    movss (%rdi, i, 4), %xmm0 # esta en el apunte3 (con funciones packed) pero o sea deberia funcar y no lo hace
    movss (%rsi, i, 4), %xmm1
    addss %xmm0, %xmm1

    movss %xmm1, (%rdi, i, 4)
    incl i
    jmp sum


retorno:
    ret
