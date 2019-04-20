; CSC 225, Assignment 4
; Chenxi Xiao
; R0 - answer 
; R1- Point array
; R2 - total points
; R3 - Counter 
        .ORIG x3000

        ; Example of printing Question 1: Q1STR is the address of an address in
        ;  the data file, so we have to make two passes using an LDI.
        AND R2, R2, #0 ; clear R2
        AND R3, R3, #0 ; clear R3
        ADD R3, R3, #2 ; set up counter
        LDI R0, Q1STR
        PUTS
        LEA R0, ANSWERMSG ; Print the answer prompt
        PUTS
        JSR GETANS

        ; Go to the second Question
        LDI R0, Q2STR
        PUTS
        LEA R0, ANSWERMSG ; Print the answer prompt
        PUTS
        JSR GETANS
      
        ; Third question
        LDI R0, Q3STR
        PUTS
        LEA R0, ANSWERMSG ; Print the answer prompt
        PUTS
        JSR GETANS
        LEA R0, RESULTPROMPT
        PUTS
  
        ADD R2, R2, #-16 
        ADD R2, R2, #-10
        BRp MESG1
        ADD R2, R2, #6
        BRnz MESG3
        LD R0, RESULTS
        ADD R0, R0, #1 ; Second mesg 
        LDR R0, R0, #0 ; Load the result string 
        BRnzp PRINT
MESG3   LD R0, RESULTS
        ADD R0, R0, #2 ; third mesg 
        LDR R0, R0, #0 ; Load the result string
        BRnzp #1
MESG1   LDI R0, RESULTS
PRINT   PUTS
        HALT

GETANS  ST R0, SAVER0 
        ST R7, SAVER7
        
        LD R0, GETI    ; Get the address of the subroutine
        STI R0, TP26
        TRAP x26

        ;loading the address of the Question 1 points array.
        ADD R3, R3, #-1 ; decrement the counter
        BRp FIRST
        BRz SECOND
        BRn THIRD
FIRST   LD R1, Q1PTS 
        BRnzp CAL
SECOND  LD R1, Q2PTS
        BRnzp CAL
THIRD   LD R1, Q3PTS
        ;accessing index 2 in the Question 1 points array:
CAL     ADD R1, R1, #-1 ; index 2 -- answer is 3
        ADD R1, R1, R0 ; increment the address by R0 the numeric answer 
        LDR R1, R1, #0 ; point
        ; calculate the points
        ADD R2, R2, R1
        LD R0, SAVER0 
        LD R7, SAVER7 
        LOAD
        RET


GETI .FILL x3300
SAVER0 .FILL x00
SAVER7 .FILL x00
TP26 .FILL x0026
RESULTPROMPT .STRINGZ "\nResult: "
ANSWERMSG .STRINGZ "\nAnswer: "
Q1STR   .FILL x3500
Q1PTS   .FILL x3501
Q2STR   .FILL x3505
Q2PTS   .FILL x3506
Q3STR   .FILL x350A
Q3PTS   .FILL x350B
RESULTS .FILL x350F
        .END