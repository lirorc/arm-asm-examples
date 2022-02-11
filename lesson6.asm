.include "lesson6funs.asm"
.data
msg:
.byte 'H','e','l','l','o', 0x0A, 0x0
msg2:
.byte 'W','o','r','l','d', 0x0A, 0x0

.text
.globl _start
_start:
  adr x0, msg
  bl sprint

  adr x0, msg2
  bl sprint

  b quit
