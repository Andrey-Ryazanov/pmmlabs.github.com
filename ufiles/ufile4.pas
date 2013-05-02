type TMonth = (Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Decem);
     TYear =  1901..2001;
     TDate = record
              day: 1..31;
              month: TMonth;
              year: TYear;
 end;
var Date:TDate;
function IntToMonth(n: integer): TMonth;
begin
 case N of
  1: IntToMonth := Jan;
  2: IntToMonth := Feb;
  3: IntToMonth := Mar;
  4: IntToMonth := Apr;
  5: IntToMonth := May;
  6: IntToMonth := Jun;
  7: IntToMonth := Jul;
  8: IntToMonth := Aug;
  9: IntToMonth := Sep;
  10: IntToMonth := Oct;
  11: IntToMonth := Nov;
  12: IntToMonth := Decem;
 end;
end;
procedure InputDate(var Date: TDate);
 var n: byte;
 begin
   writeln('������� ����������� ����.');
   writeln;
   write('������� ����: ');
    repeat
      readln(date.day);
    until date.day in [1..31] ;
   write('������� ����� ������ (1 - ������, 2 - ������� � �. �.): ');
    repeat
      readln(n);
    until n in [1..12] ;
   date.month := IntToMonth(n);
   write('������� ��� (�� 1901 �� 2001): ');
    repeat
      readln(date.year)
    until (date.year >= 1901) and (date.year <= 2001) ;
 end;
procedure PrintMonth(Date: TDate);
 begin
  case Date.month of
   Jan: write(' ������ ');
   Feb: write(' ������� ');
   Mar: write(' ����� ');
   Apr: write(' ������ ');
   May: write(' ��� ');
   Jun: write(' ���� ');
   Jul: write(' ���� ');
   Aug: write(' ������� ');
   Sep: write(' �������� ');
   Oct: write(' ������� ');
   Nov: write(' ������ ');
   Decem: write(' ������� ');
  end;
 end;
procedure PrintDate(Date: TDate);
 begin
     write(Date.day);
     PrintMonth(Date);
     write(Date.year, ' ����.')
 end; 
function IsLeap(Year:Integer):Boolean;
 begin
   IsLeap:=(Year mod 4 = 0) and (Year mod 4000 <> 0) and
     ((Year mod 100 <> 0) or (Year mod 400 = 0));
    end;
function DaysInMonth(Date:TDate):integer;
 begin
  case Date.month of Feb:
    begin
      if IsLeap(Date.year) then DaysInMonth := 29
                      else DaysInMonth := 28;
    end;
   Apr, Jun, Sep:
    DaysInMonth := 30;
  else DaysInMonth := 31;
  end;
end;
procedure IncDate(var date: TDate);
begin
   inc(Date.day);
   if (Date.day > DaysInMonth(Date)) then  //���� �������
                                         begin
                                          Date.day:= 1;
                                          inc(Date.month);
                                            if ((ord(Date.month)+1) > 12) then //����� �������
                                              begin
                                               Date.month:= Jan;
                                               inc(Date.year);
                                              end;
                                        end;
end;
begin
 InputDate(Date);
 writeln;
 write('������� ');
 PrintDate(Date);
 write(' ������ ');
 IncDate(Date);
 PrintDate(Date);
 readln;
end.