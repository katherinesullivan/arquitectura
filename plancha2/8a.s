# Utilizamos como caracter terminador de la cadena al punto
# No pudimos encontrar una manera de hacer uso del \0.
    .data
cadena: .asciz "123456."
    .text
    .global main
main:
    movq $cadena, %rdi
    movb $'a', %sil
    
    .global busca
busca:
    cmpb $'.', (%rdi)
    jz noencontrado
    cmpb %sil, (%rdi)
    jz encontrado
    incq %rdi
    jmp busca

noencontrado:
    movq $-1, %rax
    jmp retorno

encontrado:
    movq %rdi, %rax

retorno:
    ret
