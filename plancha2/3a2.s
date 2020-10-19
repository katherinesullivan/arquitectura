.global main
main:
    mov $0x1f, %rax
    mov $0x0f, %rbx
    shl $1, %rax
    shl $1, %rbx
    orq %rax, %rbx
    retq