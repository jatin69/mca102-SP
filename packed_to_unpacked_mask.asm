; Author - Jatin Rohilla
; Course - MCA 102

; Objective - Convert 16 BCD digits from packed to unpacked format using masking technique

; data segment
data SEGMENT

	; initialising 16 packed BCD digits 
    PACKED      DB  12H,34H,56H,78H,91H,23H,45H,67H  
    ; expected unpacked result is : 0102,0304,0506,0708,0901,0203,0405,0607

    ; allocating space required to store 16 unpacked BCD digits, 1 Byte = 1 digit, so 16 digits = 16 bytes
    UNPACKED    DB  16 DUP(00H)                      

data ENDS

; code segment
code SEGMENT
    ASSUME DS:data, CS:code
    START: 
    MOV AX,data
    MOV DS,AX

    MOV SI,0 
    MOV DI,0 
    MOV CX,08H

    ; used for BIT masking 0FH = 0000-1111
    MOV BL,0FH

    PROCESS:
    	; clear AX and carry flag
    	XOR AX,AX

        ; Mov 2 packed digits to AL as well as AX (as we'll mask them individually to get the result)
        MOV AL,PACKED[SI]
        MOV AH,PACKED[SI]
        INC SI     

        ; RIGHT ROTATE AH BY 4. AX= 0001-0010 0001-0010   becomes  0000-0001 0001-0010
        ROR AH,4 

        ; AH= xxxx-0001  masked with 0000-1111  becomes  0000-0010
        AND AH,BL
        ; AL= xxxx-0010  masked with 0000-1111  becomes  0000-0010
        AND AL,BL

        ; move AX data to memory
        MOV UNPACKED[DI], AH
        INC DI
        MOV UNPACKED[DI],AL
        INC DI  
        
        LOOP PROCESS   
        hlt
        
    code ENDS
END START