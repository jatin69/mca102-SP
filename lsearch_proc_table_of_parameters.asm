; Author - Jatin Rohilla
; Course - MCA 102

; Objective - Implement Linear Search procedure using TABLE OF PARAMETERS
;
; Approach steps -
; 1. store variables onto TABLE OF PARAMETERS
; 2. call procedure of linear search
; 3. push all current registers to stack
; 4. access required parameters from TABLE OF PARAMETERS
; 5. store result onto TABLE OF PARAMETERS
; 6. Return Function
; 7. STORE the updated value of result from TABLE OF PARAMETERS to a variable
; 8. our required result is in the variable now.
; 9. halt the program


DATA SEGMENT

    ; array to be searched    
    array DW 01H 04H, 16H, 12H, 17H, 21H
    
    ; size of array
    size   DW 06h 
    
    ; element to be found
    element DW 12H 
    
    ; to store found index
    index  DW -1

    ; A table of parameters
    Table   DW 4 DUP(?)

DATA ENDS

STACK SEGMENT
    DW 20 DUP(?)
    TOS LABEL WORD
STACK ENDS

; code segment
CODE SEGMENT

    ASSUME DS: DATA, CS:CODE, SS:STACK
    
    START:
        MOV AX,DATA
        MOV DS,AX 
        
        MOV AX,STACK
        MOV SS,AX 
        
        ; Fill up the TABLE OF PARAMETERS

        ; move array base address to TABLE
        MOV Table+0,OFFSET array

        ; moving array size to TABLE
        MOV DX,size 
        MOV Table+2,DX 
        
        ; moving element to TABLE
        MOV DX,element
        MOV Table+4,DX
        
        ; move index to TABLE
        MOV DX, index
        MOV Table+6,DX

        ; store table offset to BX
        MOV BX,OFFSET Table 


        ; use Stack pointer to point to top of stack
        MOV SP,OFFSET TOS

        ; call procedure
        CALL Linear_Search   
        
        ; accessing updated index value from table of parameters
        MOV DX, Table+6
        MOV index, DX

        ; then exit
        hlt

        ; procedure of linear search
        Linear_Search PROC NEAR
            
            ; push current registers to stack
            PUSHA
          
            MOV DX,[BX]        ;array address 
            MOV CX,[BX+2]      ;size of array moved
            MOV DX,[BX+4]      ;element to be searched 
            MOV DI,[BX+6]      ;index 
            
            ; clear AX
            XOR AX,AX  
            MOV SI,0

            SEARCH:
                MOV AX,BX[SI]
                CMP AX,DX           ;compares the element with the array elements
                JZ FOUND
                INC SI
                INC SI
                LOOP SEARCH 
            
            NOTFOUND:
                MOV DI,-1
                MOV [BX+6],DI
                JMP DONE
            
            FOUND:
                MOV AX, SI
                ; shift right is equivalent to div by 2
                SHR AX, 1 
                MOV AH,0
                MOV DI,AX
                ; storing result onto table of parameters
                MOV [BX+6],DI
            
            DONE: 
                ; retrive all saved registers 
                POPA
                ; return 
                RET
                      
        Linear_Search ENDP 
            
CODE ENDS
END START
       
    
    
