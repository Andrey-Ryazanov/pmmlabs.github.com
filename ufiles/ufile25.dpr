program TpeyroJIbHuK;
{$APPTYPE CONSOLE}
uses
  SysUtils,
  Windows;

var x1,x2,x3,y1,y2,y3,a,b,c:Real;
begin
SetConsoleCP(1251);
SetConsoleOutputCP(1251);
Writeln('������� ���������� ������:');
  Read(x1,y1);Writeln; read(x2,y2);Writeln; read(x3,y3);Writeln; //���� ���������
     a:=sqr(x1-x2)+sqr(y1-y2);    // ������� A
     b:=sqr(x1-x3)+sqr(y1-y3);    // ������� B
     c:=sqr(x3-x2)+sqr(y3-y2);   // ������� �
     if (Sqrt(a)+sqrt(b)<=sqrt(c))or(Sqrt(a)+sqrt(c)<=Sqrt(b))or(Sqrt(b)+sqrt(c)<=sqrt(a)) then  write('�� ����������') else
  begin
     if (a=b+c)or(b=a+c)or(c=b+a) then write('������������� ') else
     if (a>c+b)or(b>a+c)or(c>a+b) then write('������������ ') else write('������������� ');
     if (a<>b)and(a<>c)and(b<>c) then write('�������������') else
     if (a=b)and(a=c)and(b=c) then write('�������������') else
     write('�������������');
   end;
  readln;Readln;
end.
