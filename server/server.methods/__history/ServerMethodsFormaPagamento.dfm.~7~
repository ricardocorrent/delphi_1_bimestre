object smFormaPagamento: TsmFormaPagamento
  OldCreateOrder = False
  Height = 304
  Width = 331
  object fdQueryAllFormaPagamento: TFDQuery
    CachedUpdates = True
    Connection = dmConnection.fdConnection
    SQL.Strings = (
      'SELECT * FROM forma_pagamento')
    Left = 80
    Top = 48
  end
  object fdQueryFormaPagamento: TFDQuery
    CachedUpdates = True
    Connection = dmConnection.fdConnection
    UpdateOptions.UpdateTableName = 'forma_pagamento'
    SQL.Strings = (
      'SELECT * FROM forma_pagamento WHERE id = :ID')
    Left = 80
    Top = 104
    ParamData = <
      item
        Name = 'ID'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end>
  end
  object fdQueryDeleteFormaPagamento: TFDQuery
    CachedUpdates = True
    Connection = dmConnection.fdConnection
    UpdateOptions.UpdateTableName = 'forma_pagamento'
    SQL.Strings = (
      'DELETE FROM forma_pagamento WHERE id = :ID')
    Left = 80
    Top = 168
    ParamData = <
      item
        Name = 'ID'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end>
  end
  object sslBin: TFDStanStorageBinLink
    Left = 232
    Top = 32
  end
  object sslJson: TFDStanStorageJSONLink
    Left = 272
    Top = 32
  end
end
