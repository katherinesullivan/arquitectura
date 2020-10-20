    .data
format: .asciz "%ld\n"
format2: .asciz "%lx\n"
i: .quad 0xDEADBEEF

    .text 
    .global main
main:
    movq $format, %rdi  # El primer argumento es el formato. 
    movq $1234, %rsi  # El valor a imprimir.
    xorq %rax, %rax  # Cantidad de valores de punto flotante. 
    call printf

    # apartado a
    movq %rsp, %rsi
    xorq %rax, %rax
    call printf

    # apartado b
    movq ($format), %rsi
    xorq %rax, %rax
    call printf

    # apartado c
    movq $format2, %rdi
    movq ($format), %rsi
    xorq %rax, %rax
    call printf

    # apartado d
    movq $format, %rdi
    movq %rsp, %rsi
    xorq %rax, %rax
    call printf

    # apartado e
    movq (%rsp), %rbx
    addq $8, %rbx
    movq %rbx, %rsi
    xorq %rax, %rax
    call printf

    # apartado f
    movq $i, %rsi
    xorq %rax, %rax
    call printf

    # apartado g
    movq ($i), %rsi
    xorq %rax, %rax
    call printf


    ret
