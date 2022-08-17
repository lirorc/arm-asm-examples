.include "lesson11funs.asm"

.text
.globl _start
_start:
  mov x2, 0

  nextNum:
  add x2, x2, 1
  mov x0, x2
  bl iprintLF
  cmp x2, 10
  bne nextNum

  b quit
