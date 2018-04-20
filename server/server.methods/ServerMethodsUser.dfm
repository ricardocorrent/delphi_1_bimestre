object smUser: TsmUser
  OldCreateOrder = False
  Height = 251
  Width = 231
  object fdQueryAllUser: TFDQuery
    CachedUpdates = True
    Connection = dmConnection.fdConnection
    SQL.Strings = (
      'SELECT * FROM usuario')
    Left = 40
    Top = 16
  end
  object fdQueryUser: TFDQuery
    CachedUpdates = True
    Connection = dmConnection.fdConnection
    UpdateOptions.UpdateTableName = 'usuario'
    SQL.Strings = (
      'SELECT * FROM usuario WHERE id = :ID')
    Left = 40
    Top = 72
    ParamData = <
      item
        Name = 'ID'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end>
  end
  object fdQueryDeleteUser: TFDQuery
    CachedUpdates = True
    Connection = dmConnection.fdConnection
    SQL.Strings = (
      'DELETE FROM usuario WHERE id = :ID')
    Left = 40
    Top = 128
    ParamData = <
      item
        Name = 'ID'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end>
  end
  object sslBin: TFDStanStorageBinLink
    Left = 160
    Top = 32
  end
  object sslJson: TFDStanStorageJSONLink
    Left = 160
    Top = 80
  end
  object fdQueryAccessUser: TFDQuery
    CachedUpdates = True
    Connection = dmConnection.fdConnection
    SQL.Strings = (
      'SELECT COUNT(1) AS access'
      'FROM usuario'
      'WHERE login = :LOGIN AND senha = :SENHA'
      'LIMIT 1')
    Left = 40
    Top = 184
    ParamData = <
      item
        Name = 'LOGIN'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'SENHA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
end
