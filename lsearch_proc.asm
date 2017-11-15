; Author - Jatin Rohilla
; Course - MCA 102

; Objective - Implement Linear Search procedure

;data segment
DATA SEGMENT
    ARRAY DW 01H, 04H, 16H, 12H, 17H, 21H
    ELEMENT DW 17H
    INDEX DW ?
    TWO DB 2
DATA ENDS

;code segment
CODE SEGMENT
    
    ASSUME DS: DATA, CS:CODE
    
    START:
        MOV AX,DATA
        MOV DS,AX 
    
        ; clear AX
        MOV AX,0

        ; set SI=0
        MOV SI,0
        
        ; CX = array size
        MOV CX,6

        ; moving array base address to BX
        MOV BX,OFFSET ARRAY
        
        ; call mysearch
        CALL MYSEARCH

        ;halt program
        hlt

        ; a near procedure
        MYSEARCH PROC NEAR    
            
            SEARCH:
                MOV DX,BX[SI]
                CMP DX,ELEMENT
                JZ FOUND
                ; as it is word, SI is incremented twice
                INC SI
                INC SI
                LOOP SEARCH
            
            NOTFOUND:
                MOV INDEX,-1
                JMP DONE

            FOUND:
                MOV AX, SI
                DIV TWO
                MOV AH,0
                MOV INDEX,AX
                JMP DONE
                
            DONE: 
                RET 

        MYSEARCH ENDP

    
CODE ENDS
END START
    


    
            

    