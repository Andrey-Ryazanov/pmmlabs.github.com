object MemoryForm: TMemoryForm
  Left = 671
  Top = 173
  Width = 365
  Height = 325
  Anchors = []
  BorderIcons = []
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1087#1077#1088#1072#1090#1080#1074#1085#1091#1102' '#1087#1072#1084#1103#1090#1100
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
  object EditId: TEdit
    Left = 232
    Top = 64
    Width = 81
    Height = 21
    TabOrder = 1
    OnKeyPress = EditIdKeyPress
  end
  object ButtonEdit: TButton
    Left = 56
    Top = 256
    Width = 121
    Height = 17
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 2
    OnClick = ButtonEditClick
  end
  object RadioGroupSize: TRadioGroup
    Left = 48
    Top = 120
    Width = 137
    Height = 89
    Caption = #1056#1072#1079#1084#1077#1088
    Items.Strings = (
      '2'
      '4'
      '8'
      '16')
    TabOrder = 3
  end
  object RadioGroupGeneration: TRadioGroup
    Left = 216
    Top = 120
    Width = 105
    Height = 73
    Caption = #1055#1086#1082#1086#1083#1077#1085#1080#1077
    Items.Strings = (
      'DDR2'
      'DDR3'
      'DDR4')
    TabOrder = 4
  end
  object ButtonCancel: TButton
    Left = 208
    Top = 256
    Width = 97
    Height = 17
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 5
    OnClick = ButtonCancelClick
  end
end
