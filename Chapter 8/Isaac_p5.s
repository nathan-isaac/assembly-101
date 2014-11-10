;---------------------------------------------------------------------------
;
;   Programmer  			: Nathan Isaac
;
;   Class       			: CPTR-215
;   Language    			: ARM assembly
;   Assembler   			: Keil
;   Target MCU				: NXP LPC-2148
;    
;   Description				: Output a null terminated character string subroutine
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
   AREA String_sup, CODE
   ENTRY
   EXPORT __main

__main
   	ldr sp, =stack_start ; Tell where we will place the stack.
                        ; (It goes down (lower addresses from here.)

	ldr r0,=begin	; load the end address of the code & initialize it as the pointer.
	ldr r2,=end_string	; load the beginning address of the code.

   	bl output_string

stop 
	b stop


output_string
   	stmfd sp!, {r0, r2, lr} ; save used registers and the link register (r14)
   
loop	
	ldr r6,[r2],#4 ; load the next data into r6 and post increment r2 for the next data.
	cmp r6,r3      ; Find out if r6 > r3. result from r6-r3  like subs r7,r6,r3 without r6 necessary.
	
	blt no_update  ; If it is no update.
	mov r3,r6      ; update if r6 is higher than r3.

no_update
	cmp r0,r2      ;  are we at the end yet
	bne loop       ; if r7 != 0 then keep looping
   
  	ldmfd sp!, {r0, r2, pc} ; pop the stack and return 

;---------------------------------------------------------------------------
; DATA
;---------------------------------------------------------------------------

ALIGN
begin
		DCB "Hello World",0
end_string	
		END

;---------------------------------------------------------------------------
; End of file.