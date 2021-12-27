	AREA myData, DATA
myNum EQU 3
arrSize EQU 10
	
	EXPORT __main5
	AREA myCode, CODE, READONLY
	ENTRY
	
array DCB 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

__main5
	LDR R0, =array ; start of array
	LDR	R1, =arrSize
	SUB R1, R1, #1
	LDR R2, =myNum
	MOV R7, #2
	MOV R3, #0 ; L
	ADD R4, R3, R1 ; R
	
	
loop
	ADD R5, R4, R3
	UDIV R5, R5, R7 ; M
	ADD R5, R5, R0 ; M address
	LDRB R6, [R5] ; M num
	CMP R2, R6 ; compare
	BEQ stop
	BCS right
	BCC left
	
right
	SUB R5, R5, R0 ; M
	MOV R3, R5 ; L
	ADD R3, R3, #1 ; new L
	B loop
	
left
	SUB R5, R5, R0 ; M
	MOV R4, R5 ; R
	SUB R4, R4, #1 ; new R
	B loop
	
stop B stop
	END
	
