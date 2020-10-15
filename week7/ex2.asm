# Description : Count words in a string
.data
string: .asciiz "one two three four five six \0"
 
result : .asciiz "Number of words: "
.text 
main:
###############################
 
la $t0, string  # load the address of str into $t0
li $t1, 0 # set counter to 0
 
iterateChr:  
    lb $t2, 0($t0)  # Load the first byte from address in $t0 
    add $t0, $t0, 1 # increment the address  
    beqz $t2, end   # if $t2 == 0 then go to label end -> end of the string
    bne $t2, 32, iterateChr # if not space continue / 32 is “ ”
    add $t1, $t1, 1 		# if it is a space increment the counter
    j iterateChr      	# next iteration 
    
 end:  # print result
###############################
 
li $v0 ,4
la $a0, result
syscall
 
li $v0 ,1
move $a0 ,$t1
syscall
 
li $v0 ,10
syscall
