.global main
main:
    #1 << 31
    movl $1, %eax
    shll $0x1f, %eax
    ret