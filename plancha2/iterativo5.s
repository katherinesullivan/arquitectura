# unsigned long fact2(unsigned long x) {
#     unsigned long acc = 1; 
#     for (; x > 1; x--) {
#         acc *= x; 
#     }
#     return acc; 
# }

    .data
x: .quad 0

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
    # se podria usar loop


retorno: 
    ret
