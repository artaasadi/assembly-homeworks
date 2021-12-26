	AREA myData, DATA
NUMBER EQU 2_10010

	EXPORT __main1
	AREA myCode, CODE, READONLY
	ENTRY
	
__main1
	LDR R0, =NUMBER ; R0 = NUMBER
	LDR R1, =0 ; reverse
	LDR R9, =2
	
loop
	UDIV R2, R0, R9 ; R2 = R0 / 2
	MUL R3, R2, R9 ; R3 = R2 * 2 (shift R2 one to left)
	SUB R4, R0, R3 ; R4 is R0 mode 2 (right bit)
	
	MLA R1, R1, R9, R4 ; adds one digit to right of R1
	MOV R0, R2
	
	SUBS R0, #0 ; if statement R0 == 0
	BNE loop
	
	LDR R5, =NUMBER
	SUBS R6, R5, R1
	BEQ isEqual
	B notEqual
	
; *********************************** R10 is equal to FFFFFFFF if the number is palindrome and is equal to 00000000 if it's not palindrome
isEqual
	MOV R10, #0xFFFFFFFF
	B stop
notEqual
	MOV R10, #0x00000000
	
stop B stop
	END