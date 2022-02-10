.data
msg:
.byte 'H','e','l','l','o',' '
.byte 'W','o','r','l','d'
.byte 0x0A

.text
.globl _start
_start:
  adr x1, msg // address of the string
  mov x2, 0
  mov x3, 0

nextchar:
  ldrb w3, [x1], 1 // move letter to w3 and increment x1
  cmp w3, 0        // is string over?
  add x2, x2, 1    // count the letters
  beq finished
  b nextchar

finished:
  adr x1, msg // address of the string
  mov x0, 1  // write to stdout
  mov x8, 64 // sys_write opcode
  svc 0

  mov x0, 0x0 // return 0
  mov x8, 93  // sys_exit opcode
  svc 0
