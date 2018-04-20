object frmBacen: TfrmBacen
  Left = 0
  Top = 0
  Caption = 'Bacen'
  ClientHeight = 274
  ClientWidth = 604
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgcBacen: TPageControl
    Left = 0
    Top = 0
    Width = 604
    Height = 274
    ActivePage = tsConsulta
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 643
    object tsConsulta: TTabSheet
      Caption = 'Consulta'
      ExplicitWidth = 635
      object grdBacen: TDBGrid
        Left = 0
        Top = 50
        Width = 596
        Height = 196
        Align = alBottom
        DataSource = dsBacen
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = grdBacenDblClick
      end
      object btnNew: TButton
        Left = 3
        Top = 3
        Width = 75
        Height = 41
        Caption = 'Novo'
        TabOrder = 1
        OnClick = btnNewClick
      end
    end
    object tsCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      ExplicitWidth = 635
      object lbl1: TLabel
        Left = 3
        Top = 8
        Width = 11
        Height = 13
        Caption = 'ID'
        FocusControl = edtId
      end
      object lbl2: TLabel
        Left = 3
        Top = 48
        Width = 59
        Height = 13
        Caption = 'DESCRICAO'
        FocusControl = edtDescricao
      end
      object lbl3: TLabel
        Left = 3
        Top = 88
        Width = 43
        Height = 13
        Caption = 'NUMERO'
        FocusControl = edtNumero
      end
      object edtId: TDBEdit
        Left = 3
        Top = 24
        Width = 43
        Height = 21
        DataField = 'ID'
        DataSource = dsBacen
        Enabled = False
        TabOrder = 0
      end
      object edtDescricao: TDBEdit
        Left = 3
        Top = 64
        Width = 589
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = dsBacen
        TabOrder = 1
      end
      object edtNumero: TDBEdit
        Left = 3
        Top = 104
        Width = 43
        Height = 21
        DataField = 'NUMERO'
        DataSource = dsBacen
        TabOrder = 2
      end
      object btnDelete: TButton
        Left = 3
        Top = 160
        Width = 75
        Height = 41
        Caption = 'Delete'
        TabOrder = 3
        OnClick = btnDeleteClick
      end
      object btnClean: TButton
        Left = 413
        Top = 160
        Width = 75
        Height = 41
        Caption = 'Limpar'
        TabOrder = 4
        OnClick = btnCleanClick
      end
      object btnSave: TButton
        Left = 517
        Top = 160
        Width = 75
        Height = 41
        Caption = 'Salvar'
        TabOrder = 5
        OnClick = btnSaveClick
      end
    end
  end
  object fdMemTableBacen: TFDMemTable
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    AutoCommitUpdates = False
    Left = 272
    Top = 32
    object intgrfldMemTableBacenID: TIntegerField
      FieldName = 'ID'
    end
    object wdstrngfldMemTableBacenDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Size = 45
    end
    object wdstrngfldMemTableBacenNUMERO: TWideStringField
      FieldName = 'NUMERO'
      Size = 3
    end
  end
  object dsBacen: TDataSource
    DataSet = fdMemTableBacen
    Left = 320
    Top = 32
  end
  object sslBin: TFDStanStorageBinLink
    Left = 376
    Top = 32
  end
  object sslJson: TFDStanStorageJSONLink
    Left = 408
    Top = 32
  end
end
