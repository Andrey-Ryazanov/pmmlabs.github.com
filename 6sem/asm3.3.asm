;���� �����������. ���������� ���� �� � �� ��� ���������� ����� ������� �����.
org 100h

.MODEL tiny
 
start:     
    ; ���� ��������� �������
	mov ah,09h
	lea dx,Input_str
	int 21h  
	
    xor cx,cx; ����������� ����
    xor si,si; � si ���������� ��������� 

input:		
	call ReadChar 
	mov [Mas+si],al		
	cmp al,13
	je continue_input     
	inc si  
loop input

continue_input:   
    mov [Mas+si],'$'; ������ �� Mas ������  
    call Enter             
    
    ; ���������:
    mov ah,09h
    lea dx,Res
    int 21h   
    
    ; ����� �������� ��������� � ����������� ���������� � ����   
    lea di, Mas; �������� ������
    push di   
    xor cx,cx  
    call check ; ����� ���������       
    int 20h; ������� � ��
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;;;;;;;;;;;;;;;;;;;;; �������� ��������� ;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
CHECK PROC  
    push bp  
    
    mov bp,sp  
    mov  si, [bp+4] ;������ 
    mov di, [bp+4] 	
	      
	PUSH	AX		; ��������� ��������
	PUSH	CX		;
	PUSH	BX		;
	PUSH	DX		;
	PUSH	SI		;
	PUSH	DI		; 
	             
main:                    ;di �� ������ 2�� �����
    mov al, [di]                
    cmp al, last    
    je NO        
    jmp skip_tail_di
    
new_word:                ;si �� ������� �����,di �� ���������
    mov al, [di]
    
    cmp al, space
    je check_sec_ptr_space
    
    cmp al, last
    je check_sec_ptr_last
    
    cmp al, [si]
    jne skip_tail_si
    inc si
    inc di
    jmp new_word
        
    
skip_tail_si:             ;
    mov al, [si]                      
    cmp al, space   
    je skip_spaces_si     ;
    inc si
    jmp skip_tail_si
    
skip_spaces_si:        
    mov al, [si]                      
    cmp al, space   ;
    jne skip_tail_di    ;
    inc si
    jmp skip_spaces_si    
    
skip_tail_di:
    mov al, [di]                      
    cmp al, last     
    je NO
    cmp al, space   
    je skip_spaces_di     ;
    inc di
    jmp skip_tail_di  
    
skip_spaces_di:        
    mov al, [di]                      
    cmp al, last     
    je NO        ;
    cmp al, space   ;
    jne new_word    ;
    inc di
    jmp skip_spaces_di
    
check_sec_ptr_space:
    mov al, [si]
    cmp al, space
    je YES
    jne skip_tail_si

check_sec_ptr_last:
    mov al, [si]
    cmp al, space
    je YES
    jne NO 
    
NO:
    mov ah,09h
	lea dx,Res_no; ��� ����, ��� ������
	int 21h
	jmp exit
	
YES:
    mov ah,09h
	lea dx,Res_yes; ��� ����, ��� ������
	int 21h
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    

;==================================================
; ���� ������ �������   
ReadChar proc      
    mov     ah,1 
    int     21h          
    ret  
ReadChar endp
;==================================================
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
;==================================================
; ������� ������  
Enter proc
    mov ah,09h
    lea dx,crlf
    int 21h    
    ret
Enter endp    
;================================================== 
  
;================================================== 
Mas db 128 dup (0) ; ��������� ������
R db 128 dup (0) ; �������������� ������
n_cur_pos db 0    ;��������� ������� �������� �����
n_temp_pos db 0
n_pos db 0       ;��������� ������� ����������� �����       
LAST    DB '$'    ;����� ������ 
SPACE   DB ' '  ;������     
Input_str db '������� ������: ','$'   
Res_no db '� ������ ��� ������� ����� ���������� ����!','$'
Res_yes db '� ������ ���� ����������� �����!','$' 
crlf db 0dh,0ah,'$'
Res db '���������: ','$' 
           
end start