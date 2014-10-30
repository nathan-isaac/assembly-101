;---------------------------------------------------------------------------
;
;   Programmer  			: Nathan Isaac
;
;   File name  				: Problem-5.s
;   Class       			: CPTR-215
;   Language    			: ARM assembly
;   Assembler   			: Keil
;   Target MCU				: NXP LPC-2148
;   Date Written			: 
;   Change history			: 
;    
;   Description				: Divide two numbers
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
; 
;
;---------------------------------------------------------------------------


;---------------------------------------------------------------------------
; EQUATES
;---------------------------------------------------------------------------

DIVIDEND EQU 0x0f0f0f0f 
DIVISOR EQU 0x00000000						

;---------------------------------------------------------------------------
; CODE 
;---------------------------------------------------------------------------
					
			AREA  divide, CODE, READONLY
			ENTRY
			
			LDR r6, = DIVIDEND
			LDR r7, = DIVISOR

			MOV	r7, r7			; is divisor zero ?
			BEQ stop	 	; put suitiable actions at somewhere if divisor zero
			MOV r5, #0		 	; set a counter
sub_loop	ADD r5, r5, #1	   	; count times subtracted
			SUBS r6, r6, r7		; set divisor = divisor - dividend
			BPL sub_loop		; loop if divisor still positive
			ADD r6, r6, r7		; restore remainder left in r6
			SUB r5, r5, #1		; correct quotient

					

stop		B	stop		; endless loop at end of program

;---------------------------------------------------------------------------
; DATA
;---------------------------------------------------------------------------

			END

;---------------------------------------------------------------------------
; End of file.


