program Project1;
{$APPTYPE CONSOLE}
uses
  SysUtils,windows;
var stroka:string;
    n:integer;
function nonalpha1(const str:string):integer;
const
 Rus='����������������������������������������������������������������ި';
var
 i,len:integer;
 OK:boolean;
begin
 OK:=false; i:=1;
 len:=Length(str);
 while (not OK) and (i<=len)  do
 if (pos(str[i],Rus)<>0) or ((str[i]<='Z') and (str[i]>='A')) or ((str[i]<='z') and (str[i]>='a'))then
  inc(i)
 else
  begin
  result:=i;
  OK:=true;
  end;
  if not OK then result:=0;
end;
//---
function nonalpha2(const str:string):integer;
 const
 Rus='����������������������������������������������������������������ި';
var
 i,j:integer;
 OK,ok1:boolean;
begin
 OK:=false;  i:=1; 
 while (not OK) do
  begin
  ok1:=false; j:=1;
  while (not ok1) and (j<=66) do if str[i]=rus[j] then ok1:=true else inc(j);
  if ok1 or ((str[i]<='Z') and (str[i]>='A')) or ((str[i]<='z') and (str[i]>='a'))
   then inc(i)
   else
    begin
     result:=i;
     OK:=true;
     ok1:=false; j:=1;
     while (not ok1) and (j<=66) do if str[i]=rus[j] then ok1:=true else inc(j);
     if ok1 or ((str[i]<='Z') and (str[i]>='A')) or ((str[i]<='z') and (str[i]>='a')) or (str[i]=#0)
      then  result:=0;
    end;
  end;
 if not OK then result:=0;
end;
//---
begin
SetConsoleCP(1251);
SetConsoleOutputCP(1251);
write('������� ������: ');
readln(stroka);
write('������� ������� �������, �� ����������� ������(1): ');
n:=nonalpha1(stroka);
if n<>0 then writeln(n) else writeln('����� ���');
write('������� ������� �������, �� ����������� ������(2): ');
n:=nonalpha2(stroka);
if n<>0 then writeln(n) else writeln('����� ���');
write('��� ������ ������� Enter...');
readln;
end.
 