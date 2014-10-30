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
					
		AREA Sort, CODE
		ENTRY

		LDR r1, =begin ; Set inital pointer
		LDR r2, =begin ; Set counter pointer
		MOV r3, #0 ; Set complete indicator

main_loop
		MOV r3, #0 ; set has changed to false
		LDR r6, [r2], #4 ; Load r6 with begining address and move r2 to the next address OR decrement item count
inner_loop
		
		LDR r6, [r2], #4 ; Load r6 with begining address and move r2 to the next address
		CMP r6, [r1] ; Find out if r6 > inital address pointer
		BGT no_update ; If greater then don't update
		; move r6 value into r1 postion
		; move r1 value into r6 position
		MOV r3, #0 ; Set complete indicator to incomplete
no_update

stop	B	stop		; endless loop at end of program

;---------------------------------------------------------------------------
; DATA
;---------------------------------------------------------------------------

ALIGN
begin
		DCD 0x00000001, 0x00000005, 0x00000002, 0x00000007, 0x00000006
end_list	
		END

;---------------------------------------------------------------------------
; End of file.