program ComputerWarehouse;

uses
  Forms,
  SysUtils,
  UComputerMainForm {MainForm},
  UCPUForm {CpuForm},
  UVideoCardForm in 'UVideoCardForm.pas' {VideoCardForm},
  UMemoryForm in 'UMemoryForm.pas' {MemoryForm},
  UReadPrice in 'UReadPrice.pas' {ReadPriceForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TCpuForm, CpuForm);
  Application.CreateForm(TVideoCardForm, VideoCardForm);
  Application.CreateForm(TMemoryForm, MemoryForm);
  Application.CreateForm(TReadPriceForm, ReadPriceForm);
  Application.Run;
end.
