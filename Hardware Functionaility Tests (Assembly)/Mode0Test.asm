; Mode0Test.asm
; Sets the neoPixel mode to 0 (individual 16-bit color). 
; Tests functionality of ind16 using the FPGA switches.

ORG 0

	LOADI	0
	OUT		PXL_M				; Set mode to ind16
	
Loop:							; infinite loop - read switches & display
    LOADI	5
    OUT		PXL_A				; set pixel address to 5 (6th pixel)
	
    IN		Switches
	STORE	Pattern
	AND		RedBits
	SHIFT	5
	STORE	Red
	
	LOAD	Pattern
	AND 	GreenBits
	SHIFT	2
	STORE	Green
	
	LOAD	Pattern
	AND		BlueBits
	OR		Green
	OR		Red
    OUT		PXL_D
    JUMP	Loop

; Some variables
Pattern:	DW	0
Red:		DW	0
Green:		DW	0
; Some constants
RedBits:	DW  &B111000000
GreenBits:	DW  &B000111000
BlueBits:	DW  &B000000111
; IO address constants
Switches:	EQU 000
LEDs:		EQU 001
Timer:		EQU 002
Hex0:		EQU 004
Hex1:		EQU 005
PXL_A:		EQU &H0B0
PXL_D:    	EQU &H0B1
PXL_M:		EQU &H0B2