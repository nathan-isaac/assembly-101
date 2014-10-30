;---------------------------------------------------------------------------
;
;   Programmer	: Larry Aamodt
;
;   File name		: shell.s 
;   Class				: CPTR-215
;   Language		: ARM assembly
;   Assembler		: Keil
;   Target MCU	: NXP LPC-2148
;   Date Written	: 10/15/09
;    change history:  10/28/10  LDA  Updated
;    
;   Description	: Shell for your program to be run via simulation
;
;   Inputs			:
;   
;   Outputs			:
;
;   Special     		:  
;  requirements
;   
;
; 	NOTES: 
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

Main
					; put your program here

stop	B			stop

;---------------------------------------------------------------------------
; DATA
;---------------------------------------------------------------------------
					AREA ram_data, DATA, READWRITE

array1			SPACE	20

					END

;---------------------------------------------------------------------------
; End of file.


