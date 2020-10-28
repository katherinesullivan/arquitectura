.text
.global main
main:
    movq $0, %rcx
    movq $64, %rbx

condicion:
    decq %rbx
    jnz while
    jz retorno

while: 
    rol $1, %rax
    jc suma
    jmp condicion

suma:
    addq %rcx
    jmp comdicion

retorno:
    ret