#include <stdarg.h>
#include <stdio.h>

void miniprintf(char * fmt, ...) {
  va_list l;
  va_start(l, fmt);
  char *formato = fmt;
  for (; *formato; formato++) {
    switch (*formato) {
    case 'i':
      printf("%d ", va_arg(l, int));
      break;
    case 's':
      printf("%s ", va_arg(l, char*));
      break;
    case 'c':
      printf("%c ", va_arg(l, int));
      break;
    }
  }
  printf("\n");
  va_end(l);
}

int main() {
  miniprintf("isci", 89, "hola", 'i', 19);
  miniprintf("csicc", 'a', "chau", 14, 'b', 'c');
}