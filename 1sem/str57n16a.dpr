program kolvo;
{ ����� � �������� �������� ����� ������ ������ ����� � �����. 
����������, ������������� �� �� ���������� �������: ����� ���������� � ��������� ��������� �����,
 �� ������� ������� ������ �����, � �� ���-�� ����� ��������� �������� ���� �����.}
{$APPTYPE CONSOLE}
uses
  SysUtils,
  windows;
const n=100;
var      a:array [1..n] of Char;
         len,num,i,k:Integer;
begin
SetConsoleCP(1251);
SetConsoleOutputCP(1251);
writeln('������� �����, ������� �������� ������ ����� � ����� � ������������� ������:');
i:=0; k:=0;
repeat
  inc(i);
  read(a[i]);
until (a[i]='.')and(i<=n);
len:=i-1;
if (a[1]<='9')and(a[1]>'0') then
  begin
  num:=strToint(a[1]);
  For i:=2 to len do if (a[i]<'0')or(a[i]>'9') then inc(k);
  if k=num then writeln('����� ������������� �������') else writeln('����� �� ������������� �������');
  end
else writeln('����� �� ������������� �������');
readln;readln; 
end.
