object ReadPriceForm: TReadPriceForm
  Left = 808
  Top = 135
  Width = 254
  Height = 214
  Anchors = []
  BorderIcons = []
  Caption = #1042#1074#1086#1076' '#1094#1077#1085#1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 72
    Top = 40
    Width = 68
    Height = 13
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1094#1077#1085#1091
  end
  object EditPrice: TEdit
    Left = 56
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 0
    OnKeyPress = EditPriceKeyPress
  end
  object ButtonPrice: TButton
    Left = 56
    Top = 128
    Width = 121
    Height = 25
    Caption = #1055#1088#1086#1076#1086#1083#1078#1080#1090#1100
    TabOrder = 1
    OnClick = ButtonPriceClick
  end
end
