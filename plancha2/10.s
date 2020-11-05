    .data
valor: .long 10
formato: .asciz "%ld\n"
first: .quad 0x1
second: .quad 0x2


    .text
setjmp2:
    popq %rcx  # rcx es el buffer
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
    xorq %rdx, %rdx  # rdx es value
setjmp:
    push setjmp
    call setjmp2
    cmpq $0, $rax
    jz first
    
    ret    
