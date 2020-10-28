    .data
cadena: .asciz "123456"
    .text
    .global main
main:
    movq $cadena, %rdi
    movb $’6’, %sil
    
    .global busca
busca:
    cmpb $'\0', (%rdi)
    jz retorno
    cmpb %sil, (%rdi)
    jz encontrado
    addq $8, %rdi

encontrado:
    movq %rdi, %rax

retorno:
    ret
