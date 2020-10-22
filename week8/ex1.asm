.data
	nw: .asciiz "\n"
	zero_f: .float 0

.macro read_int (%reg)		# Reads an integer to reg
li $v0, 5                  	
syscall
addi %reg $v0 0
.end_macro

.macro read_float (%reg)	# Reads a float to reg
li $v0, 6                  	
syscall
l.s $f31, zero_f
add.s %reg, $f0, $f31
.end_macro

.macro print_int (%reg)		# Prints an integer from reg
li $v0, 1                  
addi $a0 %reg 0
syscall
.end_macro

.macro print_float (%reg)	# Prints float from reg
li $v0, 2
l.s $f31, zero_f
add.s $f12, %reg, $f31
syscall
.end_macro

.macro print_string (%reg)	# Prints string from reg
li $v0, 4 		
la $a0, %reg
syscall
.end_macro

.macro print_string_ln (%reg)	# Prints string with new line at the end from reg
li $v0, 4 		
la $a0, %reg
syscall
li $v0, 4 		
la $a0, nw
syscall
.end_macro

.macro done
li $v0 ,10
syscall
.end_macro

.data
	input_message: .asciiz "Enter temperature in Fahrenheit: "
	output_message: .asciiz "Temperature in Celsius: "
	t1: .float 32
	t2: .float 5
	t3: .float 9
.text
	print_string (input_message)
	read_float ($f1)
	print_string (nw)
	
	l.s $f2, t1
	l.s $f3, t2
	l.s $f4, t3
	
	sub.s $f1, $f1, $f2
	mul.s $f1, $f1, $f3
	div.s $f1, $f1, $f4
	
	print_string (output_message)
	print_float ($f1)
	print_string (nw)
	done
	