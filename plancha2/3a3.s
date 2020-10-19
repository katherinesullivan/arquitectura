.global main
main:
    # -1 & ~0xFF
    movl $0xff, %eax
    notl %eax
    andl $-1, %eax
    ret