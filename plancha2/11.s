    .data
formato: .asciz "%p\n"
arg5: .asciz "5"
arg3: .asciz "3"
arg1: .asciz "1"

    .text 
    .global main
main:
    push $8
    push $7
    movq $6, %rdi
    movq arg5, %rsi
    movq $4, %rdx
    movq arg3, %rcx
    movq $2, %r8
    movq arg1, %r9

f:
    movq $formato, %rdi
    movq %rsp, %rsi
    xorq %rax, %rax
    call printf

    movq $formato, %rdi  # El primer argumento es el formato. 
    movq $1234, %rsi  # El valor a imprimir.
    xorq %rax, %rax  # Cantidad de valores de punto flotante. 
    call printf




    ret
