
        .ORIG x3400

       ST R1, SAVER1 ; maintain a counter


     
LOOP    ADD R1, R1, #1 ; begin adding one and BRn checks if it's negative
        BRn PRINT      ; If negative, branch to PRINT and put x0042 (which is the ascii for asterisk) into R0
        BRzp LOOP          ; If not negative, keep adding #1 until it is
PRINT   AND R1, R1, #0
        ADD R1, R1, #15
        ADD R1, R1, #15
        ADD R0, R1, #12
        TRAP x21            ;Echoes character from R0 (*) onto screen
        AND R1, R1, #0      ; clear R1
        BRnzp LOOP          ;Repeat the whole loop

        LD R1, SAVER1

SAVER1 .FILL x00
        .END