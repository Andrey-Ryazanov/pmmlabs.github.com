unit UCPUForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UCPU;

type
  TCpuForm = class(TForm)
    Price: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EditPrice: TEdit;
    EditRate: TEdit;
    RadioButtonIntel: TRadioButton;
    RadioButtonAmd: TRadioButton;
    ButtonEdit: TButton;
    EditId: TEdit;
    Label1: TLabel;
    ButtonCancel: TButton;
    procedure EditPriceKeyPress(Sender: TObject; var Key: Char);
    procedure EditIdKeyPress(Sender: TObject; var Key: Char);
    procedure EditRateKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonEditClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    function checkKey(k:char):Char;
  private
    { Private declarations }
  public
    function getCpu:CPU;
  end;

var
  CpuForm: TCpuForm;

implementation

{$R *.dfm}

 function TCpuForm.getCpu:CPU;
 var m:Tmark;
 begin
  if RadioButtonIntel.Checked then
    m := intel
  else
    m := amd;
  result :=  CPU.Create(StrToInt(EditId.Text),StrtoInt(EditPrice.text), Strtoint(EditRate.text), m);
 end;

function TCpuForm.checkKey(k:char):Char;
begin
  if not((k in ['0'..'9']) or (k = #8)) then
    k := #0;
 result := k;
end;

procedure TCpuForm.EditPriceKeyPress(Sender: TObject; var Key: Char);
begin
 if not((key in ['0'..'9']) or (key = #8)) then
    key := #0;
end;
procedure TCpuForm.EditIdKeyPress(Sender: TObject; var Key: Char);
begin
  if not((key in ['0'..'9']) or (key = #8)) then
    key := #0;
end;

procedure TCpuForm.EditRateKeyPress(Sender: TObject; var Key: Char);
begin
  if not((key in ['0'..'9']) or (key = #8)) then
    key := #0;
end;

procedure TCpuForm.ButtonEditClick(Sender: TObject);
begin
  if (trim(EditID.Text) <> '') and (trim(EditPrice.Text) <> '') and (trim(EditRate.Text) <> '')then
    ModalResult := mrOk;
end;


procedure TCpuForm.ButtonCancelClick(Sender: TObject);
begin
  
  ModalResult := mrOk;
end;

end.
