;���������� ������� ��� 2 �������� ����� ���������� �� ���� �����  
 	.MODEL tiny
   	.CODE

	org	100h
start:

	mov	nst,0		; nst - ����� �������� � ������
	lea	si,source		;����� ������ ������

	mov	ah,09h
	lea	dx,text1
	int	21h

outstr:	
;���� ���������� �������
	call	ReadChar	;���� ���������� ������ � ����������, ���������� ������ � ������� al
	mov	[si],al		;��������� ������� � ������
	cmp     	al, 13   		;����  Enter ? �� ����������� ���� ������
    	je      	done      		; �� -  > ����������
	add	si,1		;���������� ������ ���������� �������
	inc	nst		;������� ����� ��������� ��������
	jmp	outstr

done:	cmp	nst,0
	je	byby		;���� �� ������� �� ������ ������� �� �� �����
;����� ���������� ������ �� �������
	call	vkps		;��������� ������

	mov	ah,09h
	lea	dx,text2
	int	21h

	mov	n,0		;������������� �������� ��������
	lea	si,source		;�������� ����� ������
	
lab1:	inc	n		;������� ��������
	mov	al,[si]		;������ ������� �� ������
	call	WriteChar	;����� �� ������� ���������� �������
	mov	bx,nst		;�������� ������ ������
	cmp	n,bx		;�������� �� ����� �� ������
	je	lab2		;������ ���������
	add	si,1		;������������ ������ ���������� �������
	jmp	lab1		;������ �� ����� ���������� �������
	
lab2:	call	vkps		;������� ������




;��������� ��������� � �����

	mov	bp,offset source	;lea	bp, source
	push	bp		;��������� � ����� ����� ������
	mov	bp,nst
	push	bp		;��������� � ����� ����� ������

	call	work		;����� ������������ ����������� �������� ���� ������������ � ����� �����

	pop	bp		;������������ ����
	pop	bp		;������������ ����
byby:	ret	

work proc
;���������� ������� ��� �������� ����� ���������� � ���������� �����
	push	bp
	mov	bp,sp		;��������� ��������� �����
	push	ax
	push	bx
	push	si
	push	cx
	
	mov	si,[bp+4]		;� si ���������� ����� ������
	mov	bx,si		;������� ����� �������� � ������ �� �����
	mov	si,[bp+6]		;������� ����� ������ �� �����

	cld			;������ �������� ����� �� �����
	xor	cx,cx		;����� �������� �������� � ������
	mov	nsb,0		;����� �������� ��������� ����
m2:	mov	dl,[si]		;������ ������ ����������� �����
m1:	lodsb			;������ ������� �� ������
	inc	cx		;������� ����� ��������
	cmp	cx,bx		;�������� �� ����� �� ������
	je	m3		;������ ���������
	cmp	al,' '		;�������� �� ������ (�����)
	jne	m1		;�� ������ (����� � ������ �� ����������)
	cmp	dl,[si]		;�������� ������ ����� ����������� ����� � ������ ������ ��������  �����
	jne	m2		;����� �� ����� � ����� ��������� ������ ����� �������� ����� � ��� ���������
	inc	nsb		;����� ��������� � ������� ���������� ���� � �������� ���� 
	jmp	m2		;��������� ������
m3:	
	mov	ah,09h
	lea	dx,text3
	int	21h

	mov	ax,nsb		;��������� ����� ����������� ����������� ������ �� �������
	call	WriteInteger	;����� ����� ����������
	pop	cx
	pop	si
	pop	bx
	pop	ax
	pop	bp
	ret
work endp


WriteChar proc  
;����� ������� �� ������
    	mov     	dl, al  
    	mov     	ah, 2  
    	int     	21h
    	ret  
WriteChar endp 

  

WriteInteger proc near 
    	push    	ax  
    	push    	cx  
    	push    	bx  
    	push    	dx  
    	xor     	cx, cx  
    	mov     	bx, 10  
	; ����� �������������?    
    	cmp     	ax,0
    	jl      	ddd	; ���� - ��
    	jmp     	divl	; ���� - ���
	; ������� ����� � �������� ����
ddd:
    	push    	ax
    	mov     	dl, '-'  
    	mov     	ah, 2  
    	int    	 21h
    	pop     	ax
    	neg     	ax  

	; �������� 10-����� � ��������� �� � ����,
	; � cx - ���������� ���������� ����
divl:  
    	xor     	dx, dx  
    	idiv    	bx  
    	push    	dx  
    	inc     	cx  
    	cmp     	ax,0     
    	jg     	divl  

	; ������� �� �����, ��������� � ��� ASSII  � �������  
popl:  
    	pop     	ax  
    	add     	al, '0'
  
    	call    	WriteChar  
    	loop    	popl  

    	pop     	dx
   	pop     	bx  
    	pop     	cx  
   	pop     	ax 
    	ret  
WriteInteger endp  


ReadChar proc 
; ���� ������ ������� � ����������
	;��������� � (al) 
    	mov     	ah,1 
    	int     	21h
    	ret  
ReadChar endp

vkps proc 
	push	ax
	push	dx	
	mov 	ah,09h		;������� ������
	lea 	dx,crlf
	int 	21h
	int	21h
	pop	dx
	pop	ax
    	ret  
vkps endp


nst	dw	0	;n-����� ��������� � ������
nsb	dw	0	;����� ���������� �������� ����	
n	dw 	0
text1	db	'vvedite stroku >  ','$'
text2	db	'vyvod stroki >  ','$'
text3	db	'chislo sovpadenii >  ','$'
;text4	db	'Input MAX > ','$'
;resn	db	'n= ','$'
;resm	db	'Max= ','$'
;res	db	'   ','$'
crlf	db	0dh,0ah,'$'      ; ������� �������, ������� ������ 
source	db	100 DUP(?) 



end start