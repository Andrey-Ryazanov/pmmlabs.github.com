; ���� �����������. � ����� � �������� ������� ����� �������� ����� ��������
; ������ �������� �����.
org 100h

.MODEL tiny
 
start:     
; ���� ��������� ������
	mov ah,09h
	lea dx,Input_str
	int 21h   

input:		
	call ReadChar 
	mov [Str_in+si],al		
	cmp al,13
	je continue_input     
	inc si  
loop input
                         
continue_input:
    mov [Str_in+si],'$'; ������ �� Str_in ������  
    call Enter  
; ���� ������ ����� ��� �������
    mov ah,9
    lea dx,Nomer_slova
    int 21h 
    call ReadInteger
    mov N_word,ax 
    call Enter
; ���� ����� ��� ������ 
    mov ah,9
    lea dx,CharToFind
    int 21h   
    call ReadChar 
	mov c_find,al
	call Enter
; ���� ����� ��� ������� 
    mov ah,9
    lea dx,CharToPaste
    int 21h   
    call ReadChar 
	mov c_paste,al
	call Enter     
; ���������:
    mov ah,09h
    lea dx,Res
    int 21h   
; �������� ���������    
    CLD
    LEA di,es:str_IN ;��������� ����� ������-��������    
    MOV BX,0  ; ��������� �������� ����       	   
NEXTWORD:
    MOV		AL, ' '
    MOV		CX, 100
    REPE	SCASB ;������� ��������
    JCXZ WORD
    JE EXIT       
WORD:
    INC BX             
    CMP N_WORD,BX ; ���� ����� �� ������� �����
    JE CURWORD    ; ������� � ������ ��������� �����
    REPNE SCASB		;������� ����������
    JCXZ NEXTWORD 
CURWORD:
    MOV		AL, C_FIND
    MOV		CX, 100
    REPNZ SCASB		;������� ����, �� ������ C_FIND
    JNZ EXIT  
    MOV		AL, C_PASTE
    STOSB
exit:
    MOV AL, '$'
    STOSB
    MOV DX,OFFSET STR_IN	
    MOV AH, 09H ;������ ������-����������
    INT 21H
    MOV AH, 4CH ;���������� ���������
    INT 21H                                    
;----------------------------------------------------- 
ReadInteger proc  
    push    cx      ; ���������� ���������
    push    bx
    push    dx 
    mov     fl,0    ; ���� �������������� �����(0 - �����., 1 -�����.)
    xor     cx, cx  
    mov     bx, 10 
    call    ReadChar  ; ���� �������

    cmp     al,'-'   ; ���� ����� - ���������� ����
    je      minus
    jmp     nn
minus:
    mov     fl,1  
read: 
    call    ReadChar   ; ���� ���������� �������
nn: cmp     al, 13     ; Enter ?
    je      done       ; �� -  > ����������
    
    sub     al, '0'    ;��������� ����� ��� -> ������� ����� char -> int
    xor     ah, ah  
    xor     dx, dx   
    xchg    cx, ax  
    mul     bx  ;��������� ����� ��� �����
    add     ax, cx  
    xchg    ax, cx  
    jmp     read  
done:  
    xchg    ax, cx  
    cmp     fl,1
    je      eee
    jmp     ee
eee:
    neg     ax ; ��������� �����
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
; ������� ������  
Enter proc
    mov ah,09h
    lea dx,crlf
    int 21h    
    ret
Enter endp    

Str_in db 128 dup (?) ; ��������� ������
N_word dw 0       ;����� �����   
c_find db ?
c_paste db ? 
fl dw ?   
LAST    DB '$'    ;����� ������ 
SPACE   DB ' '  ;������     
Input_str db '������� ������: ','$' 
Nomer_slova db '������� ����� �����: ','$'
CharToFind db '������� �����, ����� ������� ���� ��������: ','$'       
CharToPaste db '������� �����, ������� ���� ��������: ','$'
crlf db 0dh,0ah,'$'
Res db '���������: ','$' 
           
end start