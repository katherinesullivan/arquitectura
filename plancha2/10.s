    .data
buffer: .quad 0, 0, 0, 0, 0, 0, 0, 0
valor: .long 10
formato: .asciz "%ld\n"
first: .quad 0x1
second: .quad 0x2


    .text
setjmp2:
    movq %rbx, buffer
    movq %rbp, buffer+1
    movq %rsp, buffer+2
    movq %r12, buffer+3
    movq %r13, buffer+4
    movq %r14, buffer+5
    movq %r15, buffer+6
    movq (%rsp), buffer+7
    xor %rdx, %rdx
    movq %rdx, %rax

retornosjdelj:
    cmpq $0, %rdx
    jz rdxmas1
    movq %rdx, %rax
    jmp *56(buffer)

rdxmas1:
    incq %rdx
    jmp retornosjdelj

longjmp2:
    movq $1, %rdx
    jmp retornosjdelj

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
    call setjmp2
    cmpq $0, %rax
    jz primero
    ret












    # Prologo
    #pushq %rbp
    #movq  %rsp, %rbp
    
    
    #xorq %rdx, %rdx  # rdx es value
#setjmp:
#    push setjmp
#    call setjmp2
    
 #   addq $8, (%rbp)
  #  cmpq $0, %rax
   # jz primero
    

    # Epilogo
    #movq %rbp, %rsp
    #popq %rbp
    #ret    
