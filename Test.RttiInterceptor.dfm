object formTestRttiInterceptor: TformTestRttiInterceptor
  Left = 0
  Top = 0
  Caption = 'Testar RttiInterceptor'
  ClientHeight = 231
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    505
    231)
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 489
    Height = 185
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 199
    Width = 75
    Height = 25
    Caption = 'Testar'
    TabOrder = 1
    OnClick = Button1Click
  end
end
