program Summa;

{$APPTYPE CONSOLE}

uses
  Windows,SysUtils;

var S, x, Pr : Real;
    n, i : Integer;
Begin
{ TODO -oUser -cConsole Main : Insert code here }
setconsolecp(1251);
setconsoleoutputcp(1251);
  Write('������� ����� ���������:'); ReadLn(n);
  Write('������� x:'); Readln(x);
  Pr := 1;
  S := 0;
    For i := 1 To n Do
     begin
      Pr := Pr * Sin(x);  {��������� ������� Sin(x)}
      S := S + Pr
     end;
  WriteLn('����� ����� ', S : 7 : 4);
  Readln
 End.

