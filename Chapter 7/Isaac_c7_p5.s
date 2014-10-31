;---------------------------------------------------------------------------
;
;   Programmer  			: Nathan Isaac
;
;   Class       			: CPTR-215
;   Language    			: ARM assembly
;   Assembler   			: Keil
;   Target MCU				: NXP LPC-2148
;    
;   Description				: Copy null terminated string
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
					
		AREA Sort, CODE
		ENTRY

		ldr r0, =begin
loop
	ldr r4,[r0], #1		
			
stop	B	stop		; endless loop at end of program

;---------------------------------------------------------------------------
; DATA
;---------------------------------------------------------------------------

ALIGN
begin
		DCB "Hello world", 0
end_string	
		END

;---------------------------------------------------------------------------
; End of file.