.text
	# Read integer (sum up to this number)
	li $v0, 5
	syscall
	move $t0, $v0
	
	# This is the result
	li $t2,0
	
	# For cycle
	li $t1, 1 # i = 1
	j loop
	
loop:
	bgt $t1,$t0,exit # exit if i greater than n
	add $t2,$t2,$t1 # Add i to result
	addi $t1,$t1,1 # i += 1
	j loop
	
	
exit:
	# Print result
	li $v0,1
	move $a0,$t2
	syscall

	# exit
	li $v0, 10
	syscall