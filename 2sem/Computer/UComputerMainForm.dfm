object MainForm: TMainForm
  Left = 528
  Top = 172
  Width = 510
  Height = 407
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
    348)
  PixelsPerInch = 96
  TextHeight = 13
  object DetailList: TMemo
    Left = 0
    Top = 8
    Width = 489
    Height = 336
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
  end
  object MainMenu: TMainMenu
    Left = 288
    Top = 104
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
          OnClick = AddMemory1Click
        end
      end
    end
    object Show1: TMenuItem
      Caption = 'Reset view'
      OnClick = Show1Click
    end
    object Find1: TMenuItem
      Caption = 'Search'
      object Searchonprice1: TMenuItem
        Caption = 'Search on price'
        OnClick = Searchonprice1Click
      end
      object Searchondetail1: TMenuItem
        Caption = 'Search on detail'
        object CPU1: TMenuItem
          Caption = 'CPU'
          OnClick = CPU1Click
        end
        object VideoCard1: TMenuItem
          Caption = 'VideoCard'
          OnClick = VideoCard1Click
        end
        object Memory1: TMenuItem
          Caption = 'Memory'
          OnClick = Memory1Click
        end
      end
    end
  end
end
