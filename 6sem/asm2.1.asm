;��������� �������� �� � ������� ������������� � ������������� �����
.MODEL tiny

.CODE                            
org 100h 

_START:	

;���� ����� ��������� �������

	mov	ah,09h
	lea	dx,text1
	int	21h	
    call ReadInteger		;���� � ���������� � �������������� � Integer 
	mov	n,ax				;��������� ����� ��������� �������

	mov ah,09h				;������� ������
	lea dx,crlf
	int 21h
	
	mov ah,09h    			;����� �� ������ �������� �����
	lea dx,resn
	int 21h

    mov ax,n
    call WriteInteger		;�������������� � ������ � ����� �� �������

	mov ah,09h				;������� ������
	lea dx,crlf
	int 21h
	
;���� ������� �� n ���������
	lea	di,array			;����� ������� �������� �������

	mov	ah,09h
	lea	dx,text2
	int	21h
	mov	bx,0	
masi:
    call ReadInteger		;����  � ���������� � �������������� � Integer 
    mov A,ax	

	mov	[di],ax				;��������� ������� �������
	add	di,2				;���������� ������ ���������� �������� �������

	mov ah,09h
	lea dx,crlf
	int 21h
	
	mov ah,09h
	lea dx,res
	int 21h

	mov ah,09h				;������� ������
	lea dx,crlf
	int 21h

	inc	bx
	cmp	bx,n
	jb	masi
	
;����� ������� �� �������
	lea	di,array			;����� ������� �������� �������
	mov	ah,09h
	lea	dx,text3
	int	21h
	mov	bx,0
	
maso:
	mov ax,[di]
	add	di,2				;���������� ������ ���������� �������� �������
    call WriteInteger		;�������������� � ������ � ����� �� �������

	mov ah,09h				;������� ������
	lea dx,crlf
	int 21h

	inc	bx
	cmp	bx,n
	jb	maso

;��������� ��������� � �����
	lea	bp,array
	push bp
	mov	bp,n
	push bp

	call work	;�������� �� �������� ������	

	ret	
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@WORK@WORK@@WORK@@WORK@@WORK@@WORK@@WORK@@WORK@@WORK@@WORK@@WORK@@WORK@@WORK@@WORK@@WORK@@WORK@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

work proc 

    PUSH BP				; ��������� bp
    MOV BP, SP
    PUSH AX				;��������� ��������
    PUSH BX 
    PUSH CX
    PUSH DX
    PUSH SI	
	
	mov	di,[bp+4]
	mov	cx,Di			;������� ���m�� ������� �� �����
	mov	di,[bp+6] 		;������� ����� ������� �� �����
	mov dx,0			;��������� ����������
Pr: 
	MOV AX,[di]			;���������� ������ ������� ������� � AX
	CMP AX,0			;��������� ������������� ����� ��� ���
	JS MINUS			;����� ������������� - ������� �� MINUS
	JNS PLUS			;����� ������������� - ������� �� PLUS
MINUS:	;���� �������������
	CMP DX,0			;������� ����� ���� ����� ������
	JZ L2				;���� ������ ������ ������� �� ��������� �������� - L2
	JS VIHOD_NO			;���� ������ ���� ���� ������������� �� ����� � ��������� "���"
L2:	MOV DX,-1			;������������� ���������� �������� � "-"
	add di,2			;�������� �� �������
	DEC cx				;������� ������ �� �����
	JCXZ VIHOD_YES		;���� ����������� ��� ��� �������� �� ������� � �������� "��"
	JMP Pr				;���� ��� �� ��� �������� ����������� �� ��������� ��������
PLUS:
	CMP DX,0			;��������� ��� ���� ������ "+" ��� "-"
	JZ L1				;���� ������ ������ ������� �� ��������� �������� - L1
	JNS VIHOD_NO		;���� ������ ���� ���� ������������� �� ����� � ��������� "���"
