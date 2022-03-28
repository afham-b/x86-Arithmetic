; main.asm - Assembly language source file
; Author: Afham Bashir 
; Date:   02/12/2021
; Description:

.386
.model flat,stdcall
.stack 1000h

.data
	var1 sdword 15    ;long var1 15
	var2 sdword 0ah   ;long var2 0x0A 
	var3 sdword -7    ;long var3 -7
	var4 sdword ?     ;long var4 uninitialized
	 
	var5 sword -21    ;short var5 -21
	var6 sword 31h    ;short var6 0x31
	var7 sword 1	  ;short var7 1 
	var8 sword ?      ;short var8 uninitialized

	var9 byte "d",0   ;char var9 'd' 


.code
main PROC		; main procedure, entry point

;var3 += var1; // var3: 8
	mov ebx,var3
	add ebx,var1
	mov var3,ebx 

;var4 = (var3 - var2) + var1;
	mov ebx,var3
	sub ebx,var2
	add ebx,var1
	mov var4,ebx

;var1 = --var3 - ++var2;
	dec var3
	inc var2
	mov ebx,var3
	sub ebx,var2
	mov var1,ebx

;var5 +=20; 
	mov ax,var5
	add ax,20 
	mov var5,ax

;var8 = (var5 - var6) + (var7 - 2);
	dec var7
	dec var7
	mov ax,var5
	sub ax,var6
	add ax,var7
	mov var8,ax
	inc var7
	inc var7

;var1 += var6
	mov ebx,0
	mov bx,var6
	mov eax,var1
	add eax,ebx
	mov var1,eax 

;var9 -= 0x20
	mov ah,var9
	sub ah,20h
	mov var9,ah

	ret			; end the program
main ENDP
END
