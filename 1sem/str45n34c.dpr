program str45n34c;
{����� ���� ����������� ����� n � ������������ ����� a1, a2,...,an, ������� �������� �� ������. �������� a1+2a2+...nan}
{$APPTYPE CONSOLE}

uses
  SysUtils,windows;

var s,i,a,n:integer;
begin
SetConsoleCP(1251);
SetConsoleOutputCP(1251);
 repeat
  writeln('������� ����������� ����� n');
  readln(n);
  until (n>0);
  for i:=1 to n do
  begin
  readln(a);
  s:=s+i*a;
  end;
  writeln('����� =',s);
  readln;
end.
 