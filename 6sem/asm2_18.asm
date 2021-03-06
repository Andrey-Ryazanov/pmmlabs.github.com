;���� �� ����� ������ ������ ������������� ����� ������������� �. ������������ ��� ������ ������ �������, ��� ���������� � ����� �. 

;1 ������ ������� ������ � ����������  
;2 ������ ������ � ����������
;3 ���������� ��������� ������
;4 ��������� ������� �������� � ���� ���������
;5 ������ � ������ ������� ������ (���� ��� ����) �������� ����������� ����� ����

cseg segment                       
assume cs:cseg, ds:cseg, ss:cseg, es:cseg                   
org 100h                                              
Start:
  mov dx,offset Str_1                      ; ��������� � dx ����� ������ Str_1 (PA3MEP MACCuBA)
  call STRINGOUT                           ; �������� ��������� ������ ������ �� ����� (STRINGOUT proc)
                                           ;  ������ ������ ������� (������� 1 ������)             

  mov ah,1                                 ; ������� 1h ���������� 21h - ���� ������� � ��-��.������� ������� ������� � ������� �����.������  �� �����. >        
                                           ; > ��� ���� � al ��������� ��� ���������� �������.
 
  int 21h                                  ; ������ 1-� ����� (�����.������ ��� 2-�������� �����) ���� ������������ ����� (1-�����.�����)
  int 21h                                  ; ���� 1-�����. - ���� Enter. ���� 2-�����.  - ������ 2-� ����� (�����.������ ��� 2-�����.�����)

   ;/////////////////////////////////////////////   
    push bp         ;��������� ��������� �����
    mov bp, sp        
    
    PUSH	AX		; ��������� �������� 
    PUSH    CX      ;
	PUSH	BX		;
	PUSH	DX		;
    PUSH    DI      ;

ENTER_ARRAY:                               ; ����� ������ ����� ������� (������� 2) ,���������� �������� ��� ��������� � �����(������� 5) �  >
                                           ; > ..� ������������ ���������� ������� �� ����� (������� 3)
  
  mov dx,offset Str_2                      ; ��������� ����� ������ -  BBEDuTE MACCUB    
  call STRINGOUT                           ; �������� ��������� ������ ������ �� �����.
  xor cx,cx                                ; ������� cx, ��� ��� �� ��� ����������� ��� ����� ��������� ��������� ����. ���� �����  - 50 ���������.

