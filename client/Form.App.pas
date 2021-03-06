unit Form.App;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmApp = class(TForm)
    mmMenu: TMainMenu;
    Cadastros1: TMenuItem;
    Usuario1: TMenuItem;
    Tecnico1: TMenuItem;
    Marca1: TMenuItem;
    Servico1: TMenuItem;
    Bacen1: TMenuItem;
    Acesso1: TMenuItem;
    Financeiro1: TMenuItem;
    Participantes1: TMenuItem;
    Estoque1: TMenuItem;
    FormadePagamento1: TMenuItem;
    ContaCorrente1: TMenuItem;
    Pessoa1: TMenuItem;
    Produto1: TMenuItem;
    procedure Usuario1Click(Sender: TObject);
    procedure Tecnico1Click(Sender: TObject);
    procedure Marca1Click(Sender: TObject);
    procedure Servico1Click(Sender: TObject);
    procedure Bacen1Click(Sender: TObject);
    procedure FormadePagamento1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmApp: TfrmApp;

implementation

uses
  Form.User, Form.Tecnico, Form.Marca, Form.Servico, Form.Bacen,
  Form.FormaPagamento;

{$R *.dfm}


procedure TfrmApp.Bacen1Click(Sender: TObject);
begin
if not Assigned(frmBacen) then
  begin
    Application.CreateForm(TfrmBacen, frmBacen);
  end;

  with frmBacen do
  begin
    try
      ShowModal;
    finally
      FreeAndNil(frmBacen);
    end;
  end;
end;

procedure TfrmApp.FormadePagamento1Click(Sender: TObject);
begin
  if not Assigned(frmFormaPagamento) then
  begin
    Application.CreateForm(TfrmFormaPagamento, frmFormaPagamento);
  end;

  with frmFormaPagamento do
  begin
    try
      ShowModal;
    finally
      FreeAndNil(frmFormaPagamento);
    end;
  end;
end;

procedure TfrmApp.Marca1Click(Sender: TObject);
begin
  if not Assigned(frmMarca) then
  begin
    Application.CreateForm(TfrmMarca, frmMarca);
  end;

  with frmMarca do
  begin
    try
      ShowModal;
    finally
      FreeAndNil(frmMarca);
    end;
  end;
end;

procedure TfrmApp.Servico1Click(Sender: TObject);
begin
  if not Assigned(frmServico) then
  begin
    Application.CreateForm(TfrmServico, frmServico);
  end;

  with frmServico do
  begin
    try
      ShowModal;
    finally
      FreeAndNil(frmServico);
    end;
  end;
end;

procedure TfrmApp.Tecnico1Click(Sender: TObject);
begin
  if not Assigned(frmTecnico) then
  begin
    Application.CreateForm(TfrmTecnico, frmTecnico);
  end;

  with frmTecnico do
  begin
    try
      ShowModal;
    finally
      FreeAndNil(frmTecnico);
    end;
  end;
end;

procedure TfrmApp.Usuario1Click(Sender: TObject);
begin
  if not Assigned(frmUser) then
  begin
    Application.CreateForm(TfrmUser, frmUser);
  end;

  with frmUser do
  begin
    try
      ShowModal;
    finally
      FreeAndNil(frmUser);
    end;
  end;

end;

end.
