# unsigned long fact1(unsigned long x) {
#     if (x <= 1)
#         return x;
#     return x * fact1(x - 1); 
# }

    .data
x: .long 6

    .text
    .global fact
fact:
    




    .global main
main:
    movq x, %rcx
    movq