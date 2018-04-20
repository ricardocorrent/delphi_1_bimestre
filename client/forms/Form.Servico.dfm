object frmServico: TfrmServico
  Left = 0
  Top = 0
  Caption = 'Servi'#231'o'
  ClientHeight = 232
  ClientWidth = 450
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
  object pgcServico: TPageControl
    Left = 0
    Top = 0
    Width = 450
    Height = 232
    ActivePage = tsCadastro
    Align = alClient
    TabOrder = 0
    ExplicitTop = 8
    ExplicitWidth = 643
    ExplicitHeight = 274
    object tsConsulta: TTabSheet
      Caption = 'Consulta'
      ExplicitWidth = 635
      ExplicitHeight = 246
      object grdServico: TDBGrid
        Left = 0
        Top = 63
        Width = 442
        Height = 141
        Align = alBottom
        DataSource = dsServico
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = grdServicoDblClick
      end
      object btnNew: TButton
        Left = 3
        Top = 16
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
        Top = 40
        Width = 59
        Height = 13
        Caption = 'DESCRICAO'
        FocusControl = edtDescricao
      end
      object lbl3: TLabel
        Left = 3
        Top = 80
        Width = 33
        Height = 13
        Caption = 'VALOR'
      end
      object edtId: TDBEdit
        Left = 3
        Top = 16
        Width = 59
        Height = 21
        DataField = 'ID'
        DataSource = dsServico
        Enabled = False
        TabOrder = 0
      end
      object edtDescricao: TDBEdit
        Left = 3
        Top = 56
        Width = 433
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = dsServico
        TabOrder = 1
      end
      object btnDelete: TButton
        Left = 3
        Top = 136
        Width = 75
        Height = 41
        Caption = 'Delete'
        TabOrder = 2
        OnClick = btnDeleteClick
      end
      object btnClear: TButton
        Left = 272
        Top = 136
        Width = 75
        Height = 41
        Caption = 'Clear'
        TabOrder = 3
        OnClick = btnClearClick
      end
      object btnSave: TButton
        Left = 361
        Top = 136
        Width = 75
        Height = 41
        Caption = 'Save'
        TabOrder = 4
        OnClick = btnSaveClick
      end
      object edtValor: TDBEdit
        Left = 3
        Top = 99
        Width = 134
        Height = 21
        DataField = 'VALOR'
        DataSource = dsServico
        TabOrder = 5
      end
    end
  end
  object fdMemTableServico: TFDMemTable
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    AutoCommitUpdates = False
    Left = 232
    Top = 32
    object intgrfldMemTableServicoID: TIntegerField
      FieldName = 'ID'
    end
    object wdstrngfldMemTableServicoDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object crncyfldMemTableServicoVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
  end
  object dsServico: TDataSource
    DataSet = fdMemTableServico
    Left = 320
    Top = 32
  end
  object sslBin: TFDStanStorageBinLink
    Left = 360
    Top = 32
  end
  object sslJson: TFDStanStorageJSONLink
    Left = 400
    Top = 32
  end
end
