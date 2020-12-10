unit UNode;

interface
uses
  UDetail;

type
  Tnode = class
  private
    Finfo: Detail;
    Fnext: Tnode;
  public
    constructor Create(info: Detail);
    destructor Destroy; override;
    property info: Detail read Finfo;
    property next: Tnode read Fnext write Fnext;
  end;

implementation
constructor Tnode.Create(info: Detail);
begin
  inherited Create;
  Finfo := info;
  Fnext := nil;
end;

destructor Tnode.Destroy;
begin
  inherited Destroy
end;

end.
