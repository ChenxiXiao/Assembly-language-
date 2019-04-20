
    .ORIG x3300 
    STI R7, SAVEPC ; SAVE PC
    LD R7, KBSRIB   ;Load R7 with x4000 to enable interrupt bit
    
    STI R7, KBSR    ;Store R7 into KBSR (make KBSR x4000 which is interrupt bit enabled and ready bit 0)

    LD R7, UP2      ;Load R7 with location of UP2
    JMP R7          ;Jump to UP2

SAVEPC .FILL x32FF
UP2     .FILL x3400
KBSR    .FILL xFE00
KBSRIB  .FILL x4000


        .END