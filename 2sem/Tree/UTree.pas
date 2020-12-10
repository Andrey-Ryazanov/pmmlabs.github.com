unit UTree;

interface

uses ComCtrls, Math, SysUtils, UNodeTree, Contnrs;

type
  TTree = class
  private
    FRoot : TNode;

  public
    constructor Create;
    destructor Destroy; override;
    //основная задача
    function checkBalance:boolean;
    
    procedure Add (el : TElem);
    function Find (el : TElem) : boolean;
    function Delete (el : TElem) : boolean;
    function IsEmpty : boolean;
    procedure Clear;
    procedure Random (N : integer);
    procedure Show (TV : TTreeView);
    function Prefix : string;
    function Infix : string;
    function Postfix : string;
    function ViewByQueue_without_checking_levels : string;
    function ViewByQueue_with_checking_levels : string;
    function ViewByStack_node_left_right : string;
    function ViewByStack_left_node_right : string;
  end;
implementation

constructor TTree.Create;
begin
  FRoot:=nil
end;

destructor TTree.Destroy;
begin
  Clear;
  inherited;
end;

procedure TTree.Clear;
begin
  FreeAndNil(FRoot)
end;

//основная задача
function TTree.checkBalance:boolean;
begin
  result := FRoot.isBalanced;
end;
//добавление элемента
procedure TTree.Add(el: TElem);
begin
  if IsEmpty then
    FRoot:=TNode.Create(el)
  else
    FRoot.Add(el);
end;
//удаление элемента
function TTree.Delete(el: TElem): boolean;
var
  del_node: TNode;
begin
  del_node:=nil;
  FRoot.DelNode(FRoot, el, del_node);
  Result:=del_node <> nil;
  If Result then
    begin
      del_node.Create;
      del_node.Destroy;
    end;
end;

//поиск элемента
function TTree.Find(el: TElem): boolean;
begin
  Result:=FRoot.Find(el)
end;

//инфиксная запись в строку
function TTree.Infix: string;
begin
  Result:='';
  if FRoot<>nil then
    Result:=FRoot.Infix
end;

//проверка на пустоту
function TTree.IsEmpty: boolean;
begin
  Result:=FRoot = nil
end;


//постфиксная запись в строку
function TTree.Postfix: string;
begin
  Result:='';
  if FRoot<>nil then
    Result:=FRoot.Postfix
end;
//префиксная запись в строку
function TTree.Prefix: string;
begin
  Result:='';
  if FRoot<>nil then
    Result:=FRoot.Prefix
end; 

//случайное заполнение
procedure TTree.Random(N: integer);
begin
  Clear;
  While N>0 do
    begin
      Add(RandomRange(MinElem,MaxElem+1));
      dec(N)
    end
end;


procedure TTree.Show(TV: TTreeView);
begin
  TV.Items.Clear;
  if not IsEmpty then
    FRoot.Show(TV, nil);
  TV.FullExpand;
end;

function TTree.ViewByQueue_without_checking_levels: string;
var
  Q : TQueue;
  node : TNode;
begin
  Result:='';
  if FRoot<>nil then
    begin
      Q:=TQueue.Create;
      Q.Push(FRoot);
      while Q.Count>0 do
        begin
          node:=Q.Pop;
          Result:=Result+IntToStr(node.Info)+' ';
          if node.Left<>nil then
            Q.Push(node.Left);
          if node.Right<>nil then
            Q.Push(node.Right);
        end;
      Q.Free
    end;
  Result:=Trim(Result);
end;

 

function TTree.ViewByQueue_with_checking_levels: string;
var
  Q : TQueue;
  node : TNode;
  cnt_cur, cnt_next : integer;
  i : integer;

begin

  Result:='';

  if FRoot<>nil then

    begin

      Q:=TQueue.Create;

      Q.Push(FRoot);

      cnt_cur:=1;


      while Q.Count>0 do

        begin


          cnt_next:=0;


          for i:=1 to cnt_cur do

            begin

              node:=Q.Pop;

              Result:=Result+IntToStr(node.Info)+' ';

              if node.Left<>nil then

                begin

                  Q.Push(node.Left);

                  inc(cnt_next);

                end;

              if node.Right<>nil then

                begin

                  Q.Push(node.Right);

                  inc(cnt_next)

                end;

            end;


          Result:=Result+'; ';
          cnt_cur:=cnt_next;

        end;
      Q.Free

    end;

  Result:=Trim(Result);

end;

 


function TTree.ViewByStack_node_left_right: string;

var


  S : TStack;


  node : TNode;

begin

  Result:='';
  if FRoot<>nil then

    begin
      S:=TStack.Create;

      S.Push(FRoot);

      while S.Count>0 do

        begin
          node:=S.Pop;
          Result:=Result+IntToStr(node.Info)+' ';
          if node.Right<>nil then

            S.Push(node.Right);
          if node.Left<>nil then

            S.Push(node.Left);

        end;
      S.Free

    end;

  Result:=Trim(Result);

end;



function TTree.ViewByStack_left_node_right: string;

var

  S : TStack;

  tmp_node : TNode;

begin

  Result:='';

  if FRoot<>nil then

    begin

      S:=TStack.Create;
      tmp_node:=FRoot;

      repeat
        while tmp_node<>nil do

          begin
            S.Push(tmp_node);

            tmp_node:=tmp_node.Left;
          end;
        tmp_node:=S.Pop;
        result:=Result+IntToStr(tmp_node.Info)+' ';
        tmp_node:=tmp_node.Right;
      until (tmp_node=nil) and (S.Count = 0);
       S.Free;
    end;
  Result:=Trim(Result);

end;

end.
