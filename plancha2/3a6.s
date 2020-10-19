.global main
main:
    # -1 & ~(1 << 8)
    movl $1, %eax
    shll $8, %eax
    notl %eax
    andl $-1, %eax
    ret