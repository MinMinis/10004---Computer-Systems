; function stage4_quicksort
; sorts given array using the sorting algorithm quicksort
; Arguments:
; r0 - size of array
; r1 - array to flash
; r2 - BASE address of peripherals

stage4_quicksort:
        ; implement your function here
        ; remember to push any registers you use to the stack before you use them
        ; ( and pop them off at the very end)
        push {r3-r11,lr}
        ; your function must mov the address of the sorted array to r0
        mov r3,r2 ;move BASE address to r3
        mov r4,#0 ; r4 -  is used to load value
        mov r5,#0 ;r5 -  is used to load value
        mov r6,#0 ;r6 - address of value in array
        mov r7,#0
        add r7,r7,#4 ;r7 - address of value in array + 4 bytes
        mov r8,#0 ;r8 - count sort within 1 loop
        mov r9,r0 ;r9 - count for times quicksort applied for this array
        mov r10,#0
        add r10,r10,#4 ;r10 - 4 units ( can be used for 4 bytes)
        mov r11,#0 ;r11 - last bytes in array
        mul r11,r10,r0 ;multiply to get the bytes of array
        LOADING:
          ldr r4,[r1,r6] ; load value into r4
          ldr r5,[r1,r7] ; load value into r5
           cmp r7,r6  ;compare the addresses of 2 values in the array
           blt COMPARE_VALUE ;if true go to COMPARE_VALUE if false continue in the next line
           cmp r5,r4 ;compare 2 values in the array
           blt SWAPPED  ; if the behind number smaller then swap
                        ;if false go to CHECKED
          CHECKED:
            add r7,r7,r10  ;add 4 bytes to r7 to move to the next address in array
            cmp r7,r11 ;compare current address with the last bytes in the array so that r7 will stay with in the range from 4 to r11 in this case 32 bytes
            bne LOADING ;if have not compare all the value in the array then will contnue to load
           COUNTING_LOOP:
            add r8,r8,#1 ;have done loop in this array
            mul r6,r8,r10 ;to increase the bytes by each time we move to the next address in the array
            mov r7,#0 ;reset array address of r7
            cmp r8,r0 ;cmp whenever the algorithm has done or not
            bne LOADING ;if hasn't done
            b EXIT_WAY ;if done go directly to exit_way

           COMPARE_VALUE:
            cmp r5,r4  ;compare the 2 value in the array
            blt CHECKED ;if r5 < r4 then go to CHECKED

           SWAPPED:
            str r5,[r1,r6] ;store the smaller value in to the previous address
            str r4,[r1,r7]; store the bigger value into the next address
            mov r6,r7  ;move address of r7 to r6 to increase 4 bytes then will continue to sort
            b CHECKED  ;go directly to checked to add more bytes to r7

        EXIT_WAY:
        push {r4}
        mov r4,r1   ;move r1 to r4 for not overwrite any r0-r2
           push {r0-r2,lr}
            mov r0,r3  ;r0 - BASE address of peripherals
            mov r1,r9  ; r1 - size of array
            mov r2,r4  ; r2 - array to flash
            push {lr}
            bl stage2_flash_array
            pop {lr}
           pop {r0-r2,lr}
        pop {r4}
        pop {r3-r11,lr}
         bx lr