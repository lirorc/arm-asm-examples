.include "lesson9funs.asm"

.data
msg1: .asciz "Speak friend and enter: "
msg2: .asciz "I would prefer apples than a "

.text
.globl _start
_start:
  adr x0, msg1
  bl sprint

  mov x2, 255
  adr x1, mystring
  mov x0, 0
  mov x8, 63         // sys_read opcode
  svc 0

  adr x0, msg2
  bl sprint

  adr x0, mystring
  bl sprint
  b quit

.bss
.lcomm mystring, 255 // read buffer
