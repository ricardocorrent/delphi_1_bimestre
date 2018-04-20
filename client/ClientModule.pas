unit ClientModule;

interface

uses
  System.SysUtils, System.Classes, ClientClasses, IPPeerClient,
  Datasnap.DSClientRest;

type
  TsmRestConnection = class(TDataModule)
    DSRestConnection1: TDSRestConnection;
  private
    FInstanceOwner: Boolean;
    FsmStringClient: TsmStringClient;
    FsmUserClient: TsmUserClient;
    FsmTecnicoClient: TsmTecnicoClient;
    FsmMarcaClient: TsmMarcaClient;
    FsmServicoClient: TsmServicoClient;
    FsmBacenClient: TsmBacenClient;
    FsmFormaPagamento: TsmFormaPagamentoClient;

    {CRIAR AQUI}
    Fname: TsmUserClient;
    FsmFormaPagamentoClient: TsmFormaPagamentoClient;
    function GetsmStringClient: TsmStringClient;
    function GetsmUserClient: TsmUserClient;
    function GetsmTecnicoClient: TsmTecnicoClient;
    function GetsmMarcaClient: TsmMarcaClient;
    function GetsmServicoClient: TsmServicoClient;
    function GetsmBacenClient: TsmBacenClient;
    function GetsmFormaPagamentoClient: TsmFormaPagamentoClient;

    {CRIAR AQUI}
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property smStringClient: TsmStringClient read GetsmStringClient write FsmStringClient;
    property smUserClient: TsmUserClient read GetsmUserClient write FsmUserClient;
    property smTecnicoClient: TsmTecnicoClient read GetsmTecnicoClient write FsmTecnicoClient;
    property smMarcaClient: TsmMarcaClient read GetsmMarcaClient write FsmMarcaClient;
    property smServicoClient: TsmServicoClient read GetsmServicoClient write FsmServicoClient;
    property smBacenClient: TsmBacenClient read GetsmBacenClient write FsmBacenClient;
    property smFormaPagamentoClient: TsmFormaPagamentoClient read FsmFormaPagamentoClient write FsmFormaPagamentoClient;
end;

var
  smRestConnection: TsmRestConnection;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

constructor TsmRestConnection.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

destructor TsmRestConnection.Destroy;
begin
  FsmStringClient.Free;
  FsmUserClient.Free;
  FsmTecnicoClient.Free;
  FsmServicoClient.Free;
  FsmBacenClient.Free;
  FsmFormaPagamento.Free;
  inherited;
end;

function TsmRestConnection.GetsmBacenClient: TsmBacenClient;
begin
  if FsmBacenClient = nil then
    FsmBacenClient := TsmBacenClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FsmBacenClient;
end;

function TsmRestConnection.GetsmFormaPagamentoClient: TsmFormaPagamentoClient;
begin
  if FsmFormaPagamento = nil then
    FsmFormaPagamento := TsmFormaPagamentoClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FsmFormaPagamento;
end;

function TsmRestConnection.GetsmMarcaClient: TsmMarcaClient;
begin
  if FsmMarcaClient = nil then
    FsmMarcaClient := TsmMarcaClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FsmMarcaClient;
end;

function TsmRestConnection.GetsmServicoClient: TsmServicoClient;
begin
  if FsmServicoClient = nil then
    FsmServicoClient := TsmServicoClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FsmServicoClient;
end;

function TsmRestConnection.GetsmStringClient: TsmStringClient;
begin
  if FsmStringClient = nil then
    FsmStringClient:= TsmStringClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FsmStringClient;
end;
function TsmRestConnection.GetsmTecnicoClient: TsmTecnicoClient;
begin
  if FsmTecnicoClient = nil then
    FsmTecnicoClient:= TsmTecnicoClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FsmTecnicoClient;
end;

function TsmRestConnection.GetsmUserClient: TsmUserClient;
begin
  if FsmUserClient = nil then
    FsmUserClient:= TsmUserClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FsmUserClient;
end;

end.
