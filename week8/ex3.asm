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
	e: .float 2.71828
	pi: .float 3.1415
.text
	l.s $f1, e
	l.s $f2, pi
	
	mul.s $f1, $f1, $f1
	div.s $f1, $f1, $f2
	print_float ($f1)
	done
