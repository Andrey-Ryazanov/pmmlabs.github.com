object MainForm: TMainForm
  Left = 617
  Top = 169
  Width = 510
  Height = 425
  Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1076#1077#1090#1072#1083#1103#1084#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    494
    366)
  PixelsPerInch = 96
  TextHeight = 13
  object DetailList: TMemo
    Left = 0
    Top = 8
    Width = 489
    Height = 354
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'Memo')
    TabOrder = 0
  end
  object MainMenu: TMainMenu
    Left = 288
    Top = 104
    object File1: TMenuItem
      Caption = 'File'
      object Open1: TMenuItem
        Caption = 'Open'
      end
    end
    object Edit1: TMenuItem
      Caption = 'Edit'
      object Add1: TMenuItem
        Caption = 'Add'
        object AddCPU1: TMenuItem
          Caption = 'Add CPU'
          OnClick = AddCPU1Click
        end
        object AddVideoCard1: TMenuItem
          Caption = 'Add VideoCard'
          OnClick = AddVideoCard1Click
        end
        object AddMemory1: TMenuItem
          Caption = 'Add Memory'
        end
      end
    end
  end
end
