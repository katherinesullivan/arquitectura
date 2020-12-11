    .text
    .arm
    .global main

main:
    ldr r0, =0xd
    ldr r1, =0xb
    mov r2, #0
while:
    and r3, r1, #1
    cmp r3, #1
    addeq r2, r2, r0
    subeq r1, r1, #1
    movne r0, r0, LSL #1
    movne r1, r1, LSR #1
    cmp r1, #1
    bhs while
    
    mov r0, r2
    bx lr

