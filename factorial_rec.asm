; Author - Jatin Rohilla
; Course - MCA 102

; Objective - Factorial - recursive

; data segment
DATA SEGMENT

    ; number whose factorial needs to be found
    NUM DW 5

    ; to store factorial of the number
    RESULT DW ?

DATA ENDS

; code segment
CODE SEGMENT
    ASSUME DS:DATA, CS:CODE
    
START:
    MOV AX,DATA
    MOV DS,AX

    ; base condition
    MOV AX,01H

    ; call factorial 
    CALL FACTORIAL
               
    hlt
    
    ; factorial is a near procedure
    FACTORIAL PROC NEAR
        CMP NUM,0
        JE DONE
        MUL NUM
        DEC NUM
        CALL FACTORIAL
    
        ; if done, store result and return    
        DONE:
        MOV RESULT,AX
        RET
    FACTORIAL ENDP


CODE ENDS
END START
     