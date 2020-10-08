.data
	space: .asciiz " "

.text
	li $s0, 1
	li $s1, 1
	
	li $s3, 8 # num of iterations
	
	add $a0, $s0, $zero
	jal print_num
	
	add $a0, $s1, $zero
	jal print_num
	
loop:	add $t0, $s1, $zero # save s1 to temp 
	add $s1, $s1, $s0 
	add $s0, $t0, $zero # load prev s1 to s0
	
	sub $s3, $s3, 1 # iterate counter
	
	add $a0, $s1, $zero
	jal print_num
	
	bgtz $s3, loop # run while counter > 0
	
	li $v0, 10 # set up exit syscall
	syscall # tell the OS to do the syscall
	

print_num:
	li $v0, 1 # print int
	syscall # tell the OS to do the syscall
	
	li $v0, 4 # set up print string syscall
	la $a0, space # argument to print string
	syscall # tell the OS to do the syscall
	jr   $ra