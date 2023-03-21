; function stage3_bubblesort
; sorts numarray using the sorting algorithm bubble sort
; Arguments:
; r0 - size of array
; r1 - array to flash
; r2 - BASE address of peripherals

stage3_bubblesort:
        ; implement your function here
        ; remember to push any registers you use to the stack before you use them
        ; ( and pop them off at the very end)
        push {r4-r9,lr}
        ; your function must mov the address of the sorted array to r0
        mov r6,r0  ;r6 will be used for counting bubble sort loop
        mov r8,r0  ;store the size of array into

        OUTER_LOOP:
         mov r7,r1 ; load array size
         ldr r4,[r7],#4 ;add 4 bytes to get the value
         mov r9,#1  ;load the index
           SORT_AGAIN:
            ldr r5,[r7],#4 ; continue to add 4 bytes to get the next value
            cmp r5,r4     ; compare the i+1 and i index
            bgt SWAPPING
              ;storing part
             str r4,[r1,r9,lsl #2]  ;storing r4's value into array
             sub r9,r9,#1
             str r5,[r1,r9,lsl #2]  ;storing r5's value into array
             add r9,r9,#1
             mov r5,r4  ; in order to move value from r4 to r5
           SWAPPING:
             mov r4,r5 ;change the r4's value into r5 value for swapping
             add r9,r9,#1  ;adding index to load the next value in the array
             cmp r9,r8
             bls SORT_AGAIN
             b COUNTER_BUBBLE

           COUNTER_BUBBLE:
              sub r6,r6,#1  ; count for each loop
              cmp r6,#0  ; if r6 != 0 then loop again
              bne OUTER_LOOP
              b END_SORT

         END_SORT:
          push{r0,r1,r2,lr}
           mov r6,r8
           mov r7,r1
           mov r0,r2  ;Base address peripherals
           mov r1,r6  ;size of array
           mov r2,r7  ;array to flash
           push {lr}
           bl stage2_flash_array
           pop {lr}
          pop{r0,r1,r2,lr}

         pop{r4-r9,lr}
         bx lr



