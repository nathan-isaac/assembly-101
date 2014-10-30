; This program finds the maximum value from a list of constant words 
; The result is in r0 at the end of the routine.
; Nathan Isaac 10/27/2014

		AREA Program, CODE, READONLY
	
		ENTRY
	
		LDR r4, =begin 
		MOV r5, #0
		LDR r6, =end
	
		MOV r0, #0

loop_st LDR r7, [r4], #4
		CMP r0, r7
		BCS small
		MOV r0, r7

small	ADD r5, r5, #1
		CMP r5, r6
		BCC loop_st

stop 	b stop

ALIGN
begin
	DCD 0x8fffffff, 0x55555555, 0x44444444, 0x77777777, 0xffffffff
end	
	END 