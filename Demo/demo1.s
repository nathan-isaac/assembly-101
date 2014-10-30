;---------------------------------------------------------------------------
;
;   Programmer  			: Larry Aamodt
;
;   File name  				: demo1.s
;   Class       			: CPTR-215
;   Language    			: ARM assembly
;   Assembler   			: Keil
;   Target MCU				: NXP LPC-2148
;   Date Written			: 10/15/09
;   Change history			: 10/28/10  LDA  Updated
;    
;   Description				: Demo program, per textbook program 4.4
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

Main				;MOV	r3, #25
					;MOV	r7, #204
					;ADD	r2, r3, r7

					ldr r7, =0x2f2b8017
					MOVS r4, r7
					;MVNS r4, r7

stop				B	stop		; endless loop at end of program

;---------------------------------------------------------------------------
; DATA
;---------------------------------------------------------------------------
					AREA ram_data, DATA, READWRITE

array1				SPACE	20

					END

;---------------------------------------------------------------------------
; End of file.


