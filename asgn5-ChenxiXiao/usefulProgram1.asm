; A very useful program.
; CSC 225, Assignment 5

        .ORIG x3000
        ; TODO: Set the Trap Vector Table.
        LD R2, TRAPVT ; load the x3300 address into R2
        STI R2, TRAP26 ;  store the entry for keyboard intterrupts x180 to x3500

        ; TODO: Set the Interrupt Vector Table.
        LD R3, IRVT ; 
        STI R3, KBIR ; store the entry for keyboard intterrupts x180 to x3500
        LDI R6, STACK
       
        ; TODO: Initialize the stack pointer.

MAIN    LEA R0, INITMSG ; Print the starting message.
        PUTS
        TRAP x26        ; Get a character.
        OUT             ; Print the character.
        TRAP x26        ; Repeat four more times.
        OUT
        TRAP x26
        OUT
        TRAP x26
        OUT
        TRAP x26
        OUT
        LEA R0, ENDMSG  ; Print the ending message.
        PUTS
        BRnzp MAIN

INITMSG .STRINGZ "Enter five characters: "
ENDMSG  .STRINGZ "\nSuccess! Running again...\n\n"
TRAPVT .FILL x3300
TRAP26 .FILL x26
STACK .FILL x3000
IRVT .FILL x3500 ; interrupt vector Table
KBIR .FILL x180 ; keyboard interrupt
        .END
