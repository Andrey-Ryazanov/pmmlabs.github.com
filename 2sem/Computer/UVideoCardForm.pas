unit UVideoCardForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, UVideoCard;

type
  TVideoCardForm = class(TForm)
    Price: TLabel;
    Label1: TLabel;
    EditPrice: TEdit;
    EditId: TEdit;
    RadioGroup1: TRadioGroup;
    Label2: TLabel;
    EditRate: TEdit;
    ButtonEdit: TButton;
    ButtonCancel: TButton;
    function checkKey(k:char):Char;
    procedure EditPriceKeyPress(Sender: TObject; var Key: Char);
    procedure EditIdKeyPress(Sender: TObject; var Key: Char);
    procedure EditRateKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    function getVideoCard:VideoCard;
  end;

var
  VideoCardForm: TVideoCardForm;

implementation

uses Math;

{$R *.dfm}
function TVideoCardForm.getVideoCard:VideoCard;
var v:integer;
begin
  case RadioGroup1.ItemIndex of
    0:v := 2;
    1:v := 4;
    2:v:= 6;
    3:v :=8;
    else
      v := 2;
  end;
  result := VideoCard.Create(StrToInt(EditId.text),StrToInt(EditPrice.Text),StrToInt(EditRate.text),v);
end;


function TVideoCardForm.checkKey(k:char):Char;
begin
  if not((k in ['0'..'9']) or (k = #8)) then
    result := #0
end;

procedure TVideoCardForm.EditPriceKeyPress(Sender: TObject; var Key: Char);
begin
 if not((key in ['0'..'9']) or (key = #8)) then
    key := #0
end;
procedure TVideoCardForm.EditIdKeyPress(Sender: TObject; var Key: Char);
begin
  if not((key in ['0'..'9']) or (key = #8)) then
    key := #0
end;

procedure TVideoCardForm.EditRateKeyPress(Sender: TObject; var Key: Char);
begin
  if not((key in ['0'..'9']) or (key = #8)) then
    key := #0
end;

procedure TVideoCardForm.ButtonEditClick(Sender: TObject);
begin
  if (trim(EditID.Text) <> '') and (trim(EditPrice.Text) <> '') and (trim(EditRate.Text) <> '')then
    ModalResult := mrOk;
end;

end.
