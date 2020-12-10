unit UComputerMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, UVideoCardForm, UReadPrice, UCPU, UDetail, UCPUForm, UMemory, UMemoryForm, UVideoCard, UlinkedList;

type
  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    Edit1: TMenuItem;
    Add1: TMenuItem;
    AddCPU1: TMenuItem;
    AddVideoCard1: TMenuItem;
    AddMemory1: TMenuItem;
    DetailList: TMemo;
    Show1: TMenuItem;
    Find1: TMenuItem;
    Searchonprice1: TMenuItem;
    Searchondetail1: TMenuItem;
    CPU1: TMenuItem;
    VideoCard1: TMenuItem;
    Memory1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure AddCPU1Click(Sender: TObject);
    procedure ShowDetail;
    procedure AddVideoCard1Click(Sender: TObject);
    procedure Show1Click(Sender: TObject);
    procedure AddMemory1Click(Sender: TObject);
    procedure Searchonprice1Click(Sender: TObject);
    procedure CPU1Click(Sender: TObject);
    procedure VideoCard1Click(Sender: TObject);
    procedure Memory1Click(Sender: TObject);
  private
    list:Tlist;
  public
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  list := Tlist.create;
end;

procedure TMainForm.AddCPU1Click(Sender: TObject);
var cpuDetail:TCpuForm;
begin
  cpuDetail := TCpuForm.Create(self);
  if cpuDetail.ShowModal = mrOk then
    list.Add(cpuDetail.getCpu);
  ShowDetail;
end;

procedure TMainForm.AddVideoCard1Click(Sender: TObject);
var vcard:TVideoCardForm;
begin
  vcard := TVideoCardForm.Create(self);
  if vcard.ShowModal = mrOk then
    list.Add(vcard.getVideoCard);
  ShowDetail;
end;

procedure TMainForm.ShowDetail;
var i:integer;
begin
  DetailList.Lines.Clear;
  for i := 0 to list.count-1 do
      DetailList.Lines.Add(list.Get(i).toString);
end;

procedure TMainForm.Show1Click(Sender: TObject);
begin
 ShowDetail;
end;

procedure TMainForm.AddMemory1Click(Sender: TObject);
var memoryDetail:TMemoryForm;
begin
  memoryDetail := TMemoryForm.Create(self);
  if memoryDetail.ShowModal = mrOk then
    list.Add(memoryDetail.getMemory);
  ShowDetail;
end;

procedure TMainForm.Searchonprice1Click(Sender: TObject);
var readPrice:TReadPriceForm;
    checkPrice,i:integer;
begin
  readPrice := TReadPriceForm.Create(self);
  DetailList.Lines.Clear;
  if readPrice.ShowModal = mrOk then begin
    checkPrice := readPrice.getPrice;
    for i := 0 to list.count-1 do
      begin
        if list.Get(i).getPrice <= checkPrice then
          DetailList.Lines.Add(list.Get(i).toString);
      end;
  end;
end;

procedure TMainForm.CPU1Click(Sender: TObject);
var i:integer;
    d:Detail;
begin
  DetailList.Lines.Clear;
  for i := 0 to list.count-1 do
    begin
      d := list.get(i);
      if d is CPU then
        DetailList.Lines.Add(d.toString);
    end;
end;

procedure TMainForm.VideoCard1Click(Sender: TObject);
var i:integer;
    d:Detail;
begin
  DetailList.Lines.Clear;
  for i := 0 to list.count-1 do
    begin
      d := list.get(i);
      if d is VideoCard then
        DetailList.Lines.Add(d.toString);
    end;

end;

procedure TMainForm.Memory1Click(Sender: TObject);
var i:integer;
    d:Detail;
begin
  DetailList.Lines.Clear;
  for i := 0 to list.count-1 do
    begin
      d := list.get(i);
      if d is Memory then
        DetailList.Lines.Add(d.toString);
    end;
end;
end.
