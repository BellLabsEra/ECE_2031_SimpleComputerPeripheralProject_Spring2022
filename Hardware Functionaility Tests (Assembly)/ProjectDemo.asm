; ProjectDemo.asm
;
; Demonstrates various functionalities of NeoPixelController.vhdl
; for use in the project demo

ORG 0

Main:
	LOADI	0
	OUT		PXL_M
	OUT		SLEEP
	CALL	Delay
	CALL	Delay
	CALL	Delay
	
	IN		Switches
	AND		ValidPx
	
	JZERO	Default
	SHIFT	-1
	JZERO	HoldSetup
	SHIFT	-1
	JZERO	AutoInc24Setup
	SHIFT	-1
	JZERO	BrightCompare
	SHIFT	-1
	JZERO	AutoIncSetup

	JUMP	Main


; Display specific pattern (showcases ind 16)
Default:
	LOADI	0
	OUT		PXL_M
	OUT		PXL_R
	OUT		PXL_A
	
	LOAD	Blue
	OUT		PXL_ALL
	CALL	Delay
	
	LOADI	35
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	36
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	37
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	39
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	40
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	41
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	43
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	44
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	45
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	47
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	48
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	49
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	51
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	52
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	53
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	55
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	56
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	57
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	59
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	60
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	61
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	67
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	70
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	74
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	76
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	80
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	84
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	88
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	92
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	99
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	100
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	103
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	107
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	108
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	111
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	112
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	113
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	115
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	117
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	119
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	120
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	121
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	124
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	131
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	134
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	138
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	140
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	142
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	148
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	152
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	156
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	163
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	164
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	165
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	167
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	168
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	169
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	171
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	172
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	173
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	175
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	176
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	177
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	179
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	180
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	181
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	183
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	184
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	185
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	187
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay
	
	LOADI	188
	OUT		PXL_A
	LOAD	Red
	OUT		PXL_D
	
	CALL	Delay
	CALL	Delay
	CALL	Delay
	CALL	Delay
	CALL	Delay
	CALL	Delay
	
	IN		Switches
	AND		ValidPx
	JZERO	Default				; loop again if switches NOT changed
	JUMP 	Main				; jump back to main if switches changed


; (showcases refresh modes, pxl_all)
HoldSetup:
	LOADI	0
	OUT		PXL_M
Hold:
	IN		Switches
	SHIFT	-9
	OUT		PXL_R
	
	CALL	Delay
	LOAD	Red
	OUT		PXL_ALL
	CALL	Delay
	
	IN		Switches
	SHIFT	-9
	OUT		PXL_R
	
	CALL	Delay
	LOAD	Blue
	OUT		PXL_ALL
	CALL	Delay
	
	IN		Switches
	SHIFT	-9
	OUT		PXL_R
	
	CALL	Delay
	LOAD	Green
	OUT		PXL_ALL
	CALL	Delay
	
	IN		Switches
	AND		ValidPx
	JZERO	Main
	SHIFT	-1
	JZERO	Hold				; loop again if switches NOT changed
	JUMP 	Main				; jump back to main if switches changed



AutoInc24Setup:
	LOADI	0
	OUT		PXL_A
	OUT		PXL_R
	LOADI	1
	OUT		PXL_M
AutoInc24:
	; RED
	LOAD	Byte
	OUT		PXL_D				; (red)
	LOADI	0
	OUT		PXL_D				; (green)
	OUT		PXL_D				; (blue)
	CALL	QuickDelay
	
	; PURPLE
	LOAD	Byte
	OUT		PXL_D				; (red)
	LOADI	0
	OUT		PXL_D				; (green)
	LOAD	Byte
	OUT		PXL_D				; (blue)
	CALL	QuickDelay
	
	; BLUE
	LOADI	0
	OUT		PXL_D				; (red)
	OUT		PXL_D				; (green)
	LOAD	Byte
	OUT		PXL_D				; (blue)
	CALL	QuickDelay
	
	; TEAL
	LOADI	0
	OUT		PXL_D				; (red)
	LOAD	Byte
	OUT		PXL_D				; (green)
	OUT		PXL_D				; (blue)
	CALL	QuickDelay
	
	; GREEN
	LOADI	0
	OUT		PXL_D				; (red)
	LOAD	Byte
	OUT		PXL_D				; (green)
	LOADI	0
	OUT		PXL_D				; (blue)
	CALL	QuickDelay
	
	; YELLOW
	LOAD	Byte
	OUT		PXL_D				; (red)
	OUT		PXL_D				; (green)
	LOADI	0
	OUT		PXL_D				; (blue)
	CALL	QuickDelay

	; (DONE)
	IN		Switches
	AND		ValidPx
	JZERO	Main
	SHIFT	-1
	JZERO	Main
	SHIFT	-1
	JZERO	AutoInc24			; loop again if switches NOT changed
	JUMP 	Main				; jump back to main if switches changed


