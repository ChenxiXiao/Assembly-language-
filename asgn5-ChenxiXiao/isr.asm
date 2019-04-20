
        .ORIG x3500
        ;ST R0, SAVER0 ; store data -- use to load the char ascii from KBDR
        ST R1, SAVER1 ; use to clear the KBSR and loaad PC 

READ    ;LDI R0, KBSR ; why we dont need to use this anymore
        ;BRzp READ

        
        LDI R0, KBDR
        AND R1, R1, #0 ; clear
        STI R1, KBSR    ; disable the interrupts by clearing KBSR
        LDI R1, R7PC    ; Load PC of useful Program 1 saved in x32FF into R1
        STR R1, R6, #0 ; Put PC of UP1 into location of stack pointer at R6
        LD R1, SAVER1  ; return data 
        
        ;LD R0, SAVER0
        RTI ; return to useful program 1

    
R7PC    .FILL x32FF
KBDR    .FILL xFE02
KBSR    .FILL xFE00
SAVER0  .BLKW #1
SAVER1  .BLKW #1
        .END