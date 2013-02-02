program str132n34h;
{$APPTYPE CONSOLE}
uses SysUtils,windows;
const maxn = 100;
type                                     // ������� ������
  Stroka = array [1..20] of char;
  Week = (pn,vt,sr,cht,pt,sb,vs);
  Time = record
         hours: 0..23;
         minutes: 0..59;
         end;
  Seminar = record
            predmet,prepod: stroka;
            day: week;
            h: record
               start, finish: Time;
               end;
            group: 1..300;
            auditoria: integer;
            end;                         //---------------
var
  a: array[1..maxn] of seminar;          // ������ �������� � ��������
  i,n,j,m,count,p:integer;
  yn:char;
  s:array[1..maxn] of string;            // ������ �������� ���������
procedure readstr(var str: stroka);      // ������ ���� Stroka
var c:char;
    k:integer;
begin
 k:=1;
 while (not eoln) and (k<=20) do
  begin
   read(c);
   str[k]:=c;
   inc(k);
  end;
 readln;
end;                                    //--------------------
procedure inputtime(var t:time);        // ���� ���� Time
var k:integer;
begin
 repeat
  write('����: ');
  read(k);
 until k in [0..23];
 t.hours:=k;
 repeat
  write(' ������: ');
  read(k);
 until k in [0..59];
 t.minutes:=k;
 readln;
end;                                    //---------------
procedure inputseminar(var s:seminar);  // ���� ���� Seminar
var k:integer;
begin
 with s do
 begin
  write('������� �������: '); readstr(predmet);
  write('������� �������������: '); readstr(prepod);
  repeat
   write('������� ����� ��� ������ (�� 1 �� 7): ');
   readln(k);
   until k in [1..7];
  s.day:=week(k-1);
  write('������� ������ ��������: '); inputtime(h.start);
  write('������� ����� ��������: '); inputtime(h.finish);
  write('������� ����� ������: '); readln(group);
  write('������� ���������: '); readln(auditoria);
 end;
end;                                    //------------------
begin                                   // ������� ���������
SetConsoleCP(1251);                     // ��������� ���������
SetConsoleOutputCP(1251);
 i:=1;
 repeat                                 // ���� ������� �������� � ��������
  writeln('������� ���������� � �������� ����� ',i,' :');
  inputseminar(a[i]);
  write('��� ����������� ����� ������� S, ��� ����������� ����� ������ �����:');
  readln(yn);
  inc(i);
 until yn in ['s','S','�','�'];        // ������� ���������� �� ���������� maxn
 writeln('���������� �������:');
 n:=1; dec(i);
 while n<=i do                          // ���������� ������� ����� ���������� ���������
  begin
   for m:=1 to 20 do if a[n].predmet[m]<> #0 then s[n]:=s[n]+a[n].predmet[m];
   inc(n);
  end;
 n:=1;                                //------------------
 while n<=i do                        // ��� ������� ����� �������������� ��������
  begin
   count:=1;                          // ������������� ���������� ��������� - 1
   write(s[n],' - ');                 // �������� �������� ����� ��������
   j:=n+1;
   while j<=i do if s[n]=s[j] then    // �������� �� ������� �� ����� �������
    begin                             // � ������� ����� �� ��������
     inc(count);                      // ���� ������� - ����������� �������
     for p:=j to i-1 do s[p]:=s[p+1]; // � ������� ���� ��������� �������, ����� ������ �� ���� �� ����������.
     dec(i);                          // ��������� "�����" �������
    end
   else inc(j);                       // ���� �� ������� - �� ������ ���������� �����
   writeln(count,' �������');         // ����� ���������� ��� �������� ��������.
   inc(n);                            // ��������� � ���������� ��������
  end;
readln;
end.
 