object CpuForm: TCpuForm
  Left = 323
  Top = 199
  Width = 345
  Height = 328
  Anchors = []
  BorderIcons = []
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1086#1094#1077#1089#1089#1086#1088
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Price: TLabel
    Left = 56
    Top = 32
    Width = 24
    Height = 13
    Caption = 'Price'
  end
  object Label2: TLabel
    Left = 56
    Top = 112
    Width = 42
    Height = 13
    Caption = #1063#1072#1089#1090#1086#1090#1072
  end
  object Label3: TLabel
    Left = 56
    Top = 192
    Width = 31
    Height = 13
    Caption = #1041#1088#1077#1085#1076
  end
  object Label1: TLabel
    Left = 240
    Top = 32
    Width = 9
    Height = 13
    Caption = 'Id'
  end
  object EditPrice: TEdit
    Left = 56
    Top = 64
    Width = 153
    Height = 21
    TabOrder = 0
    OnKeyPress = EditPriceKeyPress
  end
  object EditRate: TEdit
    Left = 56
    Top = 152
    Width = 153
    Height = 21
    TabOrder = 1
    OnKeyPress = EditRateKeyPress
  end
  object RadioButtonIntel: TRadioButton
    Left = 56
    Top = 224
    Width = 113
    Height = 17
    Caption = 'Intel'
    Checked = True
    TabOrder = 2
    TabStop = True
  end
  object RadioButtonAmd: TRadioButton
    Left = 176
    Top = 224
    Width = 113
    Height = 17
    Caption = 'Amd'
    TabOrder = 3
  end
  object ButtonEdit: TButton
    Left = 56
    Top = 256
    Width = 121
    Height = 17
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 4
    OnClick = ButtonEditClick
  end
  object EditId: TEdit
    Left = 232
    Top = 64
    Width = 81
    Height = 21
    TabOrder = 5
    OnKeyPress = EditIdKeyPress
  end
  object ButtonCancel: TButton
    Left = 208
    Top = 256
    Width = 97
    Height = 17
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 6
    OnClick = ButtonCancelClick
  end
end
