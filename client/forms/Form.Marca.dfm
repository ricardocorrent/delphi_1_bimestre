object frmMarca: TfrmMarca
  Left = 0
  Top = 0
  Caption = 'Marca'
  ClientHeight = 274
  ClientWidth = 424
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
  object pgcMarca: TPageControl
    Left = 0
    Top = 0
    Width = 424
    Height = 274
    ActivePage = tsConsulta
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 643
    object tsConsulta: TTabSheet
      Caption = 'Consulta'
      ExplicitWidth = 635
      object btnNew: TButton
        Left = 338
        Top = 3
        Width = 75
        Height = 41
        Caption = 'Novo'
        TabOrder = 0
        OnClick = btnNewClick
      end
      object grdMarca: TDBGrid
        Left = 0
        Top = 50
        Width = 416
        Height = 196
        Align = alBottom
        DataSource = dsMarca
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = grdMarcaDblClick
      end
    end
    object tsCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      ExplicitWidth = 635
      object lbl1: TLabel
        Left = 3
        Top = 0
        Width = 11
        Height = 13
        Caption = 'ID'
        FocusControl = edtId
      end
      object lbl2: TLabel
        Left = 3
        Top = 40
        Width = 59
        Height = 13
        Caption = 'DESCRICAO'
        FocusControl = edtDescricao
      end
      object edtId: TDBEdit
        Left = 3
        Top = 13
        Width = 41
        Height = 21
        DataField = 'ID'
        DataSource = dsMarca
        Enabled = False
        TabOrder = 0
      end
      object edtDescricao: TDBEdit
        Left = 3
        Top = 59
        Width = 410
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = dsMarca
        TabOrder = 1
      end
      object btnDelete: TButton
        Left = 3
        Top = 96
        Width = 75
        Height = 41
        Caption = 'Delete'
        TabOrder = 2
        OnClick = btnDeleteClick
      end
      object btnClear: TButton
        Left = 248
        Top = 96
        Width = 75
        Height = 41
        Caption = 'Limpar'
        TabOrder = 3
        OnClick = btnClearClick
      end
      object btnSave: TButton
        Left = 338
        Top = 96
        Width = 75
        Height = 41
        Caption = 'Salvar'
        TabOrder = 4
        OnClick = btnSaveClick
      end
    end
  end
  object fdMemTableMarca: TFDMemTable
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    AutoCommitUpdates = False
    Left = 144
    Top = 40
    object intgrfldMemTableMarcaID: TIntegerField
      FieldName = 'ID'
    end
    object wdstrngfldMemTableMarcaDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Size = 45
    end
  end
  object dsMarca: TDataSource
    DataSet = fdMemTableMarca
    Left = 208
    Top = 40
  end
  object sslBin: TFDStanStorageBinLink
    Left = 248
    Top = 40
  end
  object sslJson: TFDStanStorageJSONLink
    Left = 280
    Top = 40
  end
end
