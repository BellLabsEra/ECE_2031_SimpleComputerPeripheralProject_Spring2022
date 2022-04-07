; Mode1Test.asm
; Sets the neoPixel mode to 1 (all pixels, 16-bit color). 
; Tests functionality of allpx using cycling colors.

ORG 0

	LOADI	1
	OUT		PXL_M				; Set mode to allPx
    LOADI	3
    OUT		PXL_A				; set pixel address to 3 (4th pixel)
	
Loop:	; infinite loop - add colors, waiting a half second between each
    LOAD	Red
	OUT		PXL_D
	CALL	Delay
	
	LOAD	Blue
	OUT		PXL_D
	CALL	Delay
	
	LOAD	Green
	OUT		PXL_D
	CALL	Delay
	
    JUMP	Loop

; To make things happen on a human timescale, the timer is
; used to delay for half a second.
Delay:
	OUT    Timer
WaitingLoop:
	IN     Timer
	ADDI   -5
	JNEG   WaitingLoop
	RETURN


; Some variables

; Some constants
Red:		DW  &B0001100000000000
Green:		DW  &B0000000001100000
Blue:		DW  &B0000000000000011
; IO address constants
Switches:	EQU 000
LEDs:		EQU 001
Timer:		EQU 002
Hex0:		EQU 004
Hex1:		EQU 005
PXL_A:		EQU &H0B0
PXL_D:    	EQU &H0B1
PXL_M:		EQU &H0B2