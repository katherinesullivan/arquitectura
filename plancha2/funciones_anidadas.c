#include <stdio.h>

int p1() {
    int a = 5;
    int p2() {
        int b = a + 1;
        int p3() {
            int c = a * b;
            return c;
        }
        return p3();
    }
    return p2();
}

int main() {
    printf("%d\n", p1());
    return 0;
}