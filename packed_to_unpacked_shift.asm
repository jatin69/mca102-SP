; Author - Jatin Rohilla
; Course - MCA 102

; Objective - Convert 16 BCD digits from packed to unpacked format using SHIFT instruction

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

    PROCESS:
    	; clear AX and carry flag
    	XOR AX,AX

        ; Mov 2 packed digits to AL
        MOV AL,PACKED[SI]
        INC SI     

        ; SHIFT AX by 4. AX= 0000-0000 0010-0001   becomes  0000-0010 0001-0000
        SHL AX,4
        ; SHIFT AL BY 4. AX= 0000-0010 0001-0000   becomes  0000-0010 0000-0001
        SHR AL,4 
        
        ; move AX data to memory
        MOV UNPACKED[DI], AH
        INC DI
        MOV UNPACKED[DI],AL
        INC DI  
        
        LOOP PROCESS   
        hlt
        
    code ENDS
END START