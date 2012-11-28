; ��������� ���������� ����, � ������� ����������� 2 ����� ������� ���������� �����
org 100h

.MODEL tiny
Number		=	12 
start:     
    ; ���� ��������� �������
	mov ah,09h
	lea dx,Input_str
	int 21h  
	
    xor cx,cx
    xor si,si

input:		
	call ReadChar 
	mov [Mas+si],al		
	cmp al,13
	je continue_input     
	inc si  
loop input

continue_input:
    mov [Mas+si],' '; ������ �� Mas ������
    inc si   
    mov [Mas+si],'$'
    call Enter             
    
    ; ����� "���������:"
    mov ah,09h
    lea dx,Res
    int 21h   
    
    ; ����� �������� ��������� � ����������� ���������� � ����   
    lea di, Mas; �������� ������
    push di    
    call check ; ����� ���������       
    int 20h; ������� � ��
 
;;;;;;;;;;;;;;;;;;;;; �������� ��������� ;;;;;;;;;;;;;;;;;;;;;;;
CHECK PROC  
    push bp  
    
    mov bp,sp  
    mov  si, [bp+4] ;������
	      
	PUSH	AX		; ��������� ��������
	PUSH	CX		;
	PUSH	BX		;
	PUSH	DX		;
	PUSH	SI		;
	PUSH	DI		; 
	
	xor cx,cx             ; �������� ������� ��������� ���������� ����
	mov bl, [si]              
   ; mov si, si + 2
    inc si
     
cheking: 
    mov al, [si]                       
    cmp al, last         ; ���� ������ ��������� - ������� ���������  
    je Output              
    cmp al, space        ; ���� ����� �� �������, ��������� �� ��������� �����
    je skip_tail
    cmp al, bl         ; ���� ����� ������ �����
    je found
    mov bl, [si]       ; ���������� ������ � bl
    inc si
    jmp cheking
    
    
found:
    inc cx
    jmp skip_tail                   
     
    
skip_tail:             ;���������� ������� ����� � DI
    mov al, [si]                      
    cmp al, last     
    je Output
    cmp al, space   
    je skip_spaces     
    inc si
    jmp skip_tail  
    
skip_spaces:           ;���������� ������� �� ������ ���������� ����� � DI
    mov al, [si]                      
    cmp al, last     
    je Output        
    cmp al, space   
    jne cheking    
    inc si
    jmp skip_spaces 
    
Output:  
        std                ; ������������� �������� ������� ������
		lea	di,StringEnd-1 ; ES:DI = ��������� ������ ������ String 

        mov ax, cx         ; ����� � ax
		mov	cx,10          ; �������� ��������� CX = 10
Repeat:
		xor	dx,dx          ; �������� DX (��� �������)
		div	cx             ; ����� DX:AX �� CX (10),
                           ; �������� � AX �������, � DX �������
		xchg	ax,dx      ; ������ �� ������� (��� ���������� �������)
		add	al,'0'         ; �������� � AL ������ ���������� �����
		stosb              ; � ���������� �� � ������
		xchg	ax,dx      ; ��������������� AX (�������)
		or	ax,ax          ; ���������� AX � 0
		jne	Repeat         ; ���� �� ����, �� ���������  
		
		mov	ah,9
		lea	dx,[di+1]      ; ������� � DX ����� ������ ������
		int	21h            ; ������� �� �� �����
		jmp exit
	

exit:
	POP	DI		; ���������������
	POP	SI		; ��������
	POP	DX		;
	POP	BX		;
	POP	CX		;
	POP	AX		; 
	pop bp
	RET
CHECK ENDP ; ����� ���������                                

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 

; ���� ������ �������   
ReadChar proc      
    mov     ah,1 
    int     21h          
    ret  
ReadChar endp
;==================================================
; ������� ������  
Enter proc
    mov ah,09h
    lea dx,crlf
    int 21h    
    ret
Enter endp    
;================================================== 

Mas db 128 dup (0) ; ��������� ������
R db 128 dup (0) ; �������������� ������
n_cur_pos db 0    ;��������� ������� �������� �����
n_temp_pos db 0
n_pos db 0       ;��������� ������� ����������� �����     

String		db	5 dup (?),'$'  ; ����������� 5 ���� ��� ������
StringEnd	=	$-1            ; ��������� �� ������ '$'
  
LAST    DB '$'    ;����� ������ 
SPACE   DB ' '  ;������     
Input_str db '������� ������: ','$'   
crlf db 0dh,0ah,'$'
Res db '���������: ','$' 
           
end start