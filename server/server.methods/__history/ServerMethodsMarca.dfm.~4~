object smMarca: TsmMarca
  OldCreateOrder = False
  Height = 297
  Width = 261
  object fdQueryAllMarca: TFDQuery
    CachedUpdates = True
    Connection = dmConnection.fdConnection
    SQL.Strings = (
      'SELECT * FROM marca')
    Left = 56
    Top = 32
  end
  object fdQueryMarca: TFDQuery
    CachedUpdates = True
    Connection = dmConnection.fdConnection
    UpdateOptions.UpdateTableName = 'marca'
    SQL.Strings = (
      'SELECT * FROM marca WHERE id = :ID')
    Left = 56
    Top = 96
    ParamData = <
      item
        Name = 'ID'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end>
  end
  object fdQueryDeleteMarca: TFDQuery
    Connection = dmConnection.fdConnection
    UpdateOptions.UpdateTableName = 'marca'
    SQL.Strings = (
      'DELETE FROM marca WHERE id = :ID')
    Left = 56
    Top = 160
    ParamData = <
      item
        Name = 'ID'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end>
  end
  object sslBin: TFDStanStorageBinLink
    Left = 184
    Top = 32
  end
  object sslJson: TFDStanStorageJSONLink
    Left = 184
    Top = 88
  end
end
