.global sum
sum:
    # notar que en este caso los argumentos
    # son punteros y vienen en rdi y rsi respectivamente

    # copia los 4 floats de "a" a xmm0
    movaps (%rdi), %xmm0
    # copia los 4 floats de "b" a xmm1
    movaps (%rsi), %xmm1
    # suma los 4 floats a la vez
    addps %xmm0, %xmm1
    # guarda el resultado en "a"
    movaps %xmm1, (%rdi)
    ret

# repetir esto