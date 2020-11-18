    .data
var1: .double 1.5
var2: .double 2.5
    .text
    .global main
main:
    movss var1, %xmm0
    movss var2, %xmm1
    cmpss %xmm0, %xmm1, 0
