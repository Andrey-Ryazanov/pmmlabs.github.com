unit UNodeTree;

interface

uses ComCtrls, Math, SysUtils;
const
  MinElem = 0;
  MaxElem = 100;

type
  TElem = MinElem..MaxElem;
  TNode = class
  private
    FInfo : TElem;
    FLeft, FRight : TNode;
  protected
    procedure SetInfo(const Value: Telem);
    function GetMin : TElem;
    function GetMax : TElem;
    procedure ChangeByGreatestElemFromLeft(var del_node: TNode);
    function height:integer;
  public
    function isBalanced:boolean;

    
    constructor Create(el : TElem = MinElem);
    destructor Destroy; override;
    procedure Add (el : TElem);
    function Find (el : TElem) : boolean;
    procedure DelNode(var node: TNode; el: TElem; var del_node: TNode);
    function Prefix:string;
    function Infix:string;
    function Postfix:string;
    procedure Show(TV:TTreeView; pn: TTreeNode);

    property Info : Telem read FInfo write SetInfo;
    property Left : TNode read FLeft write FLeft;
    property Right : TNode read FRight write FRight;
  end;

implementation
  // Создание узла дерева
constructor TNode.Create(el: TElem);
  begin
    inherited Create;
    FInfo:=el;
    FLeft:=nil;
    FRight:=nil;
  end;

 

// Разрушение узла дерева
destructor TNode.Destroy;
  begin
    if FLeft<>nil then
      FLeft.Destroy;
    FRight.Free;
    inherited;
  end;
//Добавление элемента в дерево
procedure TNode.Add(el: TElem);
  begin
    if el<FInfo then
      if FLeft = nil then
        FLeft:=TNode.Create(el)
      else
        FLeft.Add(el)
    else
      if FRight = nil then
        FRight:=TNode.Create(el)
      else
        FRight.Add(el)
  end;
//ОСНОВНАЯ ЗАДАЧА
function TNode.Height:integer;
begin
  if self = nil then result := 0
  else result := 1 + Max(FLeft.height, FRight.height);
end;

function TNode.isBalanced:boolean;
begin
  result := (self = nil)or((abs(FLeft.height-FRight.height)<=1) and FLeft.isBalanced and FRight.isBalanced)
end;

//поиск определенного элемента
function TNode.Find(el: TElem): boolean;
begin
  if self = nil then
    Result:=false
  else
    if self.FInfo = el then
      Result:=true
    else
      if el < FInfo then
        Result:=FLeft.Find(el)
      else
        Result:=FRight.Find(el)
end;

//получить максимальный элемент
function TNode.GetMax: TElem;
var t : TNode;
begin
  t:=Self;
  while t.Right<>nil do
    t:=t.Right;
    Result:=t.Info;
end;

//получение минимального элемента дерева
function TNode.GetMin: TElem;
var t : TNode;
begin
  t:=Self;
  while t.Left<>nil do
    t:=t.Left;
  Result:=t.Info;
end;

//сеттер информационной части, устанавливает данные
procedure TNode.SetInfo(const Value: Telem);
begin
  if(FLeft.GetMax<Value) and (Value<=FRight.GetMin) then
    FInfo := Value;
end;

//удаление элемента
procedure TNode.DelNode(var node: TNode; el : TElem; var del_node : TNode);

begin
  // Если корневой узел есть
  if node <> nil then
    // если искомый элемент меньше, чем значение в узле, то
    // удаление элемента из корня - это тоже самое, что и удаление слева
    if el < node.Info then
      DelNode(node.FLeft, el, del_node)
    // если искомый элемент больше, чем значение в узле, то
    // удаление элемента из корня - это тоже самое, что и удаление слева
    else if el > node.Info then
      DelNode(node.FRight, el, del_node)
    // если удаляемый элемент находится в узле node
    else
      begin
        // удаляемый элемент находится в узле node
        del_node := node;
        // Если у узла нет правого потомка, то левый становится на его место
        // (если левого нет, то на место удаляемого встанет nil
        if node.Right = nil then
          node:=node.Left
        // Если у узла нет левого потомка, то правый становится на его место
        else if node.Left=nil then
          node:=node.Right
        // Если у узла есть два потомка, то заменяем на самый правый из левого,
        // при этом запоминаем удаляемый узел (самый правый из левого поддерева)
        else
          node.ChangeByGreatestElemFromLeft (del_node);
      end;
end;

// Функция конвертирования дерева в строку (обход слева-направо)
function TNode.Infix: string;
begin
  Result:='';
  if FLeft<>nil then
    Result:=Result+FLeft.Infix+' ';
  Result:=Result+IntToStr(FInfo)+' ';
	 if FRight<>nil then
    Result:=Result+FRight.Infix+' ';
  Result:=Trim(Result)
end;

// Вспомогательная процедура для удаления элемента
procedure TNode.ChangeByGreatestElemFromLeft(var del_node: TNode);
  procedure ExcludeNode (var node: TNode);
  begin
    del_node:=node;
    if node.Right = nil then
      node:=del_node.Left
    else
      ExcludeNode (node.FRight)
  end;
begin
  ExcludeNode(FLeft);
  self.Info:=del_node.Info;
end;


// Функция конвертирования дерева в строку (обход снизу-вверх)
function TNode.Postfix:string;
begin
  result:='';
  if FLeft<>nil then
    result:=result+FLeft.Postfix+' ';
  if FRight<>nil then
    result:=result+FRight.Postfix+' ';
  result:=Trim(result+IntToStr(FInfo));
end;


// Функция конвертирования дерева в строку (обход сверху-вниз)
function TNode.Prefix:string;
begin
  Result:=IntToStr(FInfo)+' ';
  if FLeft<>nil then
    Result:=Result+FLeft.Prefix+' ';
  if FRight<>nil then
    Result:=Result+FRight.Prefix+' ';
  Result:=Trim(Result)
end;

// Отображение узла дерева на компонент TreeView
procedure TNode.Show(TV:TTreeView; pn:TTreeNode);
var
  node:TTreeNode;
begin
  node:=TV.Items.AddChild(pn, IntToStr(FInfo));
  if (FLeft<>nil) or (FRight<>nil) then
    begin
      if FLeft = nil then
        TV.Items.AddChild(node, 'x')
      else
        FLeft.Show(TV, node);
      if FRight = nil then
        TV.Items.AddChild(node, 'x')
      else
        FRight.Show(TV, node);
    end;
end;
end.

