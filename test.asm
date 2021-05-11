.macro print_int (%reg)		# Prints an integer from reg
li $v0, 1                  
addi $a0 %reg 0
syscall
.end_macro

.text
li $t0 -50000
li $t1 50000
slt $s0, $t0, $t1
sltu $s1, $t0, $t1

print_int($s0)
print_int($s1)

li $t0 -50000
li $t1 50001
slt $s0, $t0, $t1
sltu $s1, $t0, $t1

print_int($s0)
print_int($s1)

li $v0 ,10
syscall