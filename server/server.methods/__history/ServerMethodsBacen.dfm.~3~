object smBacen: TsmBacen
  OldCreateOrder = False
  Height = 315
  Width = 308
  object fdQueryAllBacen: TFDQuery
    CachedUpdates = True
    Connection = dmConnection.fdConnection
    SQL.Strings = (
      'SELECT * FROM bacen')
    Left = 40
    Top = 32
  end
  object fdQueryBacen: TFDQuery
    CachedUpdates = True
    Connection = dmConnection.fdConnection
    UpdateOptions.UpdateTableName = 'bacen'
    SQL.Strings = (
      'SELECT * FROM bacen WHERE id = :ID')
    Left = 40
    Top = 96
    ParamData = <
      item
        Name = 'ID'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end>
  end
  object fdQueryDeleteBacen: TFDQuery
    CachedUpdates = True
    Connection = dmConnection.fdConnection
    UpdateOptions.UpdateTableName = 'bacen'
    SQL.Strings = (
      'DELETE FROM bacen WHERE id = :ID')
    Left = 40
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
    Left = 192
    Top = 24
  end
  object sslJson: TFDStanStorageJSONLink
    Left = 240
    Top = 24
  end
end
