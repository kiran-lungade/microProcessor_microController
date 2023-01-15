;NAME:: LUNGADE KIRAN SANJAY
;ROLL NO:: 39
;BATCH:: S2


;ALP in 8085 to ntransfer a block of 16 bytes from internal data memory 40H to 50H

	org 0x0000
	ljmp start

	org 0x100
	start: 	MOV R0,#0x40 ;pointer at block 1
			MOV R1,#0x50 ;pointer at block 2
			MOV R3,#0x10 ;counter

	BACK: MOV a,@R0
		MOV @R1,a
		INC R0
		INC R1
		DJNZ R3,back
		nop
	
	here: sjmp here
		end



;ALP in 8085 to ntransfer a block of 16 bytes from internal data memory 40H to 50H

	org 0x0000
	ljmp start

	org 0x100
	start: 	MOV R0,#0x40 ;pointer at block 1
			MOV dptr,#0x1000 ;pointer at block 2
			MOV R3,#0x10 ;counter

	BACK: MOV a,@R0
		MOVX @ dptr,a
		INC R0
		INC dptr
		DJNZ R3,back
		nop

	here: sjmp here
		end