; function stage1a_min
; returns the minimum value out of three arguments passed in
; Arguments:
; r0 - first value
; r1 - second value
; r2 - third value
; Returns result in r0 register

stage1a_min:
        ; implement your function here
        ; remember to push any registers you use to the stack before you use them
        ; ( and pop them off at the very end)
         push {lr}
         ; this is a place holder - replace "1" with the register holding the return value

         cmp r0,r1
         blt compar1 ;when r0 < r1 call compare 1
         cmp r1,r2
         blt compar2 ;when r1 < r0 and r1 < r2 call compare 2

          mov r0,r2
          b OUT     ;when r2 is the smallest move to r0

          compar2:
           mov r0,r1
           b OUT    ;when r1 is the smallest move to r0

          compar1:
          cmp r0,r2
          blt OUT   ;when r0 < r2 go to OUT r0 is the smallest

          mov r0,r2  ;when condition is wrong r2 is the smallest
          b OUT

            OUT:
            pop {lr}
         bx lr