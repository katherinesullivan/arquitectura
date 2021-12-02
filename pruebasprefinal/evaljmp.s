.global main 
main:
    movq $3, %rax
    movq $1, %rbx
    cmp %rax, %rbx
    jb retorno1 # entra aca
    #jg retorno2
    ret

retorno1:
    movq $0, %rax
    ret

retorno2:
    movq $2, %rax
    ret