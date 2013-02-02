program str98n16a;

{$APPTYPE CONSOLE}

uses
  SysUtils,windows;

type country=(Austria, Canada, China, Italy, Peru, USA);
     continent=(America, Africa, Asia, Europe);
     TnameCntr=array[country] of string;
     TnameCntnnt=array[continent] of string;
const names:TnameCntr=('�������','������','�����','������','����','���');  // ������ ������� �������� �����
      names2:TnameCntnnt=('�������','������','����','������');             // ������ ������� �������� �����������
var tmp:country;        // ���������� ��� ����� (��������)
    i:integer;
    t:continent;
function CountryToContinent(var cntr:country):continent; // ������� ������������� ������ ����������
 begin
  case cntr of                     // ��������� ���������� � ������� ��������
   Austria: result:=Europe;
   Canada: result:=America;
   China: result:=Asia;
   Italy: result:=Europe;
   Peru: result:=America;
   USA: result:=America;
   end;
 end;
begin
 SetConsoleCP(1251);                  // ��������� ��������� ��������� 1251
 SetConsoleOutputCP(1251);
  writeln('������� ����� ������:');
  for tmp:=Austria to USA do writeln(ord(tmp)+1,' - ',names[tmp]);  // ������ ���� ��� ������ ������
  repeat readln(i);                                                 // ������ ������ ������������
  until (i>=1) and (i<=ord(High(country))+1);                       // ����� ������ ��������������� ������ �� ��������� country
  write(names[country(i-1)],' ��������� �� ���������� ');
  tmp := country(i-1);
  writeln(' ',names2[CountryToContinent(tmp)]); //����� ����������,
  readln;                                      //�.� ����� ���������������� �������� ������� names2
end.
 