.data
msg:
.byte 'H','e','l','l','o',' '
.byte 'W','o','r','l','d'
.byte 0x0A

.text
.globl _start
_start:
  mov x3, #1  //write to stdout
  mov x2, #12 //length of the string
  ldr x1, =msg//address of the string
  mov x8, #64 //sys_write opcode
  svc #0
