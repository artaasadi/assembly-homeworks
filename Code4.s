	EXPORT __main4
	AREA myCode, CODE, READONLY
	ENTRY

__main4
	LDR R0, =48 ; a
	LDR R1, =60 ; b
	SUBS R4, R0, R1 ; R4 = R0 - R1
	BMI displace
	MOV R3, R0
	MOV R2, R1
	B calcGCD
displace
	MOV R3, R1
	MOV R2, R0
calcGCD ; gcd in R2
	B mode
calcGCD2
	SUBS R4, R5, #0 ; R4 = R5 - 0
	BEQ calcLCM
	MOV R3, R2
	MOV R2, R5
	B calcGCD
calcLCM ; lcm in R3
	MUL R4, R0, R1 ; R4 = R0 * R1
	; we don't need R5 anymore so we use it for something else

	; dividing
	MOV R3, #0 ; counter
divide
	SUBS R4, R4, R2 ; R4 = R4 - R2
	ADD R3, R3, #1 ; increment counter
	BEQ stop
	B divide
	
	
	
; R5 = R2 % R3 ,, uses R4 as temp
mode
	MOV R4, R3
mode2
	SUBS R4, R4, R2 ; R4 = R4 - R3
	BMI calcGCD2 
	MOV R5, R4
	B mode2
	
stop B stop
END