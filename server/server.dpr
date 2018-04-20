program server;
{$APPTYPE GUI}

{$R *.dres}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  Form.Server in 'Form.Server.pas' {Form1},
  ServerMethodsString in 'server.methods\ServerMethodsString.pas' {smString: TDataModule},
  WebModule in 'WebModule.pas' {WebModule1: TWebModule},
  ServerMethodsUser in 'server.methods\ServerMethodsUser.pas' {smUser: TDSServerModule},
  DB.Connection in 'DB.Connection.pas' {dmConnection: TDataModule},
  ServerMethodsTecnico in 'server.methods\ServerMethodsTecnico.pas' {smTecnico: TDSServerModule},
  ServerMethodsMarca in 'server.methods\ServerMethodsMarca.pas' {smMarca: TDSServerModule},
  ServerMethodsServico in 'server.methods\ServerMethodsServico.pas' {smServico: TDSServerModule},
  ServerMethodsBacen in 'server.methods\ServerMethodsBacen.pas' {smBacen: TDSServerModule},
  ServerMethodsFormaPagamento in 'server.methods\ServerMethodsFormaPagamento.pas' {smFormaPagamento: TDSServerModule};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TdmConnection, dmConnection);
  Application.Run;
end.
