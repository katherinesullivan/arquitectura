    .data
valor: .long 10
    .text
    .global main
main:
    xorq %rdx, %rdx  # rdx es value

setjmp2:
    movq setjmp2, %rcx  # rcx es el buffer
    movq %rdx, %rax

longjmp2:
    movq valor, %rdx
    jmp *%rcx
    
