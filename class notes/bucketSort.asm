.data
  array: .float 0.897, 0.565, 0.656, 0.1234, 0.665, 0.3434, 0.1126, 0.554, 0.3349, 0.678, 0.3656, 0.9989 
   buckets: .space 576 #12*12*4  = 
  sizes: .space 52 #13*4 storing sizes of each bucket
  test: .float 5.6
  size: .word 48 # 12*4 for use in loop while print
  size2: .word 52 # 13*4
  size3: .word 12
  size4: .word 576
  spaceBar: .asciiz " \n"
  space: .asciiz " "
.text
main:
move $s0,$zero
lw $s2,size2 # n*4
addi $s3,$zero,0 #used to initialize buckets
la $s3, array

forLoop1: slt $t0, $s0, $s2
         beq $t0,$zero,exit2

         # sw $s3,sizes($s0)
        # lw $a0,sizes($s0)
        # li $v0,1
        # syscall

        # li $v0,4
        # la $a0, space
        # syscall

         addi $s0,$s0,4
         j forLoop1

exit2: j bucketSort

bucketSort: 
  move $s0,$zero    # $s0 = i =0
  lw $s2,size     # s2 = n*4
  lw $s3,size3
  forLoop2: slt $t0,$s0,$s2
      beq $t0,$zero,exit3

      l.s $f12,array($s0)
      mtc1 $s4,$f1
      cvt.s.w $f1,$f1
      mul.s $f12,$f12,$f1

      cvt.w.s $f12,$f12
      mfc1 $t4,$f12       # t4 = bi*4
      lw $t5,sizes($t4)
      mul $t6,$t4,$s3   #t6 = bi*4*12
      mul $t5,$t5,4     # t5 = sizes[bi]*4
      lw $t0,array($s0)
      sw $t0,buckets($t5)
      lw $t0,sizes($t4)
      addi $t0,$t0,1
      sw $t0,sizes($t4)

     # buckets[bi][sizes[bi]++]=arr[i];
      # calculating address 
      # space + bi*4*12 + sizes[bi]*4 = space + bi*4*12 + sizes*bi*4 * 4

      addi $s0,$s0,4
      j forLoop2

exit3: j startInsertionSort

startInsertionSort: move $s0,$zero # i=0
    move $s1,$zero
    lw $s2,size # i = 12*4 = 48 width of bucket
    lw $s3,size4 # 12*12*4
    forLoop3: slt $t0,$s0,$s3
        beq $t0,$zero,exit4
          InsertionSort:       

                        add $s4,$zero,$s0 # s4 = i
                        move $t1,$s0    #t1 = address of bucket[i]
                        lw $t2,sizes($s1)  # t2 = size
                        mul $t2,$t2,4
                        addi $t0,$zero,1
                        slt $t0,$t2,$t0
                        bne $t0,$zero,exit5 
                        forLoop4: slt $t0,$s4,$t2

                             beq $t0,$zero,exit5
                            addi $s5, $s4, -4  # s5 = i - 1
                            forLoop5:


                            slt $t0,$s5,$zero
                                      bne $t0,$zero,exit6
                                         swap:

                                         l.s $f2,buckets($s4) # v[i]
                                            l.s $f4,buckets($s5)  #v[j]
                                            c.lt.s $f2,$f4
                                            bc1f exit7
                                                                                                                                         
                        # li $v0,2
                                                s.s $f2,buckets($s5)
                                                s.s $f4,buckets($s4)

                        # mov.s $f12,$f2  # v[j]
                        # syscall

                        # li $v0,2
                        # mov.s $f12,$f4 # v[i]
                        # syscall

                                            exit7:
                                      addi $s5,$s5,-4 
                                      j forLoop5
                                      exit6:
                        addi $s4,$s4,4
                         j forLoop4
                        exit5:
       add $s0,$s0,$s2
       addi $s1,$s1,4
    j forLoop3
    
exit4: j PrintBuckets

PrintBuckets: move $s0,$zero # i=0
    move $s1,$zero
    lw $s2,size # i = 12*4 = 48 width of bucket
    lw $s3,size4 # 12*12*4
    forLoop6: slt $t0,$s0,$s3
        beq $t0,$zero,exit9
            move $t1,$s0    #t1 = address of bucket[i]
            lw $t2,sizes($t1)  # t2 = size
            mul $t2,$t2,4
            addi $s4,$s0,0
            forLoop7: slt $t0,$s4,$t2
                    beq $t0,$zero,exit8
                      
                     li $v0,2
                     l.s $f12,buckets($s4)
                    syscall

                    li $v0,4
        la $a0, space
        syscall

        li $v0,4
        la $a0, space
        syscall

            addi $s4,$s4,4
            j forLoop7
        exit8:
        add $s0,$s0,$s2
       addi $s1,$s1,4
    j forLoop6
        
exit9: li $v0,4
        la $a0, space
        syscall
j Print

Print:
move $s0,$zero
lw $s2, size
l.s $f12,array($s0)
forPrint: slt $t0, $s0, $s2
        beq $t0, $zero, exit1
        
        li $v0,2
        l.s $f12, array($s0)
        syscall

        li $v0,4
        la $a0, space
        syscall

        addi $s0,$s0,4
        j forPrint
exit1: 

li $v0,10
syscall