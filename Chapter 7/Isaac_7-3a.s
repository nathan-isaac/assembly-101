; This program finds the maximum value from a list of constant words 
; The result is in r0 at the end of the routine.
; Nathan Isaac 10/27/2014
		
Numvals EQU 5	; number of items in list
		AREA Program, CODE, READONLY

		EXPORT Reset_Handler
Reset_Handler

; r3 holds count and r4 hold total, r5 is the pointer to the data, ptr
		MOV r3, #Numvals
		MOV r4, #0
		LDR r5, =datastart

cloop 	MOVS r3, r3
		BEQ end_whi
		LDR r6, [r5], #4
		ADD r4, r4, r6
		SUB r3, r3, #1
		BAL cloop

end_whi NOP
		
stop 	b stop

		ALIGN
		AREA Thedata, DATA, NOINIT, READWRITE
datastart SPACE 20

	END 