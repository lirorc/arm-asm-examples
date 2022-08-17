.include "lesson8funs.asm"

.text
.globl _start
_start:
  mov x5, 8
  ldr x6, [sp]     // number of args

loop:
  cmp x6, 0
  beq fin
  ldr x0, [sp,x5]  // load arg addr
  bl sprintLF
  add x5, x5, 8
  sub x6, x6, 1    // decrement #args
  b loop
fin:
  b quit
