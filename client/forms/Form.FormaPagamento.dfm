object frmFormaPagamento: TfrmFormaPagamento
  Left = 0
  Top = 0
  Caption = 'Forma de Pagamento'
  ClientHeight = 238
  ClientWidth = 611
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
  object pgcFormaPagamento: TPageControl
    Left = 0
    Top = 0
    Width = 611
    Height = 238
    ActivePage = tsCadastro
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 643
    ExplicitHeight = 274
    object tsConsulta: TTabSheet
      Caption = 'tdb'
      ExplicitWidth = 635
      ExplicitHeight = 246
      object grdFormaPagamento: TDBGrid
        Left = 0
        Top = 47
        Width = 603
        Height = 163
        Align = alBottom
        DataSource = dsFormaPagamento
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object btnNew: TButton
        Left = 3
        Top = 3
        Width = 75
        Height = 38
        Caption = 'Novo'
        TabOrder = 1
      end
    end
    object tsCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      ExplicitWidth = 635
      ExplicitHeight = 246
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
        Top = 48
        Width = 59
        Height = 13
        Caption = 'DESCRICAO'
        FocusControl = edtDescricao
      end
      object lbl3: TLabel
        Left = 3
        Top = 91
        Width = 24
        Height = 13
        Caption = 'TIPO'
      end
      object lbl4: TLabel
        Left = 129
        Top = 91
        Width = 72
        Height = 13
        Caption = 'EXIBIR_VENDA'
      end
      object lbl5: TLabel
        Left = 363
        Top = 91
        Width = 69
        Height = 13
        Caption = 'EXIBIR_BAIXA'
      end
      object lbl6: TLabel
        Left = 471
        Top = 91
        Width = 79
        Height = 13
        Caption = 'ACEITA_TROCO'
      end
      object lbl7: TLabel
        Left = 242
        Top = 91
        Width = 41
        Height = 13
        Caption = 'ESPECIE'
      end
      object edtId: TDBEdit
        Left = 3
        Top = 16
        Width = 41
        Height = 21
        DataField = 'ID'
        DataSource = dsFormaPagamento
        Enabled = False
        TabOrder = 0
      end
      object edtDescricao: TDBEdit
        Left = 3
        Top = 64
        Width = 589
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = dsFormaPagamento
        TabOrder = 1
      end
      object btnDelete: TButton
        Left = 3
        Top = 152
        Width = 75
        Height = 41
        Caption = 'Delete'
        TabOrder = 2
      end
      object btnClean: TButton
        Left = 419
        Top = 152
        Width = 75
        Height = 41
        Caption = 'Limpar'
        TabOrder = 3
        OnClick = btnCleanClick
      end
      object btnSave: TButton
        Left = 517
        Top = 152
        Width = 75
        Height = 41
        Caption = 'Salvar'
        TabOrder = 4
      end
      object cbbExibirVenda: TComboBox
        Left = 129
        Top = 107
        Width = 88
        Height = 21
        TabOrder = 5
        Items.Strings = (
          'Sim'
          'N'#227'o')
      end
      object cbbExibirBaixa: TComboBox
        Left = 363
        Top = 107
        Width = 83
        Height = 21
        TabOrder = 6
        Items.Strings = (
          'Sim'
          'N'#227'o')
      end
      object cbbAceitaTroco: TComboBox
        Left = 471
        Top = 107
        Width = 121
        Height = 21
        TabOrder = 7
        Items.Strings = (
          'Sim'
          'N'#227'o')
      end
      object cbbTipo: TComboBox
        Left = 3
        Top = 107
        Width = 102
        Height = 21
        TabOrder = 8
        Items.Strings = (
          'Nenhum'
          'A vista'
          'A prazo')
      end
      object cbbEspecie: TComboBox
        Left = 242
        Top = 107
        Width = 97
        Height = 21
        TabOrder = 9
        Items.Strings = (
          'Dinheiro'
          'Cart'#227'o'
          'Outra')
      end
    end
  end
  object fdMemTableFormaPagamento: TFDMemTable
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    AutoCommitUpdates = False
    Left = 312
    Top = 24
    object intgrfldMemTableFormaPagamentoID: TIntegerField
      FieldName = 'ID'
    end
    object wdstrngfldMemTableFormaPagamentoDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Size = 45
    end
    object wdstrngfldMemTableFormaPagamentoTIPO: TWideStringField
      FieldName = 'TIPO'
    end
    object intgrfldMemTableFormaPagamentoEXIBIR_VENDA: TIntegerField
      FieldName = 'EXIBIR_VENDA'
    end
    object intgrfldMemTableFormaPagamentoEXIBIR_BAIXA: TIntegerField
      FieldName = 'EXIBIR_BAIXA'
    end
    object intgrfldMemTableFormaPagamentoACEITA_TROCO: TIntegerField
      FieldName = 'ACEITA_TROCO'
    end
    object wdstrngfldMemTableFormaPagamentoESPECIE: TWideStringField
      FieldName = 'ESPECIE'
    end
  end
  object dsFormaPagamento: TDataSource
    DataSet = fdMemTableFormaPagamento
    Left = 352
    Top = 24
  end
  object sslBin: TFDStanStorageBinLink
    Left = 400
    Top = 24
  end
  object sslJson: TFDStanStorageJSONLink
    Left = 448
    Top = 24
  end
end