L1:	MOV DX,1			;������������� ���������� �������� � "+"
	add di,2			;�������� �� �������
	DEC cx				;������� ������ �� �����
	JCXZ VIHOD_YES		;���� ����������� ��� ��� �������� �� ������� � �������� "��"
	JMP Pr				;���� ��� �� ��� �������� ����������� �� ��������� ��������

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

VIHOD_YES: 
	MOV AH, 9
	MOV DX, offset YesMessage
	INT 21h
	JMP Finish	     	     	     

VIHOD_NO:  
	XOR AH, AH
	MOV AH, 9
	MOV DX, offset NoMessage
	INT 21h

Finish : 
	POP SI
	POP DX		; ��������������� �������� � ���������� ����������
	POP CX
	POP BX
	POP AX
	MOV SP, BP
	POP BP
	RET	     
	
work EndP 	

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

; ���� 10-����� � ������� AX 
ReadInteger proc  
	push    cx      ; ���������� ���������
	push    bx
 	push    dx 
 	mov     fl,0    ; ���� �������������� �����
 	xor     cx, cx  
 	mov     bx, 10 
  	call    ReadChar  ; ���� ������� �������

 	cmp     al,'-'   ; ���� ����� - ���������� ����
 	je      nnn
	jmp     nn
nnn:
 	mov     fl,1
   
read:
  
 	call    ReadChar   ; ���� ���������� �������
nn: 	cmp     al, 13     ; Enter ?
    	je      done       ; �� -  > ����������
    
    	sub     al, '0'    ; ��� -> ������� ����� char -> int
    	xor     ah, ah  
    	xor     dx, dx   
    	xchg    cx, ax  
    	mul     bx  
    	add     ax, cx  
    	xchg    ax, cx  
    	jmp     read  
done:  
    	xchg    ax, cx  
    	cmp     fl,1
    	je      eee
    	jmp     ee
eee:
    	neg     ax
ee: 
 	pop     dx
    	pop     bx  
    	pop     cx 
    	ret  
ReadInteger endp  

; ���� ������ �������   
ReadChar proc  
    	mov     ah,1 
    	int     21h 
    	ret  
ReadChar endp

; ����� 10-�����
WriteInteger proc near 
    push    ax  
    push    cx  
    push    bx  
    push    dx  
    xor     cx, cx  
    mov     bx, 10  
; ����� �������������?    
    cmp     ax,0
    jl      ddd	; ���� - ��
    jmp     divl	; ���� - ���
; ������� ����� � �������� ����
ddd:
    push    ax
    mov     dl, '-'  
    mov     ah, 2  
    int     21h
    pop     ax
    neg     ax  

; �������� 10-����� � ��������� �� � ����,
; � cx - ���������� ���������� ����
divl:  
    	xor     dx, dx  
    	idiv    bx  
    	push    dx  
    	inc     cx  
    	cmp     ax,0     
    	jg     divl  

; ������� �� �����, ��������� � ��� ASSII  � �������  
popl:  
    	pop     ax  
    	add     al, '0'
  
    	call    WriteChar  
    	loop    popl  

    	pop     dx
   	pop     bx  
    	pop     cx  
   	pop     ax 
    	ret  
WriteInteger endp  

; ����� ������ �������  
WriteChar proc  
    push    ax  
    push    dx  
    mov     dl, al  
    mov     ah, 2  
    int     21h  
    pop     dx  
    pop     ax  
    ret  
WriteChar endp      

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
;@DATA@@DATA@@DATA@@DATA@@DATA@@DATA@@DATA@@DATA@@DATA@@DATA@@DATA@@DATA@@DATA@@DATA@@DATA@@DATA@@DATA@
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

n	dw	10		;n-����� ��������� �������
A	dw	10
fl 	dw 	?		;������������� �����

NoMessage db "No",13,10,"$"
YesMessage db "Yes ",13,10,"$"

text1	db	'Input Size array >  ','$'
text2	db	'Input Array',0dh,0ah,'$'
text3	db	'Output Array',0dh,0ah,'$'

resn	db	'n= ','$'
res	db	'   ','$'
crlf	db	0dh,0ah,'$'

array	dw	50 DUP(?)

end _START
