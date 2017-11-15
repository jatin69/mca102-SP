; Author - Jatin Rohilla
; Course - MCA 102

; Objective - Factorial - iterative

; data segment
DATA SEGMENT

    ; number whose factorial needs to be found 
    ; works upto 7! due to DD size limits
    NUMBER DD 5

    ; to store factorial of the number
    FACTORIAL DD ?

DATA ENDS

; code segment
CODE SEGMENT
    ASSUME DS:DATA,CS:CODE
    
START:
    MOV AX,DATA
    MOV DS,AX

    ; base condition
    MOV AX,1
    ; multiplication occurs as n(n-1)(n-2)..
    MOV CX,NUMBER

    FACT:
        MUL CX
        ;MOV FACTORIAL,AX
        LOOP FACT    
    
    MOV FACTORIAL,AX

CODE ENDS
END START