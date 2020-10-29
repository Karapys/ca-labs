.data
	nw: .asciiz "\n"
	zero_f: .float 0

.macro read_int (%reg)		# Reads an integer to reg
li $v0, 5                  	
syscall
addi %reg $v0 0
.end_macro

.macro print_int (%reg)		# Prints an integer from reg
li $v0, 1                  
addi $a0 %reg 0
syscall
.end_macro

.macro push (%reg)
addi $sp , $sp , -4
sw %reg , 0( $sp )
.end_macro
 
.macro pop (%reg)
addi $sp , $sp , 4
lw %reg, 0($sp)
.end_macro

.macro done
li $v0 ,10
syscall
.end_macro

.macro print_string (%reg)	# Prints string from reg
li $v0, 4 		
la $a0, %reg
syscall
.end_macro

.data
	input_message: .asciiz "Enter n: "
	output_message: .asciiz "Result is: "

.text
	print_string (input_message)
	read_int ($t5)
	print_string (nw)
	
	addi $t2, $zero, 0
	addi $t3, $zero, 0
loop:
	addi $t2, $t2, 1
	addi $a0, $t2, 0
	jal two_power
	add $t3, $t3, $v0 
	blt $t2, $t5, loop
	
	print_string (output_message)
	print_int ($t3)
	print_string (nw)
	done

two_power: 
	push($t1)
	addi $v0, $zero, 2
	addi $t1, $zero, 1
loop2:
	bge $t1, $a0, exit
	mul $v0, $v0, 2
	addi $t1, $t1, 1
	j loop2
exit:
	pop($t1)
	jr $ra