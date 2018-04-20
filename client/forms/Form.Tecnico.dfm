object frmTecnico: TfrmTecnico
  Left = 0
  Top = 0
  Caption = 'T'#233'cnico'
  ClientHeight = 274
  ClientWidth = 340
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgcTecnico: TPageControl
    Left = 0
    Top = 0
    Width = 340
    Height = 274
    ActivePage = tsConsulta
    Align = alClient
    TabOrder = 0
    object tsConsulta: TTabSheet
      Caption = 'Consulta'
      object grdTecnico: TDBGrid
        Left = 0
        Top = 80
        Width = 332
        Height = 166
        Align = alBottom
        DataSource = dsTecnico
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = grdTecnicoDblClick
      end
      object btnNew: TButton
        Left = 254
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
        Width = 29
        Height = 13
        Caption = 'NOME'
        FocusControl = edtNome
      end
      object edtId: TDBEdit
        Left = 3
        Top = 24
        Width = 29
        Height = 21
        DataField = 'ID'
        DataSource = dsTecnico
        Enabled = False
        TabOrder = 0
      end
      object edtNome: TDBEdit
        Left = 3
        Top = 64
        Width = 321
        Height = 21
        DataField = 'NOME'
        DataSource = dsTecnico
        TabOrder = 1
      end
      object btnDelete: TButton
        Left = 3
        Top = 202
        Width = 75
        Height = 41
        Caption = 'Deletar'
        TabOrder = 2
        OnClick = btnDeleteClick
      end
      object btnClean: TButton
        Left = 168
        Top = 202
        Width = 75
        Height = 41
        Caption = 'Limpar'
        TabOrder = 3
        OnClick = btnCleanClick
      end
      object btnSave: TButton
        Left = 249
        Top = 202
        Width = 75
        Height = 41
        Caption = 'Salvar'
        TabOrder = 4
        OnClick = btnSaveClick
      end
    end
  end
  object fdMemTableTecnico: TFDMemTable
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    AutoCommitUpdates = False
    Left = 176
    Top = 56
    object intgrfldMemTableTecnicoID: TIntegerField
      FieldName = 'ID'
    end
    object wdstrngfldMemTableTecnicoNOME: TWideStringField
      FieldName = 'NOME'
      Size = 100
    end
  end
  object dsTecnico: TDataSource
    DataSet = fdMemTableTecnico
    Left = 216
    Top = 56
  end
  object sslBin: TFDStanStorageBinLink
    Left = 176
    Top = 88
  end
  object sslJson: TFDStanStorageJSONLink
    Left = 216
    Top = 88
  end
end
