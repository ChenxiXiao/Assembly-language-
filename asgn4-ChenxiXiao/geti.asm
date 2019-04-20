; "geti" subroutine.
; CSC 225, Asgn. 4
; Cici Xiao

        .ORIG x3300
        ST R1, SAVER1 
        ST R2, SAVER2
READ    LDI R0, KBSR ; load the status to R0
        BRzp READ ; check status
        LDI R0, KBDR ; get typed key 
WRITE   LDI R1, DSR 
        BRzp WRITE ; check status
        STI R0, DDR ; write to screen
        LD R2, OFFSET
        ADD R0, R0, R2 ; Convert the numeric char into int.
        LD R1, SAVER1 ; restore the value
        LD R2, SAVER2 ; load the value back the R2
        RET
    




OFFSET .FILL #-48 
KBSR .FILL xFE00
KBDR .FILL xFE02
DSR  .FILL xFE04
DDR  .FILL xFE06
SAVER1 .FILL x00
SAVER2 .FILL x00

        .END