;---------------------------------------------------------------------------
;
;   Programmer  			: Nathan Isaac
;
;   Class       			: CPTR-215
;   Language    			: ARM assembly
;   Assembler   			: Keil
;   Target MCU				: NXP LPC-2148
;    
;   Description				: Sort a list of 32-bit unsigned numbers into ascending order
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
					
;---------------------------------------------------------------------------
;
;   Programmer  			: Nathan Isaac
;
;   Class       			: CPTR-215
;   Language    			: ARM assembly
;   Assembler   			: Keil
;   Target MCU				: NXP LPC-2148
;    
;   Description				: Sort a list of 32-bit unsigned numbers into ascending order
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
   AREA Subroutine_Example, CODE

   ENTRY
start
	LDR r0, =end_of_list-begin
	MOV r1, #1 ; has changed 
   ldr sp, =stack_start ; Tell where we will place the stack.
                        ; (It goes down (lower addresses from here.)
   mov r1, #1           ; Store some numebers in some registers
   mov r2, #2
   mov r3, #3
   bl subroutine
stop b stop


			
stop	B	stop		; endless loop at end of program

ALIGN
begin
		DCD 0x8fffffff, 0x55555555, 0x44444444, 0x77777777, 0xffffffff
end_of_list	

; This subroutine saves the registers,
; messes up the registers locally,
; then restores the registers and returns.
subroutine
   stmfd sp!, {r1-r2,lr} ; save used registers and the link register (r14)
   mov r1,#0xffffffff    ; mess up the registers
   mov r2, r1
   ldmfd sp!, {r1,r2,pc} ; pop the stack and return 

   END

;---------------------------------------------------------------------------
; End of file.