.include "lesson15funs.asm"
.data
msg1: .asciz " remainder "

.text
.globl _start
_start:
  mov x9, 90
  mov x10, 9
  udiv x0, x9, x10      // find quotient
  msub x11, x0, x10, x9 // find remainder

  bl iprint             // print quotient

  adr x0, msg1
  bl sprint             // print msg1

  mov x0, x11
  bl iprintLF           // print remainder

  b quit
