unit ULinkedList;

interface
uses
  UNode,
  UDetail;

type
  Tlist = class
  private
    Fhead, Ftail: Tnode;
    Fcount: integer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(info: Detail);
    function IsEmpty: boolean;
    function Get(index: integer): Detail;
//    procedure Delete(index: integer);
//    procedure Clear;
    property count: integer read Fcount;
  end;

implementation
constructor Tlist.Create;
begin
  inherited Create;
  Fhead := nil;
  Fcount := 0;
end;

destructor Tlist.Destroy;
begin
  //Clear;
  inherited Destroy
end;

procedure Tlist.Add(info: Detail);
var
  tmp: Tnode;
begin
  tmp := Tnode.Create(info);
  if count = 0 then
      Fhead := tmp
  else
      Ftail.next := tmp;
  Ftail := tmp;
  inc(Fcount)
end;

function Tlist.IsEmpty: boolean;
begin
  Result := Fcount = 0
end;

function Tlist.Get(index: integer): Detail;
var
  node: Tnode;
  x: integer;
begin
  node := Fhead;
  x := 0;
  if not IsEmpty then
  begin
    while (x < index) and (node.next <> nil) do
      begin
        node := node.next;
        inc(x)
      end;
    if x = index then
      Result := node.info
    else
      Result := nil
  end;
end;

end.
 