; Author - Jatin Rohilla
; Course - MCA 102

; Objective - Implement MATRIX ADDITION

; data segment

DATA SEGMENT
    
    MatrixA DB 01h,02h,03h
            DB 04h,05h,06h
            DB 07h,08h,09h
    
    MatrixB DB 01h,02h,03h
            DB 04h,05h,06h
            DB 07h,08h,09h  
    
    SUM DB 9 DUP (?)
    
DATA ENDS

; code segmentt
CODE SEGMENT
    ASSUME DS:DATA CS:CODE
    
    START:
        MOV AX,DATA
        MOV DS,AX

        ; clear AX and carry
        XOR AX,AX

        MOV BP,0
        MOV DI,BP 
        MOV CX,3
        
    OUTER: 
        ; save index of outer loop
        PUSH CX

        ; inner loop needs to run 3 (column) times
        MOV CX,3 

        ; starting from index 0
        MOV DI,0
    
        INNER: 
            ; move element of matrix A to AL
            MOV AL,MatrixA[BP][DI]

            ; add AX to element of MATRIX B
            ADD AL,MatrixB[BP][DI] 
            
            ; save the addition result to SUM
            MOV SUM[BP][DI],AL

            ; next index
            INC DI
            
            LOOP INNER

        ; Retrive index of outer loop
        POP CX 

        ; We need to go to next row, so we add 3 to skip the entire current row
        ADD BP,3
        
        LOOP OUTER

CODE ENDS
END START