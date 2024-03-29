#    .data
#a: .float 0, 1, 2, 3
#b: .float 4, 5, 6, 7
#len: .quad 4
    
    .text
    #.global main
#main:
#    movq $a, %rdi
#    movq $b, %rsi
#    movq len, %rdx
#    incq %rdx
#    xorq %rcx, %rcx
#    call sum_simd
#    ret


    .global sum_simd
sum_simd:
    # notar que en este caso los argumentos
    # son punteros y vienen en rdi y rsi respectivamente
    cmpq $4, %rdx
    jge sum

    # copia 4 floats de "a" a xmm0
    movaps (%rdi), %xmm0
    # copia 4 floats de "b" a xmm1
    movaps (%rsi), %xmm1
    # suma los 4 floats a la vez
    addps %xmm0, %xmm1
    # guarda el resultado en "a"
    movaps %xmm1, (%rdi)
    
    addq $16, %rdi
    addq $16, %rsi
    #addq $16, %rcx
    subq $4, %rdx
    jmp sum_simd


sum:
    decq %rdx
    jz retorno

    movss (%rdi), %xmm0
    movss (%rsi), %xmm1
    addss %xmm0, %xmm1

    #incq %rcx
    movss %xmm1, (%rdi)
    addq $4, %rdi
    addq $4, %rsi
    jmp sum


retorno:
    ret
