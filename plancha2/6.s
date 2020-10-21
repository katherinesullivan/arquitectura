    .data
formato: .asciz "%ld\n"
format2: .asciz "%lx\n"
i: .quad 0xDEADBEEF

    .text 
    .global main
# FALTA VER QUE B Y C ESTEN BIEN (COINCIDEN // SI) Y COMO HACER LO DE +8 EN E
main:
    movq $formato, %rdi  # El primer argumento es el formato. 
    movq $1234, %rsi  # El valor a imprimir.
    xorq %rax, %rax  # Cantidad de valores de punto flotante. 
    call printf

    # apartado a
    movq $formato, %rdi
    movq %rsp, %rsi
    xorq %rax, %rax
    call printf

    # apartado b
    movq $formato, %rdi
    movq $formato, %rsi
    xorq %rax, %rax
    call printf

    # apartado c
    movq $format2, %rdi
    movq $formato, %rsi
    xorq %rax, %rax
    call printf

    # apartado d
    movq $formato, %rdi
    movq (%rsp), %rsi
    xorq %rax, %rax
    call printf

    # apartado e
    movq $formato, %rdi
    movq 8(%rsp), %rsi
    xorq %rax, %rax
    call printf

    # apartado f
    movq $formato, %rdi
    movq i, %rsi
    xorq %rax, %rax
    call printf

    # apartado g
    movq $formato, %rdi
    movq $i, %rsi
    xorq %rax, %rax
    call printf


    ret
