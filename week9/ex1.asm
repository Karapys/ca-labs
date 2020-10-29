.data
a1: .float 5.4
b1: .float 12.3
c1: .float 18.23
d1: .float 8.23
.text
li $v0, 6
syscall
mov.s $f1, $f0
li $v0, 6
syscall
mov.s $f2, $f0
l.s $f3, a1
mul.s $f3, $f3 , $f1
mul.s $f3, $f3 , $f2
l.s $f4, b1
mul.s $f4, $f4 , $f2
sub.s $f3, $f3, $f4
l.s $f4, c1
mul.s $f4, $f4 , $f1
add.s $f3, $f3, $f4
l.s $f4,d1
sub.s $f3, $f3, $f4
li $v0, 2
mov.s $f12, $f3
syscall
