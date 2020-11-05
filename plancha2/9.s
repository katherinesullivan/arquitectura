    .data
fmt: .string "%d"
entero: .long -100 
funcs: .quad f1 
       .quad f2 
       .quad f3

    .text
f1:     
    movl $0, %esi
    movq $fmt, %rdi 
    call printf
    jmp fin
f2:
    movl $1, %esi
    movq $fmt, %rdi
    call printf
    jmp fin
f3:
    movl $2, %esi
    movq $fmt, %rdi
    call printf
    jmp fin
    
    .global main
main:
    pushq %rbp
    movq %rsp, %rbp
    
    # Leemos el entero. 
    movq $entero, %rsi
    movq $fmt, %rdi
    xorq %rax, %rax 
    call scanf

    xorq %rax, %rax

    # COMPLETE CON DOS INSTRUCCIONES.
    # Entendemos que la manera más eficiente de realizarlo es usando direccionamiento relativo, 
    # sin embargo, no pudimos encontrar una manera que nos funcione siendo que la diferencia 
    # de memoria entre las funciones f1 y f2 y entre f2 y f3 es de 19 bytes y el valor de la
    # escala está limitada a 1, 2, 4 u 8.

    # movl entero, %edx
    # imul $19, %rdx
    # addq $f1, %rdx

    # SOLUCION CORRECTA
    movl entero, %ebx
    movq funcs(, %rbx, 8), %rdx


    jmp *%rdx

fin:
    movq %rbp, %rsp
    popq %rbp
    ret
