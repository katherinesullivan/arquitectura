    .data
format: .asciz "%ld\n"
i: .quad 0xDEADBEEF
    .text 
    .global main
main:
    movq $format, %rdi  # El primer argumento es el formato. 
    movq $1234, %rsi  # El valor a imprimir.
    xorq %rax, %rax  # Cantidad de valores de punto flotante. 
    call printf

    # apartado a
    


    ret





#a) El valor del registro rsp.
#b) La direcci ́on de la cadena de formato.
#c) La direcci ́on de la cadena de formato en hexadecimal. 
#d) El quad en el tope de la pila.
#e) El quad ubicado en la direcci ́on rsp + 8. 
#f) El valor i.
#g) La direcci ́on de i.