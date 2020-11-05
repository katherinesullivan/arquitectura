    .data
valor: .long 10
formato: .asciz "%ld\n"
first: .quad 0x1
second: .quad 0x2


    .text
setjmp2:
    movq 8(%rbp), %rcx  # rcx es el buffer
    movq %rdx, %rax


longjmp2:
    movq valor, %rdx
    jmp *%rcx

first:
    jmp second
    # Estas instrucciones nunca se llegan a ejecutar
    movq $formato, %rdi
    movq first, %rsi
    xorq %rax, %rax
    call printf
    
second:
    movq $formato, %rdi
    movq second, %rsi
    xorq %rax, %rax
    call printf   # Esto si se imprime
    jmp longjmp2



    .global main
main:
    # Prologo
    pushq %rbp
    movq  %rsp, %rbp
    
    xorq %rdx, %rdx  # rdx es value
setjmp:
    push setjmp
    call setjmp2
    addq $8, (%rbp)
    cmpq $0, $rax
    jz first
    
    # Epilogo
    movq %rbp, %rsp
    popq %rbp
    ret    
