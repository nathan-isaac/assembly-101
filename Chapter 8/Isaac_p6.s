;---------------------------------------------------------------------------
;
;   Programmer  			: Nathan Isaac
;
;   Class       			: CPTR-215
;   Language    			: ARM assembly
;   Assembler   			: Keil
;   Target MCU				: NXP LPC-2148
;    
;   Description				: compare two null terminated strings of characters held in memory
;
;   Inputs      			: none
;   
;   Outputs     			: none
;
;   Special requirements 	: Set up for execution with a Keil ARM simulator
;   
;
; 	NOTES					: 
;
;---------------------------------------------------------------------------


;---------------------------------------------------------------------------
; EQUATES
;---------------------------------------------------------------------------					

;---------------------------------------------------------------------------
; CODE 
;---------------------------------------------------------------------------
					
stack_start EQU 0x40001000
	AREA String_Compare, CODE
    ENTRY
Start
	ldr sp, =stack_start ; Tell where we will place the stack.
                        ; (It goes down (lower addresses from here.)
	ldr r0, =string1 
	ldr r1, =string2
	bl compare_strings
stop b stop

compare_strings
	stmfd sp!, {r2,r4,r5,lr} ; save used registers and the link register (r14)
	mov r2, #0 ; Initialize the counter for the first position.
loop
	ldrb r4,[r0],#1
	ldrb r5,[r1],#1
	cmp r5,r4
	bne do_not_match
	cmp r4, #0 ; check for end of string.
	beq match
	add r2, #1
	b loop
do_not_match
	mov r0, #0 ; don't match
	b finish
match
	mov r0, #1
finish
	mov r1,r2 ; Move the count into the result register.	
	ldmfd sp!, {r2,r4,r5,pc} ; pop the stack and return 


;---------------------------------------------------------------------------
; DATA
;---------------------------------------------------------------------------

string1 
	DCB "This is the first string.",00	; For testing purposes.
	ALIGN
string2 
	DCB "This is the first string.",00
	ALIGN
    END 

;---------------------------------------------------------------------------
; End of file.