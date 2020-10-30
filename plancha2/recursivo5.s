# unsigned long fact1(unsigned long x) {
#     if (x <= 1)
#         return x;
#     return x * fact1(x - 1); 
# }

    .data
x: .long 6

    .text
    .global main
main:
    movq x, %rdi
    movq $1, %rcx
    push $0

fact:
    cmpq $1, %rdi 
    jle retornofact
    pushq %rdi
    decq %rdi
    jmp fact

retornofact:
    popq %rdi
    jz retorno
    imul %rdi, %rcx
    jmp retornofact

retorno:
    movq %rcx, %rax
    ret  
