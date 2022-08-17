slen:
  mov x9, 0
  mov x10, 0

nextchar:
  ldrb w9, [x0], 1
  cmp w9, 0
  beq finished
  add x10, x10, 1
  b nextchar

finished:
  mov x0, x10
  ret

sprint:
  sub sp, sp, 32
  stp x0, x1, [sp]     // push x0, x1
  stp x2, x3, [sp, 16] // push x2, x3

  sub sp, sp, 16
  str lr, [sp]         // store link register
  bl slen
  ldr lr, [sp]
  add sp, sp, 16

  mov x2, x0
  ldr x0, [sp]         // pop x0

  mov x1, x0
  mov x0, 1
  mov x8, 64
  svc 0

  ldp x0, x1, [sp]     // pop x0, x1
  ldp x2, x3, [sp, 16] // pop x2, x3
  add sp, sp, 32
  ret

quit:
  mov x0, 0x0          // return 0
  mov x8, 93
  svc 0
