.global main
main:
    # 0x80000000 + 0x80000000
    movl $0x80000000, %eax
    addl %eax, %eax
    ret 