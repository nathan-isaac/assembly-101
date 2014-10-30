;---------------------------------------------------------------------------
;
;   Programmer  			: Nathan Isaac
;
;   File name  				: Problem-4.s
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

X EQU 1000
Y EQU 5000						

;---------------------------------------------------------------------------
; CODE 
;---------------------------------------------------------------------------
					

		AREA LongLoop, CODE
		ENTRY
			LDR R1, = X
			LDR R2, = Y

loop1		
	
loop2
			subs R2, #1
			BNE loop2

			LDR R2, = Y

			subs R1, #1
			BNE loop1
			
			MOV R3, #5				
			
stop		B	stop		; endless loop at end of program

;---------------------------------------------------------------------------
; DATA
;---------------------------------------------------------------------------

		END

;---------------------------------------------------------------------------
; End of file.


