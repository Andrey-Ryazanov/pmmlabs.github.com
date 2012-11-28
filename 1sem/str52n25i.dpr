program Project2;
{��� ��������� �������� x, N � �, ������������ ������, ��������� ����� N ���������
 ��������� ����, � ����� ����� ��� ���������, ������� �� ���������� �������� ������ �. 
��� ������� ������ ��������� ������������ ��� ���� �������� �, ������������ �� �������,
 � ��� ���� ���������� ���������� ���������, ���������� � �����. �������� ���������� � 
������ ��������� �������, ��� ������� ������ ����� ���������� ������������ �������� ��� �,
 ������� � ��������� (-R, R). 1/(1+x)^3=1-(2*3*x)/2+(3*4*x^2)/2-(4*5*x^3)/2+... (R=1).
}
{$APPTYPE CONSOLE}
uses
  SysUtils,
  Windows;

var x,eps,sum,a:Real;
    i,n:Integer;
begin
  SetConsoleCP(1251);
  SetConsoleOutputCP(1251);
  repeat
    write('������� N>0: ');readln(N);
  until N>0;
  repeat
  write('������� x (-1<x<1): ');Readln(x);
  until (x>-1)and(x<1);
  repeat
  write('������� eps->0: ');Readln(eps);
  until eps<1;
  sum:=1; a:=1;
  for i:=2 to N do
  begin
    a:=-a*x*((i+1)/(i-1));                //����� ��-�� N
    sum:=sum+a;
  end;
  writeln('����� ',N,' ��������� =',sum:8:5);

  sum:=0; a:=1; N:=2;                    //����� ��-�� ������� eps
  while Abs(a)>eps do
    begin
      sum:=sum+a;
      a:=-a*x*((n+1)/(n-1));
      N:=N+1;
    end;
  writeln('����� ��-�� ������� eps =',sum:8:5,' N=',N-2);

  eps:=eps/10;
   while Abs(a)>eps do
    begin                                        //����� ��-�� ������ eps/10
      sum:=sum+a;
      a:=-a*x*((n+1)/(n-1));
      N:=N+1;
    end;
  writeln('����� ��-�� ������� eps/10 =',sum:8:5,' N=',N-1);
  Writeln('1/(1+x)^3=',1/(sqr(1+x)*(1+x)):8:5);
  readln;Readln;
end.
