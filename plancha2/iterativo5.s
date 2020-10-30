# unsigned long fact2(unsigned long x) {
#     unsigned long acc = 1; 
#     for (; x > 1; x--) {
#         acc *= x; 
#     }
#     return acc; 
# }

    .data
x: .long 6

    .text
    .global main
main:
    movq x, %rcx
    incq %rcx
    movq $1, %rax

iteracion: 
    decq %rcx
    jz retorno
    imul %rcx, %rax
    jmp iteracion


retorno: 
    ret