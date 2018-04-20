object smServico: TsmServico
  OldCreateOrder = False
  Height = 221
  Width = 227
  object fdQueryAllServico: TFDQuery
    CachedUpdates = True
    Connection = dmConnection.fdConnection
    SQL.Strings = (
      'SELECT * FROM servico')
    Left = 40
    Top = 16
  end
  object fdQueryServico: TFDQuery
    CachedUpdates = True
    Connection = dmConnection.fdConnection
    UpdateOptions.UpdateTableName = 'servico'
    SQL.Strings = (
      'SELECT * FROM servico WHERE id = :ID')
    Left = 40
    Top = 64
    ParamData = <
      item
        Name = 'ID'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end>
  end
  object fdQueryDeleteServico: TFDQuery
    CachedUpdates = True
    Connection = dmConnection.fdConnection
    UpdateOptions.UpdateTableName = 'servico'
    SQL.Strings = (
      'DELETE FROM servico WHERE id = :ID')
    Left = 40
    Top = 112
    ParamData = <
      item
        Name = 'ID'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end>
  end
  object sslBin: TFDStanStorageBinLink
    Left = 144
    Top = 16
  end
  object sslJson: TFDStanStorageJSONLink
    Left = 176
    Top = 16
  end
end
