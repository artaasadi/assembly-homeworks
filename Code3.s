	EXPORT __main3
	AREA myCode, CODE, READONLY
	ENTRY

__main3
	LDR R4, =5 ; a
	LDR R5, =-6 ; b
	LDR R6, =2 ; c
	
loop
	ADDS R0, R4, R5 ; R0 = a + b
	BMI IFFALSE
	
IFTRUE
	SUB R6, R6, R4 ; c = c - a
	RSB R4, R4, #0 ; a = 0 - a  -->  a = -a
	SUBS R0, R4, R5 ; R0 = a - b
	BMI stop
	B loop
	
IFFALSE
	MUL R5, R6, R5 ; b = c * b
	RSB R4, R5, #2 ; a = 2 - b
	SUBS R0, R4, R5 ; R0 = a - b
	BMI stop
	B loop
	
stop B stop
END