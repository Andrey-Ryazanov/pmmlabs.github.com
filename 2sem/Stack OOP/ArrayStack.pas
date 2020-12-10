unit ArrayStack;

interface
  uses Stack, SysUtils;
  const default = 50;
        step = 10;
  type
    TarrayStack = class(TStack)
      private
        body:array of Tinfo;
        head:integer;
        size:integer;
      public
        procedure push(element:Tinfo); override;
        function pop():Tinfo; override;
        function toString():String; override;
        function is_Empty():boolean; override;
        constructor create();
        destructor destroy(); override;

    end;
implementation
 constructor TarrayStack.create();
 begin
  inherited create;
  head := -1;
  size := default;
  setlength(body,default);
 end;

 destructor TarrayStack.destroy();
 begin
  clear();
  size := 0;
  setlength(body, 0);
  inherited destroy();
 end;


 procedure TarrayStack.push(element:Tinfo);
 begin
   if head = size - 1 then begin
      setlength(body,size+step);
      size := size + step;
   end;

   body[head+1] := element;
   inc(head);
 end;

 function TarrayStack.pop():Tinfo;
 begin
  if not(is_Empty) then begin
    result := body[head];
    head := head - 1;
  end else
    Exception.create('Stack is empty');
 end;

 function TarrayStack.is_Empty():boolean;
 begin
  result := head = -1;
 end;

 function TarrayStack.toString():String;
 var i:integer;
 begin
  for i := head downto 0 do
    result := result + body[i] + ' ';
  result := trim(result);
 end;

end.
 