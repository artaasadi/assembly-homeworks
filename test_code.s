	AREA myData, DATA
CONST EQU 4
	
	EXPORT __main
	AREA myCode, CODE, READONLY
	ENTRY
		
__main
	LDR r0, =CONST
	LDR r1, =1 ; result
	LDR r2, =1 ; counter
	
loop
	ADD r2, r2, #1 ; r2 = r2 + 1
	MUL r1, r1, r2 ; r1 = r1 * r2
	SUBS r3, r0, r2 ; r3 = r0 - r2
	
	BNE loop
	
stop B stop
	END