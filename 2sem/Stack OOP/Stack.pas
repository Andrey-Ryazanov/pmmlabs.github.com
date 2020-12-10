unit Stack;

interface

uses
  SysUtils;
type
  Tinfo = String;
  TStack = class 
    public
      procedure push(element:Tinfo); virtual; abstract;
      function pop():Tinfo; virtual; abstract;
      procedure clear();
      function toString():String; virtual; abstract;
      function is_Empty():boolean; virtual; abstract;
  end;
 

implementation
  procedure TStack.clear();
  begin
    while not(is_Empty) do
      begin
        pop();
      end;
  end;

end.
 