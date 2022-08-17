.include "lesson10funs.asm"

.text
.globl _start

_start:
  mov x2, 0
  sub sp, sp, 16

nextNum:
  add x2, x2, 1

  mov x0, x2
  add x0, x0, 48
  str x0, [sp]  // push x0 to stack
  mov x0, sp    // get the address of char
  bl sprintLF

  ldr x0, [sp]    // pop x0
  cmp x2, 10
  bne nextNum

  b quit
