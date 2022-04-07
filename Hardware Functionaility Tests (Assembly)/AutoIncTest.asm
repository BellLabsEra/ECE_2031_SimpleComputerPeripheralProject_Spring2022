; AutoIncTest.asm
; Tests functionality of Auto Increment Feature in mode 0.

ORG 0

	LOADI	0
	OUT		PXL_M				; Set mode to ind16
    OUT		PXL_A				; set pixel address to 0 (1st pixel)
	
Loop:	; infinite loop - add colors, waiting a half secomd between each
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