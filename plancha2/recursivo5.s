# unsigned long fact1(unsigned long x) {
#     if (x <= 1)
#         return x;
#     return x * fact1(x - 1); 
# }

    .data
x: .long 6

    .text
    .global fact
fact:
    decq %rdi
    jle retornofact
    pushq %rdi
    jmp fact

retornofact:
    popq %rdi
    jz retorno
    imul %rdi, %rax
    jmp retornofact

    .global main
main:
    movq x, %rdi
    incq %rdi
    movq $1, %rax
    push $0
    jmp fact

retorno:
    ret  