; Definitive showcase of 16 vs 24 bit colors. Beware eye damage
BrightCompare:
	LOADI	0
	OUT		PXL_R
	OUT		PXL_A
	OUT		PXL_M
	
	; max 16 bit
	LOAD	MaxRed
	OUT		PXL_D
	CALL	QuickDelay
	LOAD	MaxGreen
	OUT		PXL_D
	CALL	QuickDelay
	LOAD	MaxBlue
	OUT		PXL_D
	CALL	QuickDelay
	LOAD	MaxWhite
	OUT		PXL_D
	CALL	QuickDelay
	
	; max 24 bit
	LOADI	1
	OUT		PXL_M
	; (max red)
	LOAD	MaxByte
	OUT		PXL_D
	LOADI	0
	OUT		PXL_D
	OUT		PXL_D
	CALL	QuickDelay
	; (max green)
	LOADI	0
	OUT		PXL_D
	LOAD	MaxByte
	OUT		PXL_D
	LOADI	0
	OUT		PXL_D
	CALL	QuickDelay
	; (max blue)
	LOADI	0
	OUT		PXL_D
	OUT		PXL_D
	LOAD	MaxByte
	OUT		PXL_D
	CALL	QuickDelay
	; (max white)
	LOAD	MaxByte
	OUT		PXL_D
	OUT		PXL_D
	OUT		PXL_D
	CALL	QuickDelay

	IN		Switches
	AND		ValidPx
	JZERO	Main
	SHIFT	-1
	JZERO	Main
	SHIFT	-1
	JZERO	Main
	SHIFT	-1
	JZERO	BrightCompare		; loop again if switches NOT changed
	JUMP 	Main				; jump back to main if switches changed


AutoIncSetup:
	LOADI	0
	OUT		PXL_A
	OUT		PXL_R
	OUT		PXL_M
AutoInc:
    LOAD	Red
	OUT		PXL_D
	CALL	QuickDelay				; display red
	
	LOAD	Blue
	OUT		PXL_D
	CALL	QuickDelay				; display blue
	
	LOAD	Green
	OUT		PXL_D
	CALL	QuickDelay				; display green
	
	IN		Switches
	AND		ValidPx
	JZERO	Main
	SHIFT	-1
	JZERO	Main
	SHIFT	-1
	JZERO	Main
	SHIFT	-1
	JZERO	Main
	SHIFT	-1
	JZERO	AutoInc
	JUMP 	Main					; jump back to main if switches changed


; To make things happen on a human timescale, the timer is
; used to delay for half a second.
Delay:
	OUT    Timer
WaitingLoop:
	IN     Timer
	ADDI   -5
	JNEG   WaitingLoop
	RETURN
	
; To make things happen on a human timescale, the timer is
; used to delay a tenth of a second.
QuickDelay:
	OUT    Timer
QuickWaitingLoop:
	IN     Timer
	ADDI   -1
	JNEG   QuickWaitingLoop
	RETURN

; To make things happen on a human timescale, the timer is
; used to delay 8/10 of a second.
LongDelay:
	OUT    Timer
LongWaitingLoop:
	IN     Timer
	ADDI   -8
	JNEG   LongWaitingLoop
	RETURN

; Some variables

; Some constants
Red:		DW  &B0001100000000000
Green:		DW  &B0000000001100000
Blue:		DW  &B0000000000000011
MaxRed:		DW	&B1111100000000000
MaxGreen:	DW	&B0000011111100000
MaxBlue:	DW	&B0000000000011111
MaxWhite:	DW	&B1111111111111111
Byte:		DW  &B00000100
MaxByte:	DW	&B11111111
ValidPx:	DW	&B0000000000111111	; max 6 tests
; IO address constants
Switches:	EQU 000
LEDs:		EQU 001
Timer:		EQU 002
Hex0:		EQU 004
Hex1:		EQU 005
PXL_A:		EQU &H0B0	; Pixel Address
PXL_D:    	EQU &H0B1	; Pixel Data
PXL_M:		EQU &H0B2	; Pixel Mode		(
PXL_R:		EQU &H0B3	; Pixel Refresh		(Changes refresh mode)
PXL_ALL:	EQU &H0B4	; Pixel All			(sets all pixels to OUT color)
SLEEP:		EQU	&H0B5	; Sleep dimming effect
