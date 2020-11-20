    .data
zero: .long 0
a: .float 0
b: .float 0
c: .float 20
d: .float 0
e: .float 2
f: .float 4
var1: .float 1.00000
var2: .float 1.00000
formato: .asciz "%f\n"

    .text
    .global solve
# xmm0 = a, xmm1 = b, xmm2 = c, xmm3 = d, xmm4 = e, xmm5 = f

a0:
    ucomiss %xmm6, %xmm3
    jz incompoinf # si tanto a como d son ceros tenemos una columna nula y el rango de la matriz es < 2
    ucomiss %xmm6, %xmm1 # si b=0 tendremos infintas sol (c=0) o ninguna (c!=0)
    jz incompoinf
    divss %xmm1, %xmm2 # en %xmm2 queda el valor de y
    movss %xmm2, var2 # se carga el contenido de %xmm2 en la dir de memoria de var2
    mulss %xmm2, %xmm4
    subss %xmm4, %xmm5
    divss %xmm3, %xmm5 # queda en %xmm5 el valor de x
    movss %xmm5, var1 # se carga el contenido de %xmm5 en la dir de memoria de var1
    jmp retornonormal

    .global main
main:
    movss a, %xmm0
    movss b, %xmm1
    movss c, %xmm2
    movss d, %xmm3
    movss e, %xmm4
    movss f, %xmm5
    movq $0, %rax
    cvtsi2ssq %rax, %xmm6
    #movq $var1, %rdi
    #movq $var2, %rsi
    call eliminacionprogresiva
    ret
    
retornonormal:
    movq $0, %rax
    ret

incompoinf:
    movq $-1, %rax
    ret


eliminacionprogresiva:
    ucomiss %xmm6, %xmm0 # vemos que a no sea cero
    jz a0
    divss %xmm0, %xmm3
    subss %xmm3, %xmm4
    subss %xmm3, %xmm5
    ucomiss %xmm6, %xmm5 # si f-(d/a) = 0 entonces el sistema tendrá infintas sol o ninguna
    jz incompoinf
    divss %xmm4, %xmm5 # en xmm5 queda el valor de y
    movss %xmm5, var2 # se carga el contenido de xmm5 en la dir de memoria de var2
    mulss %xmm5, %xmm1
    subss %xmm1, %xmm2
    divss %xmm0, %xmm2 # en xmm2 queda el valor de x
    movss %xmm2, var1 # se carga el contenido de xmm2 en la dir de memoria de var1
    jmp retornonormal

