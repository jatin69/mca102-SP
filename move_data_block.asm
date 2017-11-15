; Author - Jatin Rohilla
; Course - MCA 102

; Objective - Move a block of data from one memory location to another

; data segment
data SEGMENT
	blockA db    13h,35h,17h,33h,91h
	blockB db    5 dup(0) 
    
data ENDS

; code segment
code SEGMENT

    ASSUME DS:data, CS:code
    START: 
    MOV AX,data
    MOV DS,AX

    MOV SI,0
    MOV DI,0

    ; loads base address of block A to BX
    LEA BX, blockA

    ; loads base address of block B to BP
    LEA BP, blockB

    ; data bytes in block A
    MOV CX, 05H
    

    NEXT:
    	
    	; moves one byte from BLOCK A to AL
    	MOV AL, BX[SI]

    	; moves one byte from AL to BLOCK B
    	MOV BP[DI],AL

    	INC SI
    	INC DI

    	LOOP NEXT

    code ENDS
END START