;���� �����������. ������� ��������� ����� ������� �����.

.MODEL	 SMALL

.STACK 	100h

.DATA
STR_IN  DB 0ah,0dh,'Hello world and goodbay','$'   ;�������� ������
STR_OUT DB 100 DUP(?)   ; ������-���������
SPACE   DB ' '  ;������
LAST    DB '$'    ;����� ������
   
.CODE       

START:
;��������� � DS ������ �������� ������
    MOV	AX,@DATA
    MOV	DS,AX
;��� ����������� ������ STR_OLD � �������� ������ � ������ STR_OUT � �������� ������  
    PUSH DS
    POP	ES  
    CLD ;��� ��������� ����� �������
    LEA si,str_in ;��������� ����� ������-���������
    LEA di,es:str_out ;��������� ����� ������-��������          	
    LODSB ;�������� ������-��������� � ������� al
        
READ:  
    STOSB ;�������� �� al � ������-������� 
    MOV bl,al ;���������� ��������� ������
    LODSB ;�������� �� ������-��������� � al     
    CMP al,last ;����� ������?
    JE DONE ;��
    CMP al,space ;������?
    JNE READ ;���
    MOV al,bl ;�� ������ 
    STOSB ;��������� ��������� ����� 
    MOV al,space ;�������� � al ������
    JMP READ  

DONE:
    MOV	al,bl
    STOSB
    MOV al,last
    STOSB ;��������� ������� ����� ������

PRINT:       
    MOV DX,OFFSET STR_IN	
    MOV AH, 09H ;������ ������-��������� 
    INT 21H                
    MOV DX,OFFSET STR_OUT	
    MOV AH, 09H ;������ ������-����������
    INT 21H
    MOV AH, 4CH ;���������� ���������
    INT 21H		

end START




