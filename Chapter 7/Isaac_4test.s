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
stack_start EQU 0x40001000
   AREA Subroutine_Example, CODE

   ENTRY
; Start copy to RAM
start
   ldr sp, =stack_start ; Tell where we will place the stack.
                        ; (It goes down (lower addresses from here.)
   ldr r9, =begin
   ldr r7, =end_of_list
   ldr r6, =datastart

loop
   ldr r8, [r9], #4
   str r8, [r6], #4
   cmp r9, r7
   bne loop
; End copy to RAM
   
start_sort
   ldr r5, =(end_ram - 4)
loop_sort_outer ; r2 is our counter, it goes from 1 to item_count
   mov r1, #1 ; has_changed = false (0 is true)
   ldr r2, =datastart ; start of data in ram goes into r2
loop_sort_inner 
   ldr r3, [r2], #4
   ldr r4, [r2], #0
   cmp r3, r4
   blhi subroutine_swap ; swaps the last two and set has_changed
   cmp r3, r5
   bne loop_sort_inner
   sub r5, r5, #4 ; the last item is in order, so we don't need to check it again
   cmp r1, #1
   bne loop_sort_outer
stop 
   b stop
   
subroutine_swap ; swaps the contens of the addresses held in r2 and r2 - 4 (the previous address)
               ; has_changed is r1 ans it sets it to 0 (true)
   stmfd sp!, {r2,r3,r4, lr}

   mov r1, #0 ; setting the has_changed to true
   ldr r0, [r2], #-4 ; swapping data
   ldr r3, [r2]
   str r0, [r2], #4
   str r3, [r2]

   ldmfd sp!, {r2,r3,r4, pc}

   ALIGN
begin
		DCD 0x8fffffff, 0x55555555, 0x44444444, 0x77777777, 0xffffffff
end_of_list	
	
	AREA Thedata, DATA, NOINIT, READWRITE
datastart   SPACE 20

   END

;---------------------------------------------------------------------------
; End of file.