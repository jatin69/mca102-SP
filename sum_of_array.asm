; Author - Jatin Rohilla
; Course - MCA 102

; Objective - Find sum of elements of the array
; Verification - all the 6 elements are added and stored in SUM variable in HEX
;                which can then be converted to decimal to verify the addition result.

; data segment
data SEGMENT
    ARRAY   DD 2491FH,1767H,1FDBH,3ACCdH,A451H,4678EBH     
    SUM     DD 0H                    
data ENDS

; code segment
code SEGMENT
    ASSUME DS:data, CS:code
    START: 
    MOV AX,data
    MOV DS,AX
    

    XOR  AX,AX
    MOV  SI,0H
    LEA  BX,ARRAY             
    ; Initialise counter with size of array
    MOV  CX,06H               
      
    SUMDOUBLE:  
        ; Move lower 16 bits of sum to AX
        MOV  AX,WORD PTR SUM 
        ; add lower 16 bits of element 
        ADC  AX,WORD PTR BX[SI]   
        ; Move the addition result to SUM variable
        MOV  WORD PTR SUM,AX                


        ; Move lower 16 bits of sum to AX
        MOV  AX,WORD PTR SUM+2
        ; add lower 16 bits of element 
        ADC  AX,WORD PTR BX[SI+2]   
        ; Move the addition result to SUM variable
        MOV  WORD PTR SUM+2,AX    
        
        ; To go to next Double word ( 4 bytes ) in array
        INC  SI
        INC  SI
        INC  SI                                   
        INC  SI
        LOOP SUMDOUBLE            

    code ENDS
END START