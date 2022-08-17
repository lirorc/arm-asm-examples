.include "lesson14funs.asm"

.text
.globl _start
_start:
  mov x0, 90
  mov x1, 9
  mul x0, x0, x1
  bl iprintLF

  b quit
