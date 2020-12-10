unit UReadPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TReadPriceForm = class(TForm)
    Label1: TLabel;
    EditPrice: TEdit;
    ButtonPrice: TButton;
    procedure EditPriceKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonPriceClick(Sender: TObject);
  private
    { Private declarations }
  public
    function getPrice:integer;
  end;

var
  ReadPriceForm: TReadPriceForm;

implementation

{$R *.dfm}

procedure TReadPriceForm.EditPriceKeyPress(Sender: TObject; var Key: Char);
begin
  if not((key in ['0'..'9']) or (key = #8)) then
    key := #0
end;

procedure TReadPriceForm.ButtonPriceClick(Sender: TObject);
begin
   if trim(EditPrice.Text) <> '' then
    ModalResult := mrOk;
end;

function TReadPriceForm.getPrice:integer;
begin
  result := StrToInt(EditPrice.text);
end;
end.
