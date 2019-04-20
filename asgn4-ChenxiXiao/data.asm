        .ORIG x3500

        ; Question 1
Q1STR   .FILL Q1  ; Address of prompt
Q1PTS   .FILL #12 ; Point value for option 1
        .FILL #5 ; Point value for option 2
        .FILL #4  ; Point value for option 3
        .FILL #3  ; Point value for option 4

Q2STR   .FILL Q2
Q2PTS   .FILL #5
        .FILL #10
        .FILL #10
        .FILL #10

        ; Question 3
Q3STR   .FILL Q3
Q3PTS   .FILL #10
        .FILL #12
        .FILL #2
        .FILL #2

        ; Results

RESULTS .FILL GOODMSG
        .FILL PASSMSG
        .FILL FAILMSG

        ; Strings must be declared separately because their lengths are variable.
Q1      .STRINGZ "\nWhich one is a onto function? \n    1) F(n) = n-1 \n    2) F(n) = n2 + 1 \n    3) F(n) = n3 \n    4) I donno \n"
Q2      .STRINGZ "\nWhich one is not onto function? \n    1) F(n) = n-1 \n    2) F(n) = n2 + 1 \n    3) F(n) = n3 \n    4) I donno \n"
Q3      .STRINGZ "\nWhat is array? \n  1)  cupboard with different number of shelves \n   2) continuous block of allocated memory with declared with a type and a size \n 3) something tasty \n  4) I donno \n"

GOODMSG .STRINGZ "Looks like you know your discrete."
PASSMSG .STRINGZ "You won't get partial credit on a real exam."
FAILMSG .STRINGZ "Well... GG"
        .END
