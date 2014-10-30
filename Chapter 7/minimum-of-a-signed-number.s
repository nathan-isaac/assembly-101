; This program finds the minimum of a list of constant words in signed format
; The result is in r3 at the end of the routine.
; Rob Frohne 10/30/2013

	AREA Program, CODE, READONLY

	ENTRY

	ldr r0,=end	; load the end address of the code & initialize it as the pointer.
	ldr r2,=begin	; load the beginning address of the code.
	mov r3,#0x7fffffff ; Initialize r3 as the most positive number.

loop	
	ldr r6,[r2], #4 ; load the next data into r6 and post increment r2 for the next data.
	cmp r6,r3      ; Find out if r6 > r3. result from r6-r3  like subs r7,r6,r3 without r6 necessary.
	bgt no_update  ; If it is no update.
	mov r3,r6      ; update if r6 is lower than r3.
no_update
	cmp r0,r2      ;  are we at the end yet
	bne loop       ; if r7 != 0 then keep looping

stop b stop

ALIGN
begin
	DCD 0x8fffffff, 0x55555555, 0x44444444, 0x77777777, 0xffffffff
end	
	END 