    .data
buffer: .quad 0, 0, 0, 0, 0, 0, 0, 0
valor: .long 10
formato: .asciz "%ld\n"
firsto: .quad 0x1
secondo: .quad 0x2


    .text
setjmp2:
    movq %rbx, buffer
    movq %rbp, buffer+1
    movq %rsp, buffer+2
    movq %r12, buffer+3
    movq %r13, buffer+4
    movq %r14, buffer+5
    movq %r15, buffer+6
    movq (%rsp), %rdx
    movq %rdx, buffer+7
    xor %rdx, %rdx
    movq %rdx, %rax
    jmp continuacionmain


retornosjdelj:
    cmpq $0, %rdx
    jz rdxmas1
    movq %rdx, %rax
    jmp *buffer+7

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
    movq firsto, %rsi
    xorq %rax, %rax
    call printf
    
segundo:
    movq $formato, %rdi
    movq secondo, %rsi
    xorq %rax, %rax
    call printf   # Esto si se imprime
    movq $7, %rbx
    jmp longjmp2



    .global main
main:
    movq $8, %rbx
    jmp setjmp2
continuacionmain:
    cmpq $0, %rax
    jz primero
    movq buffer, %rbx
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
