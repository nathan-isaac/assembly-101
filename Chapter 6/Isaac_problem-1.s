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

VAL1A EQU 0xffffffff
VAL1B EQU 0x0000000f
VAL2A EQU 0x00000001
VAL2B EQU 0x00000001						

;---------------------------------------------------------------------------
; CODE 
;---------------------------------------------------------------------------
					

		AREA LongAdd, CODE
		ENTRY
			ldr R0, = VAL1A
			ldr R1, = VAL1B
			ldr R2, = VAL2A
			ldr R3, = VAL2B
			subs R8,R0,R1
			sbcs R9,R1,R3				
			
stop		B	stop		; endless loop at end of program

;---------------------------------------------------------------------------
; DATA
;---------------------------------------------------------------------------

		END

;---------------------------------------------------------------------------
; End of file.


