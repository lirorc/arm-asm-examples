.data
msg:
.byte 'H','e','l','l','o',' '
.byte 'W','o','r','l','d'
.byte 0x0A

.text
.globl _start
_start:
  adr x0, msg // address of the string
  bl strlen

  mov x2, x0  // strlen leaves result on x0
  adr x1, msg // these are same as before
  mov x0, 1
  mov x8, 64
  svc 0

  mov x0, 0x0 // return 0
  mov x8, 93
  svc 0

strlen:
// str x1, [sp, -16] // push x1
// mov x1, x0

nextchar:
  ldrb w9, [x0], 1
  cmp w9, 0
  beq finished
  add x10, x10, 1
  b nextchar

finished:
  mov x0, x10
//ldr register, [sp], 16 // pop
  ret
