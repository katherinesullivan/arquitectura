    .data
buffer: .jmp_buffer 0, 0, 0, 0, 0, 0, 0, 0
valor: .long 10
formato: .asciz "%ld\n"
first: .quad 0x1
second: .quad 0x2


    .text
setjmp2:
    movq %rbx, buffer
    movq %rbp, 8(buffer)
    movq %rsp, 16(buffer)
    movq %r12, 24(buffer)
    movq %r13, 32(buffer)
    movq %r14, 40(buffer)
    movq %r15, 48(buffer)
    movq (%rsp), 56(buffer)
    

    movq 8(%rbp), %rcx  # rcx es el buffer
    movq %rdx, %rax


longjmp2:
    movq valor, %rdx
    jmp *%rcx

primero:
    jmp segundo
    # Estas instrucciones nunca se llegan a ejecutar
    movq $formato, %rdi
    movq primero, %rsi
    xorq %rax, %rax
    call printf
    
segundo:
    movq $formato, %rdi
    movq segundo, %rsi
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
    cmpq $0, %rax
    jz primero
    

    # Epilogo
    movq %rbp, %rsp
    popq %rbp
    ret    
