object smTecnico: TsmTecnico
  OldCreateOrder = False
  Height = 293
  Width = 251
  object fdQueryAllTecnico: TFDQuery
    CachedUpdates = True
    Connection = dmConnection.fdConnection
    SQL.Strings = (
      'SELECT * FROM tecnico')
    Left = 48
    Top = 24
  end
  object sslBin: TFDStanStorageBinLink
    Left = 160
    Top = 16
  end
  object sslJson: TFDStanStorageJSONLink
    Left = 160
    Top = 72
  end
  object fdQueryTecnico: TFDQuery
    CachedUpdates = True
    Connection = dmConnection.fdConnection
    UpdateOptions.UpdateTableName = 'tecnico'
    SQL.Strings = (
      'SELECT * FROM tecnico WHERE id = :ID')
    Left = 48
    Top = 80
    ParamData = <
      item
        Name = 'ID'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end>
  end
  object fdQueryDeleteTecnico: TFDQuery
    CachedUpdates = True
    Connection = dmConnection.fdConnection
    UpdateOptions.UpdateTableName = 'tecnico'
    SQL.Strings = (
      'DELETE FROM tecnico WHERE id = :ID')
    Left = 48
    Top = 144
    ParamData = <
      item
        Name = 'ID'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end>
  end
end
