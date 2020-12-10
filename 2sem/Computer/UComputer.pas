unit UComputer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, UVideoCardForm, UCPU, UDetail, UCPUForm, UMemory, UVideoCard, UlinkedList;

type
  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    Edit1: TMenuItem;
    Add1: TMenuItem;
    AddCPU1: TMenuItem;
    AddVideoCard1: TMenuItem;
    AddMemory1: TMenuItem;
    DetailList: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure AddCPU1Click(Sender: TObject);
    procedure ShowDetail;
    procedure AddVideoCard1Click(Sender: TObject);
  private
    list:Tlist;
  public
    function getCountList:integer;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  list := Tlist.create;
end;

function TMainForm.getCountList:integer;
begin
  result := list.count;
end;

procedure TMainForm.AddCPU1Click(Sender: TObject);
var cpuDetail:TCpuForm;
begin
  cpuDetail := TCpuForm.Create(self);
  if cpuDetail.ShowModal = mrOk then
    list.Add(cpuDetail.getCpu);
  ShowDetail;
end;

procedure TMainForm.ShowDetail;
var i:integer;
begin
  DetailList.Lines.Clear;

  for i := 0 to list.count-1 do
   DetailList.Lines.Add(list.Get(i).toString)
end;

procedure TMainForm.AddVideoCard1Click(Sender: TObject);
var vcard:TVideoCardForm;
begin
  vcard := TVideoCardForm.Create(self);
  if vcard.ShowModal = mrOk then
    list.Add(vcard.getVideoCard);
  ShowDetail;
end;

end.
