object VideoCardForm: TVideoCardForm
  Left = 673
  Top = 172
  Width = 351
  Height = 327
  Anchors = []
  BorderIcons = []
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1080#1076#1077#1086#1082#1072#1088#1090#1091
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
  object Label1: TLabel
    Left = 240
    Top = 32
    Width = 11
    Height = 13
    Caption = 'ID'
  end
  object Label2: TLabel
    Left = 56
    Top = 112
    Width = 42
    Height = 13
    Caption = #1063#1072#1089#1090#1086#1090#1072
  end
  object EditPrice: TEdit
    Left = 56
    Top = 64
    Width = 153
    Height = 21
    TabOrder = 0
  end
  object EditId: TEdit
    Left = 232
    Top = 64
    Width = 81
    Height = 21
    TabOrder = 1
  end
  object RadioGroup1: TRadioGroup
    Left = 64
    Top = 176
    Width = 145
    Height = 65
    Caption = #1055#1072#1084#1103#1090#1100
    Items.Strings = (
      '2'
      '4'
      '6'
      '8')
    TabOrder = 2
  end
  object EditRate: TEdit
    Left = 64
    Top = 136
    Width = 153
    Height = 21
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
  object ButtonCancel: TButton
    Left = 208
    Top = 256
    Width = 97
    Height = 17
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 5
  end
end
