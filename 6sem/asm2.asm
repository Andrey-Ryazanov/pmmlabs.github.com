.MODEL tiny
   .CODE
   org 100h
_start:
; ���� ࠧ��୮�� ���ᨢ� � ॣ���� AX
    mov ah,9
    lea dx,Input_size
    int 21h 
    call ReadInteger
    mov N,ax
; ��ॢ�� ��ப�
    mov ah,9
    lea dx,crlf
    int 21h
; ���� ����� �࠭��� ��१��    
    mov ah,9
    lea dx,Input_A
    int 21h 
    call ReadInteger
    mov A,ax
; ��ॢ�� ��ப�
    mov ah,9
    lea dx,crlf
    int 21h
; ���� �ࠢ�� �࠭��� ��१��    
    mov ah,9
    lea dx,Input_B
    int 21h 
    call ReadInteger
    mov B,ax
; ��ॢ�� ��ப�
    mov ah,9
    lea dx,crlf
    int 21h

    mov cx, N	; ��࠭塞 ࠧ��� ���ᨢ� � ��
    mov ah,9
    lea dx,Input_numbers
    int 21h
; ���� ����⮢ ���ᨢ� ॣ���� AX  
input:
    call ReadInteger
    mov si, cx  
    add si, si
    mov [Mas+si],ax    

; ��ॢ�� ��ப�
    mov ah,9
    lea dx,crlf
    int 21h

loop input

; �뢮� ���ᨢ�
    mov ah,9
    lea dx,Res_mas
    int 21h

    mov cx, N	; ��࠭塞 ࠧ��� ���ᨢ� � ��
; �뢮� ����⮢ ���ᨢ�
output:
    mov si, cx
    add si, si  
    mov ax,[Mas+si]    
    call WriteInteger
   
; ��ॢ�� ��ப�
    mov ah,9
    lea dx,crlf
    int 21h
loop output

; �뢮� १����
    mov ah,9
    lea dx,Res
    int 21h
    PUSH A
    PUSH B
    PUSH N
    lea di,Mas+2 
    push di  
    mov bp,sp
    CALL MAIN_PROGRAM ; �맮� ��楤���
ret
; ������� �ணࠬ��
MAIN_PROGRAM PROC

     ;  lea di,Mas+2       ; � di ���� Arr[1]  
       ; add bp,2
        mov di,bp+2
        mov cx,bp+4
        mov bx,bp+6
        mov ax,bp+8
                    
check:  
        cmp [di],ax      
        jl No            ; if arr[i]<a
        cmp [di],bx      
        jg No            ; if arr[i]>b
        dec cx           ; � cx ⥯��� ������⢮ ���஢�७��� ����⮢
        add di,2         ; � di ⥯��� ���� ᫥���饣� ����� Arr
        cmp cx,0         
        jg check         ; if n>0 
        mov  dx,OFFSET Success ; �᫨ ��諨 �� �⮣� ���� - ����� �� 
        jmp print               
No:     mov  dx,OFFSET Fail         
print:  mov  ah,9             ; �������� �, ���� 祣� � dx
        int  21h              
        mov  ah,4ch                 
        int  21h

	RET
MAIN_PROGRAM ENDP ; ����� ��楤���

ReadInteger proc  
    push    cx      ; ��࠭���� ॣ���஢
    push    bx
    push    dx 
    mov     fl,0    ; 䫠� ����⥫쭮�� �᫠(0 - �����., 1 -����.)
    xor     cx, cx  
    mov     bx, 10 
    call    ReadChar  ; ���� ᨬ����

    cmp     al,'-'   ; �᫨ ����� - ��⠭����� 䫠�
    je      minus
    jmp     nn
minus:
    mov     fl,1  
read: 
    call    ReadChar   ; ���� ��।���� ᨬ����
nn: cmp     al, 13     ; Enter ?
    je      done       ; �� -  > �����襭��
    
    sub     al, '0'    ;���⠭�� ���� ��� -> ��ॢ�� ���� char -> int
    xor     ah, ah  
    xor     dx, dx   
    xchg    cx, ax  
    mul     bx  ;㬭������ �ᥫ ��� �����
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

; ���� ������ ᨬ����   
ReadChar proc  
    mov     ah,1 
    int     21h 
    ret  
ReadChar endp

; �뢮� 10-�᫠
WriteInteger proc near 
    push    ax  
    push    cx  
    push    bx  
    push    dx  
    xor     cx, cx  
    mov     bx, 10  
; �᫮ ����⥫쭮�?    
    cmp     ax,0
    jl      ddd	; �᫨ - ��
    jmp     divl	; �᫨ - ���
; �뢥�� ����� � �������� ����
ddd:
    push    ax
    mov     dl, '-'  
    mov     ah, 2  
    int     21h
    pop     ax
    neg     ax  

; ������� 10-���� � �������� �� � �⥪,
; � cx - ������⢮ ����祭��� ���
divl:  
    xor     dx, dx  
    idiv    bx  
    push    dx  
    inc     cx  
    cmp     ax,0     
    jg     divl  

; ������ �� �⥪�, ��ॢ��� � ��� ASSII  � �뢥��  
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

; �뢮� ������ ᨬ����  
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

A dw ?
B dw ?
N dw ?
Mas dw 256 dup (?)                      ; ���ᨢ
fl dw ?
Success db '�� �᫠ �������� � ������� ��������!' 
db 0Dh,0Ah,'$' 
Fail db '� ������� �������� �������� �� �� �᫠...' 
db 0Dh,0Ah,'$' 
Input_A db '������ ����� �࠭���:' 
db 0Dh,0Ah,'$' 
Input_B db '������ �ࠢ�� �࠭���:' 
db 0Dh,0Ah,'$' 
Input_size db '������ ࠧ��� ���ᨢ�:' 
db 0Dh,0Ah,'$' 
Input_numbers db '������ ������ ���ᨢ� (�१ Enter) :' 
db 0Dh,0Ah,'$'
Res_mas db '���ᨢ:', 0dh,0ah,'$'
crlf db 0dh,0ah,'$'
Res db '�������:' 
db 0Dh,0Ah,'$'
end _start