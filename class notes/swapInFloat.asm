.data
  array: .float 0.897, 0.565, 0.656, 0.1234, 0.665, 0.3434, 0.1126, 0.554, 0.3349, 0.678, 0.3656, 0.9989 
  # buckets: .float 572 #143*4
  sizes: .space 52 #13*4
  test: .float 5.6
.text
main:
addi $t0,$zero,0
l.s $f12,array($t0)
mov.s $f1,$f12
addi $t0,$t0,4
l.s $f12,array($t0)
s.s $f1,array($t0)
addi $t0,$t0,-4
s.s $f12,array($t0)

li $v0,2
l.s $f12,array($t0)
syscall

li $v0,10
syscall
