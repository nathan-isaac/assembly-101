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
	;mov r3,#0x00000000 ; Initialize r3 with smallest number
	;mov r4,#0xffffffff ; Initialize r4 with largest number

   	bl find_largest_and_smallest_sub
	;bl find_smallest_sub

stop 
	b stop

; This subroutine saves the registers,
; messes up the registers locally,
; then restores the registers and returns.
find_largest_and_smallest_sub
   	stmfd sp!, {r0, r2, lr} ; save used registers and the link register (r14)

	; foreach numbers as number
	  	
	
		LDR r6, [r2], #4 ; highest
		MOV r5, r6 ; lowest		  

foreach
		
		LDR r4, [r2], #4
		CMP r4, #0
		
		BEQ endforeach
		
		CMP r4, r6 ; if r4 > r6 update r6 to new highest
		BHI higher

		CMP r4, r5 ; if r4 > r5 update r5 to new lowest
		BLS lower

		B foreach

lower
		MOV r5, r4
		B foreach

higher
		MOV r6, r4
		B foreach 
		
endforeach	  	

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