.data
	a: .float 100000.0
.text
.globl main
main:
li $t0, 0
li $t1, 8
l.s $f2, a 

Input_Loop:
beq $t0, $t1, Print 
addi $t0, $t0, 1
li $v0, 6 
syscall
c.lt.s $f2, $f0
bc1t Input_Loop
mov.s $f2, $f0
j Input_Loop  
Print:
mov.s $f12, $f2
li $v0, 2              
syscall


li $v0, 10
 syscall
