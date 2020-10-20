    .data
format: .asciz "%ld\n"
format2: .asciz "%lx\n"
i: .quad 0xDEADBEEF

    .text 
    .global main
# FALTA VER QUE B Y C ESTEN BIEN (COINCIDEN // SI) Y COMO HACER LO DE +8 EN E
main:
    movq $format, %rdi  # El primer argumento es el formato. 
    movq $1234, %rsi  # El valor a imprimir.
    xorq %rax, %rax  # Cantidad de valores de punto flotante. 
    call printf

    # apartado a
    movq $format, %rdi
    movq %rsp, %rsi
    xorq %rax, %rax
    call printf

    # apartado b
    movq $format, %rdi
    movq $format, %rsi
    xorq %rax, %rax
    call printf

    # apartado c
    movq $format2, %rdi
    movq $format, %rsi
    xorq %rax, %rax
    call printf

    # apartado d
    movq $format, %rdi
    movq %rsp, %rsi
    xorq %rax, %rax
    call printf

    # apartado e
    movq $format, %rdi
    movq 8( ,%rsp,1), %rsi
    xorq %rax, %rax
    call printf

    # apartado f
    movq $format, %rdi
    movq i, %rsi
    xorq %rax, %rax
    call printf

    # apartado g
    movq $format, %rdi
    movq $i, %rsi
    xorq %rax, %rax
    call printf


    ret
