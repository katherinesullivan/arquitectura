.data
var: .byte 0x01

.text 
.global main 

main:
    movq $var, %rax # rax = 0x404028
    movq var, %rax #rax = 1
    ret
