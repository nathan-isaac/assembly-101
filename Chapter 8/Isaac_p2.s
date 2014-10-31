;---------------------------------------------------------------------------
;
;   Programmer  			: Nathan Isaac
;
;   Class       			: CPTR-215
;   Language    			: ARM assembly
;   Assembler   			: Keil
;   Target MCU				: NXP LPC-2148
;    
;   Description				: add 64-bit number subroutine
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

VAL1A EQU 0xffffffff
VAL2A EQU 0x00000001

VAL1B EQU 0x0000000f
VAL2B EQU 0x00000001

;---------------------------------------------------------------------------
; CODE 
;---------------------------------------------------------------------------
					
stack_start EQU 0x40001000
   AREA long_add, CODE

   ENTRY

Start
   	ldr sp, =stack_start ; Tell where we will place the stack.
                        ; (It goes down (lower addresses from here.)
	ldr R0, = VAL1A
	ldr R1, = VAL1B

	ldr R2, = VAL2A
	ldr R3, = VAL2B

   	bl long_add_subroutine

stop b stop

; This subroutine saves the registers,
; messes up the registers locally,
; then restores the registers and returns.
long_add_subroutine
   	stmfd sp!, {lr} ; save used registers and the link register (r14)
   
   	adds R8,R0,R1
	adcs R9,R1,R3 
   
  	ldmfd sp!, {pc} ; pop the stack and return 
	END 

;---------------------------------------------------------------------------
; DATA
;---------------------------------------------------------------------------

;---------------------------------------------------------------------------
; End of file.