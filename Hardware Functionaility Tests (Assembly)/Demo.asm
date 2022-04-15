; Demo.asm
;
; Demonstrates various functionalities of NeoPixelController.vhdl

ORG 0

Main:
	LOADI	0
	OUT		PXL_ALL
	CALL	Delay
	
	IN		Switches
	
	JZERO	DefaultModeSetup
	ADDI	-1
	JZERO	Bit24ModeSetup
	ADDI	-1
	JZERO	AutoIncSetup
	ADDI	-1
	JZERO	AllPixSetup
	ADDI	-1
	JZERO	HoldTest
	ADDI	-1
	JZERO	AutoInc24Setup
	
	JUMP	Main
	
	
DefaultModeSetup:
	LOADI	0
	OUT		PXL_R
	OUT		PXL_M
DefaultMode:
	LOADI	5
    OUT		PXL_A				; set pixel address to 5 (6th pixel)
	
    LOAD	Red
	OUT		PXL_D
	CALL	Delay				; display red
	
	LOADI	5
    OUT		PXL_A				; (reset pixel address)
	
	LOAD	Blue
	OUT		PXL_D
	CALL	Delay				; display blue
	
	LOADI	5
    OUT		PXL_A				; (reset pixel address)
	
	LOAD	Green
	OUT		PXL_D
	CALL	Delay				; display green
	
	
	IN		Switches
	ADDI	0
	JZERO	DefaultMode
	JUMP 	Main				; jump back to main if switches changed
	
	
Bit24ModeSetup:
	LOADI	1
	OUT		PXL_M				; set mode
Bit24Mode:
	LOADI	0					; load pixel 0 (1st pixel)
	OUT		PXL_R
	OUT		PXL_A
	; RED
	LOAD	Byte
	OUT		PXL_D				; (red)
	LOADI	0
	OUT		PXL_D				; (green)
	OUT		PXL_D				; (blue)
	CALL	Delay
	
	LOADI	0					; load pixel 0 (1st pixel)
	OUT		PXL_A
	; PURPLE
	LOAD	Byte
	OUT		PXL_D				; (red)
	LOADI	0
	OUT		PXL_D				; (green)
	LOAD	Byte
	OUT		PXL_D				; (blue)
	CALL	Delay
	
	LOADI	0					; load pixel 0 (1st pixel)
	OUT		PXL_A
	; BLUE
	LOADI	0
	OUT		PXL_D				; (red)
	OUT		PXL_D				; (green)
	LOAD	Byte
	OUT		PXL_D				; (blue)
	CALL	Delay
	
	LOADI	0					; load pixel 0 (1st pixel)
	OUT		PXL_A
	; TEAL
	LOADI	0
	OUT		PXL_D				; (red)
	LOAD	Byte
	OUT		PXL_D				; (green)
	OUT		PXL_D				; (blue)
	CALL	Delay
	
	LOADI	0					; load pixel 0 (1st pixel)
	OUT		PXL_A
	; GREEN
	LOADI	0
	OUT		PXL_D				; (red)
	LOAD	Byte
	OUT		PXL_D				; (green)
	LOADI	0
	OUT		PXL_D				; (blue)
	CALL	Delay
	
	LOADI	0					; load pixel 0 (1st pixel)
	OUT		PXL_A
	; YELLOW
	LOAD	Byte
	OUT		PXL_D				; (red)
	OUT		PXL_D				; (green)
	LOADI	0
	OUT		PXL_D				; (blue)
	CALL	Delay

	IN		Switches
	ADDI	-1
	JZERO	Bit24Mode
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
	ADDI	-2
	JZERO	AutoInc
	JUMP 	Main				; jump back to main if switches changed
	
	
AllPixSetup:
	LOADI	0
	OUT		PXL_R
AllPix:
	LOAD 	Red
	OUT		PXL_ALL
	CALL 	Delay
	
	LOAD	Blue
	OUT		PXL_ALL
	CALL	Delay
	
	LOAD	Green
	OUT		PXL_ALL
	CALL	Delay

	IN		Switches
	ADDI	-3
	JZERO	AllPix
	JUMP 	Main				; jump back to main if switches changed


HoldTest:
	LOAD	Blue
	OUT		PXL_ALL				; set all pixels to blue
	CALL	Delay
	LOADI 	1
	OUT		PXL_R				; Set refresh state to hold
	LOAD	Green
	OUT		PXL_ALL				; Should never see green
	CALL	Delay
	LOAD	Red
	OUT		PXL_ALL				; set pixels to red (can't see yet)
	CALL	Delay
	LOADI	0
	OUT		PXL_R				; reveal red pixels
	CALL	Delay

	IN		Switches
	ADDI	-4
	JZERO	HoldTest
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

	IN		Switches
	ADDI	-5
	JZERO	AutoInc24
	JUMP 	Main				; jump back to main if switches changed






; To make things happen on a human timescale, the timer is
; used to delay for half a second.
Delay:
	OUT    Timer
WaitingLoop:
	IN     Timer
	ADDI   -5
	JNEG   WaitingLoop
	RETURN
	
	
QuickDelay:
	OUT    Timer
QuickWaitingLoop:
	IN     Timer
	ADDI   -1
	JNEG   QuickWaitingLoop
	RETURN

; Some variables

; Some constants
Red:		DW  &B0001100000000000
Green:		DW  &B0000000001100000
Blue:		DW  &B0000000000000011
Byte:		DW  &B00000100
; IO address constants
Switches:	EQU 000
LEDs:		EQU 001
Timer:		EQU 002
Hex0:		EQU 004
Hex1:		EQU 005
PXL_A:		EQU &H0B0
PXL_D:    	EQU &H0B1
PXL_M:		EQU &H0B2
PXL_R:		EQU &H0B3
PXL_ALL:	EQU &H0B4
