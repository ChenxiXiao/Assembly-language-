 .ORIG x3000
        ADD R3, R3, #3 ; return 2
        
ENCRY  AND R0, R3, #0
       BRz ZERO
       ADD R0, R0, #-2 ; end with a one - zero out 0 bit
       ADD R3, R3, #1
       BRnzp ENCRY

       .END