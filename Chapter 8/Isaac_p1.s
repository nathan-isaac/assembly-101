;---------------------------------------------------------------------------
;
;   Programmer  			: Nathan Isaac
;
;   Class       			: CPTR-215
;   Language    			: ARM assembly
;   Assembler   			: Keil
;   Target MCU				: NXP LPC-2148
;    
;   Description				: Delay subroutine
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
   AREA delay_subroutine, CODE

   ENTRY

Start
   ldr sp, =stack_start ; Tell where we will place the stack.
                        ; (It goes down (lower addresses from here.)
   ;mov r1, #1           ; Store some numebers in some registers
   ;mov r2, #2
   mov r5, #10

   bl subroutine1

stop b stop

; This subroutine saves the registers,
; messes up the registers locally,
; then restores the registers and returns.
subroutine
   	stmfd sp!, {r4,lr} ; save used registers and the link register (r14)
   
   	ldr r4, =0x0002fffff
loop
	subs r4, r4, #1
	bne loop
   
  	ldmfd sp!, {r4,pc} ; pop the stack and return 

subroutine1
   	stmfd sp!, {lr} ; save used registers and the link register (r14)
    
loop1
	bl subroutine
	subs r5, r5, #1
	bne loop1
   
  	ldmfd sp!, {pc} ; pop the stack and return 
   	END

;---------------------------------------------------------------------------
; DATA
;---------------------------------------------------------------------------

;---------------------------------------------------------------------------
; End of file.