program MaxMinDifference;

{$APPTYPE CONSOLE}

uses
  SysUtils, Windows;

var
  i:integer;
  x,max,min:real;
Begin
  { TODO -oUser -cConsole Main : Insert code here }
  SetConsoleCP(1251);
  SetConsoleoutputCP(1251);

//���� �����
writeln('������� 10 �����:');
readln(x);
min:=x;
max:=x;

//���������� ��������
  for i:=2  to 10   do
      begin
         read(x);
         if  x>max   then
             max:=x
         else
         if     x< min  then
             min:=x;
      end;

//������ ����������
       writeln('�������� ����� ������������ � ����������� ������� �����:', max-min:0:0);
       readln;

writeln('��� ������ �� ��������� ������� <Enter>');
readln
End.
