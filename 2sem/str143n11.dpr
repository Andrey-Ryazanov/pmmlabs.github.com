program str143n11;
{$APPTYPE CONSOLE}
uses
  SysUtils,
  windows;
const n=4;
      max_value=30;
var a:array[1..n,1..n] of 0..max_value;
    max,min,i,j:integer;
    s,s2: set of 0..max_value;
begin
 SetConsoleCP(1251);
 SetConsoleOutputCP(1251);
 writeln('������� ������� ',n,' �� ',n,':');
 for i:=1 to n do                     // ���� �������
  begin                               //
   for j:=1 to n do read (a[i,j]);    //
   readln;                            //
  end;                                //
 writeln('�����:');
 for i:=1 to n do                      // ��������� �������
  begin
   max:=a[i,1]; min := a[i,1]; s:=[]; s2:=[];                           // ������������� ����������
   for j:=2 to n do
    if a[i,j]>max then max:=a[i,j] else if a[i,j]<min then min:=a[i,j]; // ����� �������� � ��������� ������ i
  s:=[min..max];// for j:=min to max do s:=s+[j];                           // ������������ ��������� �����, ������� ������ ���� � ������
   for j:=1 to n do s2:=s2+[a[i,j]];                        // ������������ ��������� �����, ������� ��������� � ������
   if s=s2 then writeln(i);                                 // ���� ��� ��������� �����, �� ������� ������ ���������.
  end;
 readln;
end.
