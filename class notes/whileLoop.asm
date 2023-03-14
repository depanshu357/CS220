.data  
myArray: .space 12  #declare an array of 3 elements  
newline: .asciiz “\n” 

.text 
main:  
addi $s0, $zero, 4   
addi $s1, $zero, 10  #The three values are stored in 3 registers  
addi $s2, $zero, 12  
addi $t0, $zero, 10  #index is at t0  sw $s0, myArray($t0)  
addi $t0, $t0, 4  
sw $s1, myArray($t1)  
addi $t0, $t0,4  
addi $t0, $zero, 0 

while:  
beq $t0, 12, exit  
lw $t6, myArray($t0)  
addi $t0, $t0, 4  
li $v0, 1      
addi $a0, $t6, 0  #Print the no  syscall        
li $v0,4   
la $a0, newline  #Print a new line  
syscall  
j while 

exit:
li $v0,10
syscall