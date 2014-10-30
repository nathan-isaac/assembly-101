;---------------------------------------------------------------------------
;
;   Programmer  			: Nathan Isaac
;
;   File name  				: add.s
;   Class       			: CPTR-215
;   Language    			: ARM assembly
;   Assembler   			: Keil
;   Target MCU				: NXP LPC-2148
;   Date Written			: 10/09/2014
;   Change history			: 10/09/2014
;    
;   Description				: Demo program, to add two numbers together
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
						

;---------------------------------------------------------------------------
; CODE 
;---------------------------------------------------------------------------
					AREA  myprogram, CODE, READONLY
					ENTRY
					EXPORT reset_handler

reset_handler 

Main				MOV	r3, #25
					MOV	r7, #204
					ADD	r2, r3, r7

stop				B	stop		; endless loop at end of program

;---------------------------------------------------------------------------
; DATA
;---------------------------------------------------------------------------



;---------------------------------------------------------------------------
; End of file.


