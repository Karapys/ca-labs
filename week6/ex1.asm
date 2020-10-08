
.data # add this stuff to the data segment
	# load the hello string into data memory
	
	quot : .asciiz "Quotien is: "
	rem : .asciiz "Reminder is: "
	nw: .asciiz "\n"
	y: .asciiz "y is: "
	z: .asciiz "z is: "
	f: .asciiz "f is: "
	q: .asciiz "q is: "

.text # now we are in the text segment
	
	li $v0, 5 # read integer
	syscall
	add $s0, $v0, $zero # put y
	
	li $v0, 5 # read integer
	syscall
	add $s1, $v0, $zero # put z
	
	li $v0, 5 # read integer
	syscall
	add $s2, $v0, $zero # put f
	
	li $v0, 5 # read integer
	syscall
	add $s3, $v0, $zero # put q

	
	# Input Y
	li $v0, 4 # set up print string syscall
	la $a0, y # argument to print string
	syscall # tell the OS to do the syscall
	
	li $v0, 1 # x
	add $a0, $s0, $zero # argument to print string
	syscall # tell the OS to do the syscall
	
	li $v0, 4 # set up print string syscall
	la $a0, nw # argument to print string
	syscall # tell the OS to do the syscall
	
	# Input Z
	li $v0, 4 # set up print string syscall
	la $a0, z # argument to print string
	syscall # tell the OS to do the syscall
	
	li $v0, 1 # x
	add $a0, $s1, $zero # argument to print string
	syscall # tell the OS to do the syscall
	
	li $v0, 4 # set up print string syscall
	la $a0, nw # argument to print string
	syscall # tell the OS to do the syscall
	
	# Input F
	li $v0, 4 # set up print string syscall
	la $a0, f # argument to print string
	syscall # tell the OS to do the syscall
	
	li $v0, 1 # x
	add $a0, $s2, $zero # argument to print string
	syscall # tell the OS to do the syscall
	
	li $v0, 4 # set up print string syscall
	la $a0, nw # argument to print string
	syscall # tell the OS to do the syscall
	
	# Input Q
	li $v0, 4 # set up print string syscall
	la $a0, q # argument to print string
	syscall # tell the OS to do the syscall
	
	li $v0, 1 # x
	add $a0, $s3, $zero # argument to print string
	syscall # tell the OS to do the syscall
	
	li $v0, 4 # set up print string syscall
	la $a0, nw # argument to print string
	syscall # tell the OS to do the syscall
	
	li $v0, 4 # set up print string syscall
	la $a0, nw # argument to print string
	syscall # tell the OS to do the syscall
	
	# 8
	
	mult $s1, $s1
	mflo $t0 # temp = Z^2
	mult $s0, $t0
	mflo $t0 # temp = Y*Z^2
	div $t0 $s2
	mflo $t0
	mfhi $t1
	sub $t0, $t0, $s3
	
	
	li $v0, 4 # set up print string syscall
	la $a0, quot # argument to print string
	syscall # tell the OS to do the syscall
	
	li $v0, 1 # x
	add $a0, $t0, $zero # argument to print string
	syscall # tell the OS to do the syscall
	
	li $v0, 4 # set up print string syscall
	la $a0, nw # argument to print string
	syscall # tell the OS to do the syscall
	
	
	li $v0, 4 # set up print string syscall
	la $a0, rem # argument to print string
	syscall # tell the OS to do the syscall
	
	li $v0, 1 # x
	add $a0, $t1, $zero # argument to print string
	syscall # tell the OS to do the syscall
	
	li $v0, 10 # set up exit syscall
	syscall # tell the OS to do the syscall
