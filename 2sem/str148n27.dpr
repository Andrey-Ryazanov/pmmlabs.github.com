program str148n27;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  windows;
const maxm=5;
var f:file of integer;
    fname: string;
    m,cur,pred,j,i:integer;
    OK: boolean;
begin
SetConsoleCP(1251);
SetConsoleOutputCP(1251);
OK:=true;
write('������� ��� �����: ');
readln(fname);
while fname = '' do
 begin
  write('��� ����� �����! ��������� ����: ');
  readln(fname);
 end;
while not fileexists(fname) do
 begin
  write('������ ����� ���! ��������� ����: ');
  readln(fname);
 end;
assign(f,fname);
{
rewrite(f);
randomize();
for i:=1 to maxm do
begin
 for j:=1 to maxm do
 begin
  pred:=random(100);
  write(f,pred);
  write(pred:5);
 end;
 writeln;
end;
closefile(f);
reset(f);
}

reset(f);
for i:=1 to maxm do
begin
 for j:=1 to maxm do
 begin
  read(f,pred);
  write(pred:5);
 end;
 writeln;
end;
seek(f,0);

if eof(f) then writeln('���� ����!') else
 begin
  writeln('���� ',fname,' ������! ������� m: ');
  readln(m);
  while m>maxm do
   begin
    writeln('�������� m ������ ���� ������ ',maxm,'! ��������� ���� m:');
    readln(m);
   end;
  seek(m);
  read(f,pred);
  while not eof(f) and OK do
   begin
    for j:=1 to m do read(f,cur);
    OK:=cur>pred;
    pred:=cur;
   end;
  if OK then writeln('�������� ',m,'-�� ������� ����������� �� �����������.') else
  writeln('�������� ',m,'-�� ������� �� ����������� �� �����������.');
 end;
closefile(f);
readln;
end.
 