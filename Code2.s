	EXPORT __main2
	AREA myCode, CODE, READONLY
	ENTRY

__main2
	MOV r0, #0x34
	MOV r1, #0x36
	AND r0, r0, #0x0F
	AND r1, r1, #0x0F
	ORR r2, r1, r0, LSL #4
  
 
HERE B HERE
END