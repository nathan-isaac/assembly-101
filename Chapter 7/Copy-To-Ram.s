   AREA Exaddress, CODE, READONLY
   EXPORT Reset_Handler
Reset_Handler
   LDR R9, =list
   mov R7, #4 ; number in list
   ldr r6, =datastart 
loop
   ldr r8,[r9],#4
   str r8,[r6],#4
   subs r7,r7,#1
   bne loop
 
stop b stop
   ALIGN
list DCW 0x1111, 0x2222, 0x3333, 0x4444, 0x5555
   ALIGN
string DCB "This is a test.",0 ; This string is not used in the copy to ram program
string2 DCB 'T','h','i' ; This string2 is not used in the copy to ram program
   ALIGN
   AREA Thedata, DATA, NOINIT, READWRITE
datastart SPACE 20
 
   END