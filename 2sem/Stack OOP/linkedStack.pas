unit linkedStack;

interface
  uses Stack, SysUtils;
  type
    Tptr = ^Tnode;
    Tnode = record
              next:Tptr;
              info:Tinfo;
            end;
    TlinkedStack = class(TStack)
      private
        head:Tptr;

      public
        procedure push(element:Tinfo); override;
        function pop():Tinfo;  override;
        function toString():String;  override;
        function is_Empty():boolean;  override;
        constructor create();
        destructor destroy(); override;
    end;

implementation
  constructor TlinkedStack.create();
  begin
    inherited create();
    head := nil;
  end;

  destructor TlinkedStack.destroy();
  begin
    clear();
    inherited destroy();
  end;

  procedure TlinkedStack.push(element:Tinfo);
  var tmp:Tptr;
  begin
    new(tmp);
    tmp^.info := element;
    tmp^.next := head;
    head := tmp;
  end;

  function TlinkedStack.pop():Tinfo;
  var tmp:Tptr;
  begin
    if head <> nil then begin
      result := head^.info;
      tmp := head;
      head := head^.next;
      dispose(tmp);
    end else
      Exception.create('Stack is empty');
  end;

  function TlinkedStack.is_Empty():boolean;
  begin
    result := head = nil;
  end;

  function TlinkedStack.toString():String;
  var tmp:Tptr;
  begin
    tmp := head;
    while tmp <> nil do begin
      result := result + tmp^.info + ' ';
      tmp := tmp^.next;
    end;
  end;

end.
