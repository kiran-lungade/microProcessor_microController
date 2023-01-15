;Name : Lungade Kiran Sanjay
;Roll no: 39
;Batch: S2
;Subject: MPMCL 6

;Program to generate a square wave of 50Hz frequency on pin P2.3

	org 0x0000
		LJMP Start

		org 0x0100

	Start: MOV TMOD,#10H ;timer1
					;mode1

	Again: MOV TL1,#00
 		MOV TH1,#0DCH
 		SETB TR1

	Back: JNB TF1,Back
 		CLR TR1
 		CPL P2.3
 		CLR TF1
 		SJMP Again
 
 	END