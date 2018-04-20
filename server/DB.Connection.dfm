object dmConnection: TdmConnection
  OldCreateOrder = False
  Height = 150
  Width = 215
  object fdConnection: TFDConnection
    Params.Strings = (
      'Database=trabalho1'
      'User_Name=postgres'
      'Password=root'
      'Server=localhost'
      'DriverID=pG')
    LoginPrompt = False
    Left = 24
    Top = 16
  end
  object dlPg: TFDPhysPgDriverLink
    Left = 24
    Top = 80
  end
  object wcGui: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 168
    Top = 24
  end
end