INPUTA:                                    ; ����� �����: Enter/������� �����/������ (��� 2-�����.�����) ��� �������. (��� ���������.) �������.�����.
                                           ; 

  mov ah,1                                 ; ��� ����� � ���������� ������������� ��� �� �������� 1h ���������� 21h
  int 21h                                  ; ������ ���� ������/������������ ����� �������� ������� (������ ��� 2-�����.�����,������������ - ��� 1-�����.),
                                           ; ���� ������ ����� (��� ����� ��� ��� ����������� �����.�������� (�����), ����  -  Enter.
                                           ; Enter ����� �������� ����� ����� � ������� � �������� ����� ����� �.
  
  cmp al,13                                ; ��������� �� ����� �� Enter..
  je PORTAL                                ; ���� �����, ��������� � ����� ����� �.
  cmp al,2dh                               ; �����?  (2d  - ��� ������� �����)
  je NEGATIVE                              ; ���� ��,�� ��������� �� ����� ����� � �������������� ������������� ����� 
                                           ;
  sub al,30h                               ; �������������� ���-������� � �����.�������� 30 (��� ��������, �� ������ �� ������ �� ��������� �� 0 �� 9
  cmp al,9                                 ; ����������..
  jbe P                                    ; ���� al<=9,������ ������ �� ���������� ���������.������� �� ����� �
  sub al,27h                               ; ���� ��������� �������� �� ����������,������ ������ ������ �� ��������� �� � �� F (����� �� al 27h, >
                                           ; > ������� ����� �� ��������� �-F,��������������� ���������� �������.
P:
  mov bh,al                                ; �������������� ���������.�������� �������� ����� � ������� �������� bx �� ������,���� ����� �������
                                           ; 2-� ����� �������� �������� �.�. ������� ������ ��� 2-�����.�����.

INPUTB:                                    ; ����� �����: Enter/�������/ ������ (��� 2-�����.�����) ����� �������.��������.
                                           ; 
int 21h
  cmp al,13                                ; ����� Enter?..
  je META                                  ; ���� ��,�� ������� �� ����� ��������� � ��������� � ���� �������� 1-�����.�������.��-�� �������.
  cmp al,2ch                               ; �������? 
  je ZAPYATAYA                             ; ���� ��,�� ������� �� ����� ZAPYATAYA
  mov bl,al                                ; ���� ���,������ ������� 2-� ����� 2-�����.�������.�����.������� �� � bl
                                           ; ������ � bx 2-�����.�����,�������� 15.������ ��� ������� �������� � ����.��������� �������� bx �� ����������� 
                                           ; bh=01,bl=05;. �������������,bx=0105,� ��� ����,����� ��� ����� 0015.����������� 0105 � 0015.. 
  shl bl,4                                 ; ������ ���� �������� bl �� 4 ������� �����.bl=50 ;bx=0150. ����� 15 ������ ���������� bx...
  shr bx,4                                 ; ������� ���� BX! �� 4 ������� ������. ������ bx=0015,��� ������������� ���������� ���� ��������.
  push bx                                  ; �������� � ���� ������� ������� (������� 5)
  inc cx                                   ; �������� ������� ���-�� ��������� ��������� �� ����
  cmp cx,50                                ; �������� �� ����.����� �������� ���������..
  je ENTER_K                               ; ���� ��, �� ��������� � ����� ����� �
  mov ah,2                                 ; ���� ���,�� ������������� ������� �������,��� ��� ������� 2-�����.����� (�����.2h ����.21h)
  mov dl,2ch                               ; � dl ������ ���-�������,������� ����� ������� �� �����. 2c - ��� ������ ','
  int 21h                                  ; ������ ������� 
  jmp INPUTA                               ; ��������� � �����: Enter/'-'/ �������. ����� �������
ZAPYATAYA:                                 ; ������� �� ��� ����� ��� ������� ������� ������� ����� 1-�����.�������.�����
  mov bl,bh                                ; ������� 1-��.�����,���������� bh � bl
  sub bh,bh                                ; bh ������� (2-������ ���). 
  push bx                                  ; bx=00xx (1-��.�����) �������������� �� �����,������� �������� ������� ��-�� � ����
  inc cx                                   ; ������� ������� ���������,������� +1
  cmp cx,50                                ; 
  je ENTER_K                               ; ���� ������� 50 ��-���, ��������� � ����� ����� �
  jmp INPUTA                               ; ���� ���, ��������� � �����: Enter/'-'/ �������. ����� �������
PORTAL:
  jmp ENTER_K
NEGATIVE:                                  ; ����� ����� ��� �����.�����.������ INPUTA � ����������� ������� neg ����������� �������.����� � �����.
  mov ah,1                                 ;
  int 21h
  sub al,30h                               ;
  cmp al,9                                 ;
  jbe N                                    ;
  sub al,27h
N:
  mov dh,al
  int 21h
  cmp al,13
  je NEG_META
  cmp al,2ch
  je NEG_ZAPYATAYA
  mov dl,al
  shl dl,4
  shr dx,4
  neg dx                                   ; ������� neg ��������� ������������� ����� � �������������
  push dx
  inc cx
  cmp cx,50
  je ENTER_K
  xor dx,dx
  mov ah,2
  mov dl,2ch
  int 21h
  jmp INPUTA
META:
  mov bl,bh
  sub bh,bh
  push bx
  inc cx
  jmp ENTER_K
NEG_META:
  mov dl,dh
  sub dh,dh
  neg dx
  push dx
  inc cx
  jmp ENTER_K
NEG_ZAPYATAYA:
  mov dl,dh
  sub dh,dh
  neg dx
  push dx
  inc cx
  cmp cx,50
  je ENTER_K
  jmp INPUTA  


ENTER_K:                                  ; ����� ����� ����� �
  mov dx,offset Str_3
  call STRINGOUT
  mov ah,1                                    
  int 21h                                 ; ������ ������/�������.����� �
  sub ah,ah                               ;��������� ���-������� � �����>>>>
  sub al,30h                              ;>>>>>>
  cmp al,9                                ;>>>>>>
  jbe S                                   ;>>>>>>
  sub al,27h                              ;>>>>>>
S:                                        ;
  push ax                                 ;������� ������/�������.����� � ����  
  mov ah,1
  int 21h                                 ; ������ ������ ����� (��� 2-�����.)/Enter                        
  sub ah,ah                               ; 
  cmp al,13                               ; ���������,�� ����� �� Enter  
  je  VYZOV                               ; ���� �����,������� �� ����� ������ ���������  
  sub al,30h                              ; ���� ���,������ ������� ������ ����� (��� 2-�����.�����)
  cmp al,9                                ;
  jbe STK                                 ;                                            ;
  sub al,27h
STK: 
  mov bl,al                               ; ������� ������ ������� � bl.
  pop ax                                  ; �������� � ���� ������ ������� ������ �� �����
  mov bh,al                               ; �������� ��� � bh
  shl bl,4                                ; � ������ ����������� ��������������:bx=0x0x > bx=0xx0 > bx= 00xx
  shr bx,4                                ; bx=
  mov ax,bx                               ; ��������������� ����� ��������� � ��
  push ax                                 ; � �������� � ����                


VYZOV:
  call CHECK_ARRAY                        ; ������ � ����� � ������� � �����������.�������� ��������� �������� ������� �������� call


EXIT: 
  mov ah,10h
  int 16h                                 ; ����� �� ��������� �� ������� ����� �������..
  int 20h                                 ;


CHECK_ARRAY proc                          ; ��������� �������� �������

	
	
  xor bx,bx                               ; ������� ��������,������� ����� �������� � ���������.
  xor dx,dx                               ;
  pop si                                  ; ��� ��� � ����� � ��� ������ � ����� �,� ������� call ��������� � ���� ����� �������� �� ���������,��..
                                          ; ..������� �� ����� ����� ��������,�������� ��� � �������������� ���������� �������. �������� � si
  pop ax                                  ; ����������� �� ����� ����� �                           
METKA:  
  pop dx                                  ; ����������� ������� ������� �������
  dec cx                                  ; ��������� �� �� 1. �� ����� ���-�� ��������� ���������.
  test dx,dx                              ; ���������,�� �������.�� �����? 
  js NULLSUM                              ; ���� ��,�� ������� �� ����� NULLSUM � �������� ������� bx,� ������� ����� ����������� ���.�����
  add bx,dx                               ; ���� �� ����� �������/���.�����,������ � ��� �������.��������� ����� � bx.�������� - �������� � bx.
  cmp bx,ax                               ; � ���������� ����� (bx) �� ��������� ����� � (��)
  ja STRCOMP                              ; ���� bx ������,������ ��������� ����� �������.������ ����� �� STRCOMP � ���������� ��������.
  cmp cx,0                                ; ���������,��� �� ��-�� ������� ���������
  jne METKA                               ; ���� ���,��������� � ����������.
  jmp STRCOMP                             ; ���� ��, �� ������� �� STRCOMP
NULLSUM:                                  ; ������� �� ��� ����� � ������,���� ����� ������������� 
  xor bx,bx                               ; �������� �����,������������ � bx
  cmp cx,0                                ; 
  jne METKA
STRCOMP:                                  ; ����� ���������� ��������� bx � ax ��� ������ ��������������� ���������
  cmp bx,ax                               ; ���������� ��� ������ ����������.������ YES/NO                                             
  jbe NO                                  ; ���� bx<=ax, �� ������� �� ����� NO 
YES:                                      ; ���� �� bx>��,�� ����������� ��� ����� (������� ������ 4(YES) � ������� �� QUIT)
  mov dx,offset Str_4                     ; 
  call STRINGOUT
  jmp QUIT
NO:                                       ; ����� NO.����� ������� ������ 5,� ������,���� bx<=ax
  mov dx,offset Str_5
  call STRINGOUT
QUIT:
  push si                                 ; �������� ������� ����������� � si ����� �������� �� ��������� � ���� 
  
  ;/////////////////////////
    POP DI      ;
	POP	DX		; ��������������� ��������
	POP	BX		;
	POP	CX		;
	POP	AX		;	
	POP BP      ;
	
  ret                                     ; ������� �� ���������.
CHECK_ARRAY endp


STRINGOUT proc                            ; ��������� ������ ������
  mov ah,9
  int 21h
  ret
STRINGOUT endp


Str_1 db 'PA3MEP MACCuBA: $'
Str_2 db 10, 13, 'BBEDuTE MACCUB: $'
Str_3 db 10, 13, '4ucJIo K: $'
Str_4 db 10, 13, 'Required sum: YES$'     ;  bx>ax
Str_5 db 10, 13, 'Required sum: NO$'      ;  bx<=ax
     
cseg ends
end Start               