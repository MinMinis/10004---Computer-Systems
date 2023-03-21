; function stage1b_max
; returns the maximum value out of three arguments passed in
; Arguments:
; r0 - first value
; r1 - second value
; r2 - third value
; Returns result in r0 register

stage1b_max:
        ; implement your function here
        ; remember to push any registers you use to the stack before you use them
        ; ( and pop them off at the very end)
         push {lr}
         ; this is a place holder - replace "1" with the register holding the return value

         cmp r0,r1
         bgt compare1 ;when r0 > r1 call compare 1
         cmp r1,r2
         bgt compare2 ;when r1>r0 and r1 > r2 call compare 2

          mov r0,r2
          b EXIT     ;when r2 is the largest move to r0

          compare2:
           mov r0,r1
           b EXIT    ;when r1 is the largest move to r0

          compare1:
          cmp r0,r2
          bgt EXIT   ;when r0 > r2 go to exit r0 is the largest
           mov r0,r2 ;if false then r2 is the biggest
           b EXIT

            EXIT:
            pop {lr}
         bx lr