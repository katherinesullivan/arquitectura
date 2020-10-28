    .data
cadenalarga: .asciz "123456"
cadenacorta: .asciz "123"
    .text
    .global main 
main:
    movq $cadenalarga, %rdi
    movq $cadenacorta, %rsi
    movl $3, %edx  #debe ser la longitud de cadena corta

    xorq %rax, %rax
    incl %edx

    .global compara 
compara:
    #retorna 1 si las cadenas son iguales en los primeros %edx caracteres
    #retorna 0 si son distintas
    decl %edx
    jz soniguales
    movb (%rdi), %cl
    cmpb %cl, (%rsi)
    jnz retorno
    incq %rdi
    incq %rsi
    jmp compara

soniguales:
    incq %rax

retorno:
    ret
