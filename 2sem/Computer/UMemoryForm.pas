unit UMemoryForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UDetail, UMemory, ExtCtrls;

type
  TMemoryForm = class(TForm)
    EditPrice: TEdit;
    Price: TLabel;
    Label1: TLabel;
    EditId: TEdit;
    ButtonEdit: TButton;
    RadioGroupSize: TRadioGroup;
    RadioGroupGeneration: TRadioGroup;
    ButtonCancel: TButton;
    procedure ButtonEditClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure EditPriceKeyPress(Sender: TObject; var Key: Char);
    procedure EditIdKeyPress(Sender: TObject; var Key: Char);
  private

  public
    function getMemory:Memory;
  end;

var
  MemoryForm: TMemoryForm;

implementation

{$R *.dfm}

function TMemoryForm.getMemory:Memory;
var s:integer;
    gen:Tgeneration;
begin
  case RadioGroupSize.ItemIndex of
    0: s := 2;
    1: s := 4;
    2: s := 8;
    3: s := 16;
    else s := 8;
  end;

  case RadioGroupGeneration.ItemIndex of
    0: gen := DDR2;
    1: gen := DDR3;
    2: gen := DDR4;
    else
      gen := DDR3;
  end;
  result := Memory.Create(StrToInt(EditId.Text), StrToInt(EditPrice.Text), s, gen);
end;

procedure TMemoryForm.EditPriceKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;
procedure TMemoryForm.EditIdKeyPress(Sender: TObject; var Key: Char);
begin
   if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;
procedure TMemoryForm.ButtonEditClick(Sender: TObject);
begin
  if (trim(EditID.Text) <> '') and (trim(EditPrice.Text) <> '') then
    ModalResult := mrOk;
end;

procedure TMemoryForm.ButtonCancelClick(Sender: TObject);
begin
  MemoryForm.Close;
end;
end.
