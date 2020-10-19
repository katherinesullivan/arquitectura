.global main
main:
    # 0xAA | (0xAA << 24)
    movl $0xaa, %ebx
    shll $24, %ebx
    movl $0xaa, %eax
    orl %ebx, %eax
    ret