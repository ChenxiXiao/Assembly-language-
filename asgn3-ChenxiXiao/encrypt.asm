      
      ;Chenxi Xiao
      ;CSC 225
      
       .ORIG x3000
       ;R0 Message, ASCII Value
       ;R1 counter (down)
       ;R2 Key
       ;R3 check the 0 bit
       ;R4 store the array loc 
       ;R5 the start address of strings 
       ;R6 Check Enter and return


CLEAR  AND R1, R1, #0
       AND R2, R2, #0
       AND R3, R3, #0
       AND R4, R4, #0
       AND R5, R5, #0
       AND R6, R6, #0

ADDKEY LEA R0, KEYmesg
       PUTS ; print out R0, the message
       GETC ; Get the key from user
       OUT ; Display the result in R0
       ADD R2, R0, #0 ; Load the key from R0 
       ADD R2,R2,#-16  ; Tranfer the ASCII input to number and save in R4
       ADD R2,R2,#-16  ; Tranfer the ASCII input to number and save in R4
       ADD R2,R2,#-16  ; Tranfer the ASCII input to number and save in R4
       LD R0, ENTER
       OUT

       ADD R1,R1,#10 ; counter 
       ADD R1,R1,#10 ; set counter to 20 
       LEA R0, INPUTmesg
       PUTS
       LEA R4, ASCII ; Load R4 with the address of string to be encrypted 
READ   GETC     ; READ from keyboard to R0
       OUT      ; write one ASCII char from R0 to terminal - might change something cc
       
       ADD R6,R0,#-10  ; If hit Enter; then return  
       BRz PRINT ; loop out
       ;STR R4, ASCII, #0 ; load Ascii address to R4  
      
ENCRY  AND R3, R0, #1
       BRz ZERO
       ADD R0, R0, #-2 ; end with a one - zero out 0 bit
ZERO   ADD R0, R0, #1 ; end with a zero - add one to 0 bit
       ADD R0, R0, R2 ; add key to the result 
       STR R0, R4, #0 ; Store the input to the ASCII address
       
       ADD R5, R5, #-1 ; length of the string
       ADD R4,R4,#1 ; Increase the pointer 
       ADD R1, R1, #-1 ; Decrement the counter
       BRp READ
       LD R0, ENTER
       OUT

PRINT  STR R6, R4, #0 ; Store the input to the ASCII address
       LEA R0, RESmesg
       PUTS
       LEA R4, ASCII 
AGAIN  LDR R0, R4, #0 ; Copy the address to R0
       BRz DONE
       OUT
       ADD R4, R4, #1; 
       BRnzp AGAIN 
     
DONE   HALT

;DATA REGION
KEYmesg .stringz "Encryption Key (1 -9): "
INPUTmesg .stringz "Input Message : "
RESmesg .stringz "Encrypted Message : "
ENTER .FILL #10
ASCII .BLKW #21
KEY   .FILL x3101
      .END