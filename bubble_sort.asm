; Define constants for array sizes
array_size EQU 9         ; Original array size
doubled_array_size EQU 18 ; Double the size of the original array

; Initialize array elements
MOV WORD PTR [BX+0], 3406D  
MOV WORD PTR [BX+2], 48799D
MOV WORD PTR [BX+4], 178D   
MOV WORD PTR [BX+6], 60104D 
MOV WORD PTR [BX+8], 54331D 
MOV WORD PTR [BX+10], 2542D 
MOV WORD PTR [BX+12], 3628D 
MOV WORD PTR [BX+14], 555D 
MOV WORD PTR [BX+16], 25D   
MOV WORD PTR [BX+18], 6195D

org 100h                   ; Set origin for .COM file

; Initialize registers
MOV BX, 2000H              ; Set base address for the array in BX
MOV SI, 0                   ; Index for inner loop
MOV DI, 0                   ; Index for outer loop

inner_loop:                ; Start of inner loop
    MOV DX, [BX + SI]      ; Load current element into DX
    MOV AX, [BX + SI + 2]  ; Load next element into AX

    CMP AX, DX             ; Compare the two elements
    JAE @GREATER_OR_EQUAL  ; Jump if AX >= DX
    JB @LOWER              ; Jump if AX < DX

@GREATER_OR_EQUAL:         ; If AX >= DX
    MOV [BX + SI], DX      ; Move DX (current element) to the current position
    MOV [BX + SI + 2], AX  ; Move AX (next element) to the next position
    ADD SI, 2              ; Move to the next pair of elements

    CMP SI, doubled_array_size ; Check if we reached the end of the doubled array
    JNZ inner_loop             ; If not, continue the inner loop
    LOOP outer_loop            ; Decrement CX and repeat if not zero

@LOWER:                    ; If AX < DX
    MOV CX, [BX + SI]      ; Load current element (in CX)
    MOV [BX + SI], AX      ; Move AX to the current position
    MOV [BX + SI + 2], CX  ; Move CX to the next position
    ADD SI, 2              ; Move to the next pair of elements

    CMP SI, doubled_array_size ; Check if we reached the end of the doubled array
    JNZ inner_loop             ; If not, continue the inner loop
    LOOP outer_loop            ; Decrement CX and repeat if not zero

outer_loop:                  ; Start of outer loop
    INC DI                   ; Increment outer loop index
    MOV SI, 0                ; Reset inner loop index
    CMP DI, array_size       ; Check if we have processed all original elements
    JNZ inner_loop           ; If not, continue the inner loop

HLT                          ; Halt the program
