; function stage1c_diff
; returns the difference between the max and min value out of three arguments passed in
; Arguments:
; r0 - first value
; r1 - second value
; r2 - third value
; Returns result in r0 register

stage1c_diff:
        ; implement your function here
        ; remember to push any registers you use to the stack before you use them
        ; ( and pop them off at the very end)

         ; this is a place holder - replace "1" with the register holding the return value
       push {r4,r5,lr}
         push {r0,r1,r2,lr}
          bl stage1a_min
          mov r4,r0
         pop {r0,r1,r2,lr}

         push {r0,r1,r2,lr}
          bl stage1b_max
          mov r5,r0
         pop {r0,r1,r2,lr}

         sub r0,r5,r4    ; r0 = r5 - r4

        pop {r4,r5,lr}

         bx lr


       ;below is the second step to solve the stage 1c but with longer code.
         cmp r0,r1
         blt compare1 ;when r0 < r1 call compare 1
         cmp r1,r2
         blt compare2 ;when r1<r0 and r1 < r2 call compare 2


          sub r0,r0,r2    ;r0 = r0 - r2
          b OUT     ;when r2 is the smallest move to r0

          comper2:
           cmp r0,r2
           blt calculate2    ;when r1 < r0 < r2 go to calculate r1 is the smallest and r2
                             ;is the biggest
           sub r0,r0,r1
           b OUT

          calculate2:
           sub r0,r2,r1      ;r0 = r2 - r1
           b OUT

          comper1:
          cmp r1,r2
          blt calculate1   ;when r0 < r1 < r2 go to calculate r0 is the smallest and r2
                           ;is the biggest
          cmp r0,r2
          blt calculate3    ;if r1 > r2 > r0 then go to calculate 3
          sub r0,r1,r2     ;r0 = r1 - r2
          b OUT         ;when r1>r0>r2


          calculate3:
          sub r0,r1,r0    ;r0 = r1 - r0
          b OUT

          calculate1:
           sub r0,r2,r0    ;r0 = r2 - r0
           b OUT

          bl OUT