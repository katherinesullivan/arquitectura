.global main
main:
    # (1 << 31) | (1 << 15)
    movl $1, %eax
    movl $1, %ebx
    shll $0x1f, %eax
    shll $0x0f, %ebx
    orl %rax, %ebx
    ret