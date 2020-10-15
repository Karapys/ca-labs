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
 
.data
	result: .asciiz "Result: "
 
 
.text
main:
	li $v0, 5                  # Read an integer to reg $v0
	syscall
	
	add $a0, $v0, $zero        # Specify input to function
	jal signFunc
	
	add $a0, $v0, $zero        # Specify input to function
	jal printRes
	
	done
 
###############################
signFunc:
	beq $a0, 0, zero           # Jump if input == 0
	bltz $a0, negative         # Jump if input < 0 
	bgtz $a0, positive         # Jump if input > 0
L1:	jr $ra
 
zero: 
	addi $v0, $zero, 0
	j L1
negative:
	addi $v0, $zero, -1
	j L1
positive:
	addi $v0, $zero, 1
	j L1
	
###############################
printRes:	
	push ($v0)
	push ($a0)
	push ($t1)
	
	add $t1, $zero, $a0
	
	li $v0 ,4
	la $a0, result
	syscall
 
	li $v0 ,1
	move $a0 ,$t1
	syscall
	
	pop ($t1)
	pop ($a0)
	pop ($v0)
	jr $ra
