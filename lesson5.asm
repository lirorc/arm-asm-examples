.include "functions5.asm"
.data
msg:
.byte 'H','e','l','l','o', 0x0A
msg2:
.byte 'W','o','r','l','d', 0x0A
.byte 0x0

.text
.globl _start
_start:
  adr x0, msg
  bl sprint

  adr x0, msg2
  bl sprint

  add sp, sp, 16
  b quit
