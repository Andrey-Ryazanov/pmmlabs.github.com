object MainForm: TMainForm
  Left = 752
  Top = 134
  Width = 494
  Height = 450
  Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1076#1077#1088#1077#1074#1100#1103#1084#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LabelElement: TLabel
    Left = 56
    Top = 208
    Width = 77
    Height = 13
    Caption = #1042#1074#1086#1076' '#1101#1083#1077#1084#1077#1085#1090#1072
  end
  object rgAction: TRadioGroup
    Left = 8
    Top = 8
    Width = 209
    Height = 193
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1076#1077#1081#1089#1090#1074#1080#1077
    Items.Strings = (
      #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1089#1083#1091#1095#1072#1081#1085#1086
      #1044#1086#1073#1072#1074#1080#1090#1100' '#1101#1083#1077#1084#1077#1085#1090
      #1053#1072#1081#1090#1080' '#1101#1083#1077#1084#1077#1085#1090
      #1059#1076#1072#1083#1080#1090#1100' '#1101#1083#1077#1084#1077#1085#1090
      #1054#1095#1080#1089#1090#1080#1090#1100
      #1055#1088#1086#1074#1077#1088#1082#1072' '#1085#1072' '#1073#1072#1083#1072#1085#1089#1080#1088#1086#1074#1082#1091' '#1076#1077#1088#1077#1074#1072)
    TabOrder = 0
    OnClick = rgActionClick
  end
  object ButtonDoAction: TButton
    Left = 40
    Top = 264
    Width = 137
    Height = 33
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    TabOrder = 1
    OnClick = ButtonDoActionClick
  end
  object ButtonView: TButton
    Left = 40
    Top = 312
    Width = 137
    Height = 33
    Caption = #1055#1088#1086#1089#1084#1086#1090#1088
    TabOrder = 2
  end
  object ButtonClose: TButton
    Left = 40
    Top = 360
    Width = 137
    Height = 33
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 3
    OnClick = ButtonCloseClick
  end
  object TreeView: TTreeView
    Left = 224
    Top = 24
    Width = 233
    Height = 361
    Indent = 19
    TabOrder = 4
  end
  object SpinEdit: TSpinEdit
    Left = 48
    Top = 224
    Width = 121
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 5
    Value = 0
  end
end
