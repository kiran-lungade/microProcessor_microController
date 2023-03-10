 ;PROGRAM FOR ENCRYPTION AND DECRYPTION OF FILES
 ;BY LUNGADE KIRAN SANJAY
 ;BATCH:: S2
 ;ROLL NO.:: 39
 ;INCLUDE MACRO.ASM
 
DATASEG1 SEGMENT
 IFN DB 'SAMPLE.TXT',0
 OFN DB 'SAMPLE1.TXT',0
 IFHANDLE DW 0
 OFHANDLE DW 0
 IFBUFFER DB 0
 OFBUFFER DB 0
 KEY DB 1
 
DATASEG1 ENDS
CODESEG1 SEGMENT
 	ASSUME DS:DATASEG1,CS:CODESEG1
BEGIN:	 MOV AX,DATASEG1
		 MOV DS,AX
 
 ;1 OPEN INPUT FILE
 	MOV AH,3DH
 	MOV DX,OFFSET IFN
 	MOV AL,00H
 	INT 21H
 	MOV IFHANDLE,AX
 	JC FILE_ERROR
 
 ;2. OPEN OUTPUT FILE
 	MOV AH,3CH
 	MOV DX,OFFSET OFN
 	MOV CX,00H
 	INT 21H
	MOV OFHANDLE,AX
 
 
BACK: ;3. READ A CHARACTER 
 	MOV AH,3FH
 	MOV CX,0001H
 	MOV DX,OFFSET IFBUFFER
	MOV BX,IFHANDLE
 	INT 21H
 	JC FILE_ERROR
 
 ;4. ENCRYPT/DECRYPT
 	MOV AL,IFBUFFER
 	MOV OFBUFFER,AL
	MOV AL,KEY
 	ADD OFBUFFER,AL
 
 ;5. DISPLAY THE CHARACTER
	MOV AH,02H
 	MOV DL,OFBUFFER
 	INT 21H
 
 ;6. WRITE THE CHARACTER IN OUTPUT FILE
 	MOV AH,40H
 	MOV CX,0001H
 	MOV BX,OFHANDLE
 	MOV DX,OFFSET OFBUFFER
 	INT 21H
	JC FILE_ERROR
 
 ;7. IF NOT END OF FILE REPEAT STEP 3
 	CMP IFBUFFER,0AH
 	JNZ BACK
 
 ;8. CLOSE INPUT FILE
 	MOV AH,3EH
	MOV BX,IFHANDLE
 	INT 21H
 
 ;9. CLOSE OUTPUT FILE
 	MOV AH,3EH
	MOV BX,OFHANDLE
 	INT 21H
 
FILE_ERROR:
 	MOV AX,4C00H
 	INT 21H

CODESEG1 ENDS
 	END BEGIN 