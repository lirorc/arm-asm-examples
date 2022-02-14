iprint:
  sub sp, sp, 32
  stp x0, x1, [sp]
  stp x2, x3, [sp, 16]
  mov x2, 0
divideLoop:
  add x2, x2, 1
  mov x3, 10
  udiv x9, x0, x3
  msub x10, x9, x3, x0
  mov x0, x9
  add x10, x10, 48
  str x10, [sp, -16]! // needs to be 16 bit aligned
  cmp x0, 0
  bne divideLoop
printLoop:
  sub x2, x2, 1
  mov x0, sp
  str lr, [sp, 8]
  bl sprint
  ldr lr, [sp, 8]
  ldr x0, [sp], 16
  cmp x2, 0
  bne printLoop

  ldp x0, x1, [sp]
  ldp x2, x3, [sp, 16]
  add sp, sp, 32
  ret

iprintLF:
  str lr, [sp, -32]!
  bl iprint
  ldr lr, [sp]

  str x0, [sp, 24]
  mov x0, 0x0A
  str x0, [sp]
  mov x0, sp

  str lr, [sp, 16]
  bl sprint
  ldp lr, x0, [sp, 16]
  add sp, sp, 32
  ret

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
  str lr, [sp]
  bl slen
  ldr lr, [sp]
  add sp, sp, 16

  mov x2, x0
  ldr x0, [sp] // pop x0

  mov x1, x0
  mov x0, 1
  mov x8, 64
  svc 0

  ldp x0, x1, [sp]     // restore x0, x1
  ldp x2, x3, [sp, 16] // restore x2, x3
  add sp, sp, 32
  ret

sprintLF:
  sub sp, sp, 32
  str lr, [sp]
  bl sprint

  str x0, [sp, 8]
  mov x0, 0x0A
  str x0, [sp, 16]
  mov x0, sp
  add x0, x0, 16
  bl sprint

  ldp lr, x0, [sp] // restore lr, x0
  add sp, sp, 32
  ret

quit:
  mov x0, 0x0 // return 0
  mov x8, 93
  svc 0
