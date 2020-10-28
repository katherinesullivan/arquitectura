.text
.global main
main:
    movq $0, %rcx
    movq $64, %rbx

while:
    decq %rbx
    jz retorno

    rol $1, %rax
    jc suma
    jmp while

suma:
    incq %rcx
    jmp while

retorno:
    ret
