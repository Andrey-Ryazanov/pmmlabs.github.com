unit UMain;

interface
//проверить €вл€етс€ ли дерево сбалансированным
uses
 Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ExtCtrls, ComCtrls, QDialogs, Grids, UNodeTree, Utree;

type
  TMainForm = class(TForm)
    rgAction: TRadioGroup;
    ButtonDoAction: TButton;
    ButtonView: TButton;
    ButtonClose: TButton;
    TreeView: TTreeView;
    SpinEdit: TSpinEdit;
    LabelElement: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure rgActionClick(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure ButtonDoActionClick(Sender: TObject);
  private
    Tree:TTree;
  public
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tree.Destroy;
end;

//при трех кнопках видно окно ввода чисел
procedure TMainForm.rgActionClick(Sender: TObject);
begin
  SpinEdit.Visible:=rgAction.ItemIndex in [1..3];
  LabelElement.Visible := SpinEdit.Visible;
end;

//инициализаци€ дерева при создании формы
procedure TMainForm.FormCreate(Sender: TObject);
begin
  Randomize;
  SpinEdit.MinValue := MinElem;
  SpinEdit.MaxValue := MaxElem;
  Tree := TTree.Create;
  rgActionClick(sender);
end;

procedure TMainForm.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

//работа с радиокнопками при нажатии кнопки "выполнить"
procedure TMainForm.ButtonDoActionClick(Sender: TObject);
var N:integer;
begin
  n := 10;
  case rgAction.ItemIndex of
  0: if InputQuery('√енераци€ дерева', '¬ведите количество элементов', n) then
        tree.Random(n);
  1:Tree.Add(StrToInt(SpinEdit.Text));
  2:if tree.Find(strtoint(SpinEdit.text)) then
      ShowMessage('Ёлемент найден')
    else
      ShowMessage('Ёлемент не найден');
  3: if not Tree.Delete(strtoint(SpinEdit.Text))then
      ShowMessage('Ёлемент не найден');
  4: tree.Clear;
  //основна€ задача
  5: if tree.checkBalance then
      ShowMessage('ƒерево сбалансировано')
     else
      ShowMessage('ƒерево несбалансировано');
  end;
  tree.Show(TreeView);
end;
end.
