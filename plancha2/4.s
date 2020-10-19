.global main
main:
    mov $-1, %rax # Solo para este tama~no el mov pone en 0
                  # la parte alta del registro.
    movl $2, %ecx
    imull %ecx
    #completar para que el resultado correcto como signed quede en rax
    movl $-1, %ebx
    shlq $32, %rbx
    orq %rbx, %rax
    

    xorq %rax, %rax
    movw $-1, %ax
    movw $2, %cx
    mulw %cx
    #completar para que el resultado correcto como unsigned short
    #quede en eax
    shll $16, %edx
    orl %edx, %eax

    ret