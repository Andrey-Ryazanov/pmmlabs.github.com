Program trpo3;

{$APPTYPE CONSOLE}

uses
  SysUtils,Windows;

Var
  MaxSumma, MaxBegin, MaxEnd, MaxLength, current, buf : integer;
  i,j : byte;
Begin
  SetConsoleOutputCP(1251);
  writeln('������� ����� ����� ������ � ������� Enter: ');
  current:=0; j:=0;
  MaxSumma:=0; MaxLength:=MAXWORD;
  MaxBegin:=0; MaxEnd:=0;
  i:=1;
  repeat
      read(buf);
      inc(j);
      current:= current + buf;
      if current<=0 then
         begin
          current:=0;
          j:=0
         end;
      if current>=MaxSumma then
         begin
             if current>MaxSumma then
                  begin
                    MaxSumma:=current;
                    MaxBegin:=i-j;
                    MaxEnd:=i;
                    MaxLength:=j;
                  end
             else if j<MaxLength then
                  begin
                    MaxBegin:=i-j;
                    MaxEnd:=i;
                    MaxLength:=j;
                  end
         end;
      inc(i);
  until eoln;
 if MaxSumma=0 then writeln ('��� �������� - ����!')
 else writeln('������������ �����: ',MaxSumma,', ������: ',(MaxBegin+1),', �����:',MaxEnd);
 readln;
 readln;
End.
