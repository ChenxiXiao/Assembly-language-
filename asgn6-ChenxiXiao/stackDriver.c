
#include <stdio.h>
#include "stack.h"

int main(void){

    int running = 1;
    int stack[MAX_SIZE];
    int size = 0;
    int mode = DEC_MODE;
    int number = 0;
    char option[3];
    printf("Welcome to the stack program .\n\n");
    while(running){
        printf("Enter option: ");
        scanf(" %c", option);
        if (option[0] == 'q') {
            printf("Goodbye!\n");
            return 0;
        /*  +  Pushes an integer onto the stack.
· -  Pops an integer from the*/
 }        else if (option[0] == '+') {
            printf("What number? ");
            scanf(" %d", &number);
            if (push(stack, &size, number) == 1) {
                printf("Error: Stack overflow!\n");
            
            }
            printf("Stack: ");
        
            printStack(stack, size, mode);
            printf("\n\n");

        } else if (option[0] == '-') {
             
            if (pop(stack, &size, &number) == 1) {
                printf("Error: Stack underflow!\n");
                printf("Stack: []\n\n");
            } else {
                printf("Popped %d.\n", number);
                printf("Stack: ");
        
                printStack(stack, size, mode);
                printf("\n\n"); 
            }           
        } else if (option[0] == 'd') {
            mode = DEC_MODE;
            printf("Stack: ");
            printStack(stack, size, mode);
            printf("\n\n");
        } else if (option[0] == 'x') {
            mode = HEX_MODE;
            printf("Stack: ");
            printStack(stack, size, mode);
            printf("\n\n");
    
        } else if (option[0] == 'c') {
            mode = CHAR_MODE;
            printf("Stack: ");
            printStack(stack, size, mode);
            printf("\n\n");
        }

        else{
            printStack(stack, size, mode);
        }

    }
    return 0;
}    


    
