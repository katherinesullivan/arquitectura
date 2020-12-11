    .section .rodata
i: .word 2
j: .word 3

    .text
    .arm
    .global main

main:
    ldr r0, =i
    ldr r1, =j
    mov r2, #0

while:
    and r3, r1, #1
    cmp r3, #1
    addeq r2, r2, r0
    subeq r1, r1, #1
    movne r0, r0, LSL #2
    movne r1, r1, LSR #2
    cmp r1, #1
    bge while
    mov r0, r2
    bx lr

