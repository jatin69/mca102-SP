; Author - Jatin Rohilla
; Course - MCA 102

; Objective - Convert 16 BCD digits from unpacked to packed format using ROTATE instruction

; data segment
data SEGMENT

	; initialising 16 unpacked BCD digits 
    UNPACKED    DB      01H,02H,03H,04H,05H,06H,07H,08H,09H,01H,02H,03H,04H,05H,06H,07H 
    ; expected packed result will be - 12,34,56,78,91,23,45,67 

    ; allocating space required to store 16 packed BCD digits, 1 Byte = 2 digits, so 16 digits = 8 bytes
    PACKED      DB      8 DUP(00H)

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

    	; move first two digits from array to AX
        MOV AH,UNPACKED[SI]
        INC SI 
        MOV AL,UNPACKED[SI]
        INC SI   
        
        ; LEFT ROTATE AL by 4.  AX= 0000-0001 0000-0010  becomes  0000-0001 0010-0000
        ROL AL,4
        ; RIGHT ROTATE AX by 4. AX= 0000-0001 0010-0000  becomes  0000-0000 0001-0010
        ROR AX,4
        
        ; 2 packed digits are now in AL, move them to memory
        MOV PACKED[DI],AL
		INC DI                
      
        LOOP PROCESS   
        hlt
        
    code ENDS
END START