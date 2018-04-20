object frmApp: TfrmApp
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Ordem de servi'#231'o'
  ClientHeight = 274
  ClientWidth = 643
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmMenu
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object mmMenu: TMainMenu
    Left = 48
    Top = 32
    object Cadastros1: TMenuItem
      Caption = '&Cadastros'
      object Acesso1: TMenuItem
        Caption = 'Acesso'
        object Usuario1: TMenuItem
          Caption = '&Usu'#225'rio'
          OnClick = Usuario1Click
        end
      end
      object Financeiro1: TMenuItem
        Caption = 'Financeiro'
        object Bacen1: TMenuItem
          Caption = 'Banco (Bacen)'
          OnClick = Bacen1Click
        end
        object FormadePagamento1: TMenuItem
          Caption = 'Forma de Pagamento'
          OnClick = FormadePagamento1Click
        end
        object ContaCorrente1: TMenuItem
          Caption = 'Conta Corrente'
        end
      end
      object Participantes1: TMenuItem
        Caption = 'Participantes'
        object Tecnico1: TMenuItem
          Caption = '&T'#233'cnico'
          OnClick = Tecnico1Click
        end
        object Pessoa1: TMenuItem
          Caption = 'Pessoa'
        end
      end
      object Estoque1: TMenuItem
        Caption = 'Estoque'
        object Produto1: TMenuItem
          Caption = 'Produto'
        end
        object Servico1: TMenuItem
          Caption = 'Servi'#231'o'
          OnClick = Servico1Click
        end
        object Marca1: TMenuItem
          Caption = 'Marca'
          OnClick = Marca1Click
        end
      end
    end
  end
end
