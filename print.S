.data
msg:
.ascii "Konnichiwa Sekai!\n"
len = . - msg

.text
.globl _start
_start:
mov x0, #1
ldr x1, =msg
ldr x2, =len
mov x8, #64
svc #0

mov x0, 0x0
mov x8, #93
svc #0
