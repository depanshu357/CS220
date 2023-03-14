.data
strFirstPrompt: .asciiz "Please enter a number: "
strSecondPrompt: .asciiz "Please enter another number: "
strThirdPrompt: .asciiz "Sum of these two numbers is:"
.text
main:
li $v0,4
la $a0,strFirstPrompt
syscall

li $v0,5
syscall
move $s0,$v0

li $v0,4
la $a0,strSecondPrompt
syscall

li $v0,5
syscall
move $s1,$v0
add $s2,$s1,$s0

li $v0,4
la $a0,strThirdPrompt
syscall

li $v0,1
move $a0,$s2 #add $a0,$s1,$s0
syscall

li $v0,10
syscall
