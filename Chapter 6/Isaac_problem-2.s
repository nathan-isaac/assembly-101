;---------------------------------------------------------------------------
;
;   Programmer  			: Nathan Isaac
;
;   File name  				: Problem-2.s
;   Class       			: CPTR-215
;   Language    			: ARM assembly
;   Assembler   			: Keil
;   Target MCU				: NXP LPC-2148
;   Date Written			: 
;   Change history			: 
;    
;   Description				: Find the smallest number
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

X EQU 1000
Y EQU 5000
Z EQU 9000						

;---------------------------------------------------------------------------
; CODE 
;---------------------------------------------------------------------------
					

	AREA LongLoop, CODE
	ENTRY
			LDR R1, = X			; load a number to R1 Register
			LDR R2, = Y			; load a number to R2 Register
			LDR R3, = Z			; load a number to R3 Register
	    
			SUBS R4, R1, R2 	; Compute x - y so carry is clear if y > x
								; REMINDER: inverse of bower to cary flag
			BCS Y_smaller 		; skip setting temp - x if y smaller (or =)
			MOV R0, R1  		; set temp = x as x is smaller
			
			B Compare_next 				; branch to the output point

Y_smaller 	MOV R0, R2			; Set temp = y

Compare_next 

			SUBS R5, R3, R0
			BCS X_smaller
			MOV R0, R3

			B stop

X_smaller 	MOV R0, R0
			
stop		B	stop		; endless loop at end of program

;---------------------------------------------------------------------------
; DATA
;---------------------------------------------------------------------------

		END

;---------------------------------------------------------------------------
; End of file.


