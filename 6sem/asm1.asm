.model tiny
org 100h
.DATA
Success DB '��� ����� �������� � �������� ��������!',13,10,'$'   
Fail DB '� �������� �������� �������� �� ��� �����...',13,10,'$'
Arr     dw 310,-1,33,41,-2    ;������ 
n       dw 5                ;������ �������
a       dw -1               ;����� ������� ���������
b       dw 310               ;������ ������� ���������
.CODE  
start:  lea di,Arr       ; � di ����� Arr[1]
        mov ax,a
        mov bx,b
        mov cx,n            
check:  
        cmp [di],ax      
        jl No            ; if arr[i]<a
        cmp [di],bx      
        jg No            ; if arr[i]>b
        dec cx           ; � cx ������ ���������� ������������� ���������
        add di,2         ; � di ������ ����� ���������� �������� Arr
        cmp cx,0         
        jg check         ; if n>0 
        mov  dx,OFFSET Success ; ���� ����� �� ����� ����� - ������ �� 
        jmp print               
No:     mov  dx,OFFSET Fail         
print:  mov  ah,9             ; ���������� ��, ����� ���� � dx
        int  21h              
        mov  ah,4ch                 
        int  21h
ret

end start