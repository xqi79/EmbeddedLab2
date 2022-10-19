;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file
            
;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to
                                            ; make it known to linker.
;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory.
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section.
            .retainrefs                     ; And retain any sections that have
                                            ; references to current section.

;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------

;store values the values in R4, R5, R6
		mov.b #0ABC1h, R4
		mov.b #00008h, R5
		mov.b #00012h, R6

;AND operation
		and R6,R4
		and R6,R5

;COMPARE R4 & R6
		cmp R4,R6
		jeq R4EqualToR6 ;label 1
		jne R4NotEqualToR6
		jmp $

R4EqualToR6: ;level 1 definition
		cmp R5,R6
		jeq R5EqualToR6
		jne Or
		jmp $

R5EqualToR6: ;level 2 definition
		mov.w #0ff0h, R9
		jmp $

R4NotEqualToR6:
		cmp R5, R6
		jeq Or
		jmp $

Or:
		mov.w R9, R10
		inv R10;

;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack
            
;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
            
