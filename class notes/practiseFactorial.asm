.data
prompt: .asciiz "Enter a number:"
result: .asciiz "Fact(x) - "
.text
main:
li $v0,4
la $a0,prompt
syscall

li $v0,5
syscall

move $a0,$v0
jal factorial
move $t0,$v0
li $v0,4
la $a0,result
syscall
li $v0,1
move $a0,$t0
syscall
li $v0,10
syscall

factorial:
addi $sp,$sp,-8
sw $ra,4($sp)
sw $a0,0($sp)
slti $t0,$a0,2
beq $t0,$zero,else
addi $v0,$zero,1
lw $ra,4($sp)
lw $a0,0($sp)
addi $sp,$sp,8
jr $ra


else:
addi $a0,$a0,-1
jal factorial
mul $v0,$a0,$v0
