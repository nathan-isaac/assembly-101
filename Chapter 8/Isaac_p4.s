;---------------------------------------------------------------------------
;
;   Programmer  			: Nathan Isaac
;
;   Class       			: CPTR-215
;   Language    			: ARM assembly
;   Assembler   			: Keil
;   Target MCU				: NXP LPC-2148
;    
;   Description				: Get largest and smallest 32-bit number subroutine
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
   AREA find_largest_and_smallest, CODE

   ENTRY

Start
   	ldr sp, =stack_start ; Tell where we will place the stack.
                        ; (It goes down (lower addresses from here.)

	ldr r0,=end_list	; load the end address of the code & initialize it as the pointer.
	ldr r2,=begin	; load the beginning address of the code.
	mov r3,#0x00000000 ; Initialize r3 to 0
	mov r3,#0xffffffff ; Initialize r3 to 0

   	bl find_largest_sub
	bl find_smallest_sub

stop 
	b stop

; This subroutine saves the registers,
; messes up the registers locally,
; then restores the registers and returns.
find_largest_sub
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
		DCD 0x00000001, 0x00000005, 0x00000111, 0x00000010, 0x00000006
end_list	
		END

;---------------------------------------------------------------------------
; End of file.