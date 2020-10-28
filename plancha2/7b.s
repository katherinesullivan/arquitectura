    .data
formato: .asciz "%d\n"

    .text
    .global main
main:
    movq formato, %rdi
    movq %rax, %rsi
    xor %rax, %rax
    call printf
    movq %rsi, %rax
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
