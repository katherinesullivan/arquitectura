    .data
zero: .long 0
a: .float 1 
b: .float 0
c: .float 1.0
d: .float 0.0
e: .float 1.0
f: .float 2.0
var1: .float 0.0
var2: .float 0.0

    .text
    .global solve
# xmm0 = a, xmm1 = b, xmm2 = c, xmm3 = d, xmm4 = e, xmm5 = f
solve:
    #cmpss zero, %xmm0
    jmp eliminacionprogresiva


eliminacionprogresiva:
    divss %xmm0, %xmm3
    subss %xmm3, %xmm4
    subss %xmm3, %xmm5
    divss %xmm4, %xmm5 # en xmm5 queda el valor de y
    movss %xmm5, var2
    mulss %xmm5, %xmm1
    subss %xmm1, %xmm2
    divss %xmm0, %xmm2 # en xmm2 queda el valor de x
    movss %xmm2, var1
    jmp retorno


    .global main
main:
    movss a, %xmm0
    movss b, %xmm1
    movss c, %xmm2
    movss d, %xmm3
    movss e, %xmm4
    movss f, %xmm5
    movq $var1, %rdi
    movq $var2, %rsi
    
    jmp eliminacionprogresiva

retorno:
    ret

