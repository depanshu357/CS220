# Bubble Sort in MIPS Assembly Language

.data
arr:    .word   4, 2, 7, 1, 9, 3, 6, 5, 8    # The array to be sorted
size:   .word   9                           # The size of the array

.text
.globl  main
main:
    la      $t0, arr            # Load the address of the array into $t0
    lw      $t1, size           # Load the size of the array into $t1
    
    li      $t2, 1              # Initialize $t2 to 1 (true)
    j       .check              # Jump to the beginning of the outer loop
    
.outer_loop:
    li      $t2, 0              # Set $t2 to 0 (false)
    addi    $t1, $t1, -1        # Decrement the size of the array
    
.check:
    bgtz    $t1, .inner_loop    # If size > 0, jump to the inner loop
    
    bnez    $t2, .outer_loop    # If $t2 != 0 (true), jump to the outer loop
    
    li      $v0, 10             # Exit program
    
.inner_loop:
    sll     $t3, $t1, 2         # Multiply size by 4 (shift left 2) to get index
    add     $t3, $t3, $t0       # Add the array address to the index to get the address of the element
    
    lw      $t4, ($t3)          # Load the element into $t4
    lw      $t5, -4($t3)        # Load the previous element into $t5
    
    ble     $t5, $t4, .no_swap  # If previous element <= current element, jump to no_swap
    
    sw      $t5, ($t3)          # Swap the elements
    sw      $t4, -4($t3)
    
    li      $t2, 1              # Set $t2 to 1 (true)
    
.no_swap:
    addi    $t1, $t1, -1        # Decrement the size of the array
    bgtz    $t1, .inner_loop    # If size > 0, jump to the inner loop
    
    bnez    $t2, .outer_loop    # If $t2 != 0 (true), jump to the outer loop
    
    li      $v0, 10             # Exit program
