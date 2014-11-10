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

PINSEL0 	EQU 0xE002C000
IOPIN		EQU 0xE0028000
off_DIR 	EQU 0x8
En_RxTx0	EQU 0x5
En_RxTx1	EQU 0x50000
U0_bas		EQU 0xE000C000
U1_bas		EQU 0xE0010000
Off_LCR		EQU 0x0C
Off_LSR		EQU 0x14
S_fmt		EQU 0x83
S_fmt2		EQU 0x3
Speed		EQU 97

;---------------------------------------------------------------------------
; CODE 
;---------------------------------------------------------------------------
					
;stack_start EQU 0x40001000
   AREA RESET, CODE, READONLY

   ENTRY
   EXPORT __main

__main
	
  	BL output_string

stop 
	B stop


output_string
   	stmfd sp!, {r3, r2, lr}
	
	BL set_U0

	LDR r3,=begin	; load the end address of the code & initialize it as the pointer.
	LDR r2,=end_string	; load the beginning address of the code. 

loop
	LDR 	r0, [r3, #4]
	BL 		Char_Out0
	cmp 	r3, r2      ;  are we at the end yet
	bne 	loop       ; if r7 != 0 then keep looping
   
  	ldmfd sp!, {r3, r2, pc} ; pop the stack and return



set_U0
	stmfd sp!, {lr} 
	
	LDR 	r2, =En_RxTx0
	LDR 	r1, =PINSEL0
	LDR 	r0, [r1]
	ORR 	r0, r0, r2
	STR 	r0, [r1]
	LDR 	r1, =U0_bas
	MOV 	r0, #S_fmt
	STRB 	r0, [r1, #Off_LCR]
	MOV 	r0, #97
	STRB 	r0, [r1]
	MOV 	r0, #S_fmt2
	STRB 	r0, [r1, #Off_LCR]
	
	ldmfd sp!, {pc}
	

Char_Out0
	stmfd sp!, {lr}
	
	LDR		r1, =U0_bas
wt_rdy0	
	LDRB 	r2, [r1, #Off_LSR]
	TST		r2, #0x20
	BEQ		wt_rdy0
	AND 	r0, r0, #0xFF
	STRB	r0, [r1]
	
	ldmfd sp!, {pc}	


	
Char_In0
	stmfd sp!, {lr}
	
	LDR		r1, =U0_bas
wt_rcd0	
	LDRB 	r2, [r1, #Off_LSR]
	TST		r2, #0x1
	BEQ		wt_rcd0
	LDRB r0, [r1]
	
	ldmfd sp!, {pc}	

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