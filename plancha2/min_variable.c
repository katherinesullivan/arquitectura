#include <stdarg.h>
#include <stdio.h>
#include <limits.h>

int min(int n, ...) {
  va_list l;
  int min, next;
  va_start(l, n);

  if (n < 1) {
    va_end(l);
    min = INT_MIN;
  } else {
    min = va_arg(l, int);
    for (int i = 1; i < n; i++) {
        next = va_arg(l, int);
        min = (min < next) ? min : next;
    }
  }
  va_end(l);
  return min;
}


int main(){
  printf("min(2,1,3) -> %d\n", min(3,2,1,3));
  printf("min(3,1,2,0) -> %d\n", min(4,3,2,1,0));
  printf("min(10,5,7,11,8) -> %d\n", min(5,10,5,7,11,8));
  printf("min(-45,0,1,12) -> %d\n", min(4,-45,0,1,12));
  return 0;
}
