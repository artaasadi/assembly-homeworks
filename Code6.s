	EXPORT __main6
	AREA myCode, CODE, READONLY
	ENTRY

__main6
	LDR R0, =7
	
	LDR R1, =1
	LDR R2, =1
	LDR R3, =2 ; counter
	
	SUBS R4, R0, #1
	BEQ stop
	
loop
	SUBS R4, R0, R3
	BEQ stop
	ADD R4, R1, R2
	MOV R2, R1
	MOV R1, R4
	ADD R3, R3, #1
	B loop
	

stop B stop
END
	