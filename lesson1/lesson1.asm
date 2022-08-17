.data
msg:
.byte 'H','e','l','l','o',' '
.byte 'W','o','r','l','d'
.byte 0x0A

.text
.globl _start
_start:
  mov x2, #12 //length of the string
  adr x1, msg //address of the string
  mov x0, #1  //write to stdout
  mov x8, #64 //sys_write opcode
  svc #0
