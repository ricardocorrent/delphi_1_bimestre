//
// Created by the DataSnap proxy generator.
// 20/04/2018 15:53:47
//

unit ClientClasses;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.FireDACJSONReflect, Data.DBXJSONReflect;

type

  IDSRestCachedTFDJSONDataSets = interface;

  TsmStringClient = class(TDSAdminRestClient)
  private
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
  end;

  TsmUserClient = class(TDSAdminRestClient)
  private
    FGetAllUserCommand: TDSRestCommand;
    FGetAllUserCommand_Cache: TDSRestCommand;
    FApplyChangesUserCommand: TDSRestCommand;
    FDeleteUserCommand: TDSRestCommand;
    FAccessUserCommand: TDSRestCommand;
    FAccessUserCommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function GetAllUser(const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetAllUser_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    procedure ApplyChangesUser(ADeltaList: TFDJSONDeltas);
    procedure DeleteUser(AId: Integer);
    function AccessUser(ALogin: string; ASenha: string; const ARequestFilter: string = ''): TJSONObject;
    function AccessUser_Cache(ALogin: string; ASenha: string; const ARequestFilter: string = ''): IDSRestCachedJSONObject;
  end;

  TsmTecnicoClient = class(TDSAdminRestClient)
  private
    FGetAllTecnicoCommand: TDSRestCommand;
    FGetAllTecnicoCommand_Cache: TDSRestCommand;
    FApplyChangesTecnicoCommand: TDSRestCommand;
    FDeleteTecnicoCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function GetAllTecnico(const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetAllTecnico_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    procedure ApplyChangesTecnico(ADeltaList: TFDJSONDeltas);
    procedure DeleteTecnico(AId: Integer);
  end;

  TsmMarcaClient = class(TDSAdminRestClient)
  private
    FGetAllMarcaCommand: TDSRestCommand;
    FGetAllMarcaCommand_Cache: TDSRestCommand;
    FApplyChangesMarcaCommand: TDSRestCommand;
    FDeleteMarcaCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function GetAllMarca(const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetAllMarca_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    procedure ApplyChangesMarca(ADeltaList: TFDJSONDeltas);
    procedure DeleteMarca(AId: Integer);
  end;

  TsmServicoClient = class(TDSAdminRestClient)
  private
    FGetAllServicoCommand: TDSRestCommand;
    FGetAllServicoCommand_Cache: TDSRestCommand;
    FApplyChangesServicoCommand: TDSRestCommand;
    FDeleteServicoCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function GetAllServico(const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetAllServico_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    procedure ApplyChangesServico(ADeltaList: TFDJSONDeltas);
    procedure DeleteServico(AId: Integer);
  end;

  TsmBacenClient = class(TDSAdminRestClient)
  private
    FGetAllBacenCommand: TDSRestCommand;
    FGetAllBacenCommand_Cache: TDSRestCommand;
    FApplyChangesBacenCommand: TDSRestCommand;
    FDeleteBacenCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function GetAllBacen(const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetAllBacen_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    procedure ApplyChangesBacen(ADeltaList: TFDJSONDeltas);
    procedure DeleteBacen(AId: Integer);
  end;

  TsmFormaPagamentoClient = class(TDSAdminRestClient)
  private
    FGetAllFormaPagamentoCommand: TDSRestCommand;
    FGetAllFormaPagamentoCommand_Cache: TDSRestCommand;
    FApplyChangesFormaPagamentoCommand: TDSRestCommand;
    FDeleteFormaPagamentoCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function GetAllFormaPagamento(const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetAllFormaPagamento_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    procedure ApplyChangesFormaPagamento(ADeltaList: TFDJSONDeltas);
    procedure DeleteFormaPagamento(AId: Integer);
  end;

  IDSRestCachedTFDJSONDataSets = interface(IDSRestCachedObject<TFDJSONDataSets>)
  end;

  TDSRestCachedTFDJSONDataSets = class(TDSRestCachedObject<TFDJSONDataSets>, IDSRestCachedTFDJSONDataSets, IDSRestCachedCommand)
  end;

const
  TsmString_EchoString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TsmString_ReverseString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TsmUser_GetAllUser: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TsmUser_GetAllUser_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TsmUser_ApplyChangesUser: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'ADeltaList'; Direction: 1; DBXType: 37; TypeName: 'TFDJSONDeltas')
  );

  TsmUser_DeleteUser: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'AId'; Direction: 1; DBXType: 6; TypeName: 'Integer')
  );

  TsmUser_AccessUser: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ALogin'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ASenha'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TJSONObject')
  );

  TsmUser_AccessUser_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'ALogin'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'ASenha'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TsmTecnico_GetAllTecnico: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TsmTecnico_GetAllTecnico_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TsmTecnico_ApplyChangesTecnico: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'ADeltaList'; Direction: 1; DBXType: 37; TypeName: 'TFDJSONDeltas')
  );

  TsmTecnico_DeleteTecnico: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'AId'; Direction: 1; DBXType: 6; TypeName: 'Integer')
  );

  TsmMarca_GetAllMarca: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TsmMarca_GetAllMarca_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TsmMarca_ApplyChangesMarca: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'ADeltaList'; Direction: 1; DBXType: 37; TypeName: 'TFDJSONDeltas')
  );

  TsmMarca_DeleteMarca: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'AId'; Direction: 1; DBXType: 6; TypeName: 'Integer')
  );

  TsmServico_GetAllServico: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TsmServico_GetAllServico_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TsmServico_ApplyChangesServico: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'ADeltaList'; Direction: 1; DBXType: 37; TypeName: 'TFDJSONDeltas')
  );

  TsmServico_DeleteServico: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'AId'; Direction: 1; DBXType: 6; TypeName: 'Integer')
  );

  TsmBacen_GetAllBacen: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TsmBacen_GetAllBacen_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TsmBacen_ApplyChangesBacen: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'ADeltaList'; Direction: 1; DBXType: 37; TypeName: 'TFDJSONDeltas')
  );

  TsmBacen_DeleteBacen: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'AId'; Direction: 1; DBXType: 6; TypeName: 'Integer')
  );

  TsmFormaPagamento_GetAllFormaPagamento: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TsmFormaPagamento_GetAllFormaPagamento_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TsmFormaPagamento_ApplyChangesFormaPagamento: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'ADeltaList'; Direction: 1; DBXType: 37; TypeName: 'TFDJSONDeltas')
  );

  TsmFormaPagamento_DeleteFormaPagamento: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'AId'; Direction: 1; DBXType: 6; TypeName: 'Integer')
  );

implementation

function TsmStringClient.EchoString(Value: string; const ARequestFilter: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FConnection.CreateCommand;
    FEchoStringCommand.RequestType := 'GET';
    FEchoStringCommand.Text := 'TsmString.EchoString';
    FEchoStringCommand.Prepare(TsmString_EchoString);
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.Execute(ARequestFilter);
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TsmStringClient.ReverseString(Value: string; const ARequestFilter: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FConnection.CreateCommand;
    FReverseStringCommand.RequestType := 'GET';
    FReverseStringCommand.Text := 'TsmString.ReverseString';
    FReverseStringCommand.Prepare(TsmString_ReverseString);
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.Execute(ARequestFilter);
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

constructor TsmStringClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TsmStringClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TsmStringClient.Destroy;
begin
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  inherited;
end;

function TsmUserClient.GetAllUser(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetAllUserCommand = nil then
  begin
    FGetAllUserCommand := FConnection.CreateCommand;
    FGetAllUserCommand.RequestType := 'GET';
    FGetAllUserCommand.Text := 'TsmUser.GetAllUser';
    FGetAllUserCommand.Prepare(TsmUser_GetAllUser);
  end;
  FGetAllUserCommand.Execute(ARequestFilter);
  if not FGetAllUserCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetAllUserCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetAllUserCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetAllUserCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TsmUserClient.GetAllUser_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetAllUserCommand_Cache = nil then
  begin
    FGetAllUserCommand_Cache := FConnection.CreateCommand;
    FGetAllUserCommand_Cache.RequestType := 'GET';
    FGetAllUserCommand_Cache.Text := 'TsmUser.GetAllUser';
    FGetAllUserCommand_Cache.Prepare(TsmUser_GetAllUser_Cache);
  end;
  FGetAllUserCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetAllUserCommand_Cache.Parameters[0].Value.GetString);
end;

procedure TsmUserClient.ApplyChangesUser(ADeltaList: TFDJSONDeltas);
begin
  if FApplyChangesUserCommand = nil then
  begin
    FApplyChangesUserCommand := FConnection.CreateCommand;
    FApplyChangesUserCommand.RequestType := 'POST';
    FApplyChangesUserCommand.Text := 'TsmUser."ApplyChangesUser"';
    FApplyChangesUserCommand.Prepare(TsmUser_ApplyChangesUser);
  end;
  if not Assigned(ADeltaList) then
    FApplyChangesUserCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FApplyChangesUserCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FApplyChangesUserCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(ADeltaList), True);
      if FInstanceOwner then
        ADeltaList.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FApplyChangesUserCommand.Execute;
end;

procedure TsmUserClient.DeleteUser(AId: Integer);
begin
  if FDeleteUserCommand = nil then
  begin
    FDeleteUserCommand := FConnection.CreateCommand;
    FDeleteUserCommand.RequestType := 'GET';
    FDeleteUserCommand.Text := 'TsmUser.DeleteUser';
    FDeleteUserCommand.Prepare(TsmUser_DeleteUser);
  end;
  FDeleteUserCommand.Parameters[0].Value.SetInt32(AId);
  FDeleteUserCommand.Execute;
end;

function TsmUserClient.AccessUser(ALogin: string; ASenha: string; const ARequestFilter: string): TJSONObject;
begin
  if FAccessUserCommand = nil then
  begin
    FAccessUserCommand := FConnection.CreateCommand;
    FAccessUserCommand.RequestType := 'GET';
    FAccessUserCommand.Text := 'TsmUser.AccessUser';
    FAccessUserCommand.Prepare(TsmUser_AccessUser);
  end;
  FAccessUserCommand.Parameters[0].Value.SetWideString(ALogin);
  FAccessUserCommand.Parameters[1].Value.SetWideString(ASenha);
  FAccessUserCommand.Execute(ARequestFilter);
  Result := TJSONObject(FAccessUserCommand.Parameters[2].Value.GetJSONValue(FInstanceOwner));
end;

function TsmUserClient.AccessUser_Cache(ALogin: string; ASenha: string; const ARequestFilter: string): IDSRestCachedJSONObject;
begin
  if FAccessUserCommand_Cache = nil then
  begin
    FAccessUserCommand_Cache := FConnection.CreateCommand;
    FAccessUserCommand_Cache.RequestType := 'GET';
    FAccessUserCommand_Cache.Text := 'TsmUser.AccessUser';
    FAccessUserCommand_Cache.Prepare(TsmUser_AccessUser_Cache);
  end;
  FAccessUserCommand_Cache.Parameters[0].Value.SetWideString(ALogin);
  FAccessUserCommand_Cache.Parameters[1].Value.SetWideString(ASenha);
  FAccessUserCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedJSONObject.Create(FAccessUserCommand_Cache.Parameters[2].Value.GetString);
end;

constructor TsmUserClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TsmUserClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TsmUserClient.Destroy;
begin
  FGetAllUserCommand.DisposeOf;
  FGetAllUserCommand_Cache.DisposeOf;
  FApplyChangesUserCommand.DisposeOf;
  FDeleteUserCommand.DisposeOf;
  FAccessUserCommand.DisposeOf;
  FAccessUserCommand_Cache.DisposeOf;
  inherited;
end;

function TsmTecnicoClient.GetAllTecnico(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetAllTecnicoCommand = nil then
  begin
    FGetAllTecnicoCommand := FConnection.CreateCommand;
    FGetAllTecnicoCommand.RequestType := 'GET';
    FGetAllTecnicoCommand.Text := 'TsmTecnico.GetAllTecnico';
    FGetAllTecnicoCommand.Prepare(TsmTecnico_GetAllTecnico);
  end;
  FGetAllTecnicoCommand.Execute(ARequestFilter);
  if not FGetAllTecnicoCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetAllTecnicoCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetAllTecnicoCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetAllTecnicoCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TsmTecnicoClient.GetAllTecnico_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetAllTecnicoCommand_Cache = nil then
  begin
    FGetAllTecnicoCommand_Cache := FConnection.CreateCommand;
    FGetAllTecnicoCommand_Cache.RequestType := 'GET';
    FGetAllTecnicoCommand_Cache.Text := 'TsmTecnico.GetAllTecnico';
    FGetAllTecnicoCommand_Cache.Prepare(TsmTecnico_GetAllTecnico_Cache);
  end;
  FGetAllTecnicoCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetAllTecnicoCommand_Cache.Parameters[0].Value.GetString);
end;

procedure TsmTecnicoClient.ApplyChangesTecnico(ADeltaList: TFDJSONDeltas);
begin
  if FApplyChangesTecnicoCommand = nil then
  begin
    FApplyChangesTecnicoCommand := FConnection.CreateCommand;
    FApplyChangesTecnicoCommand.RequestType := 'POST';
    FApplyChangesTecnicoCommand.Text := 'TsmTecnico."ApplyChangesTecnico"';
    FApplyChangesTecnicoCommand.Prepare(TsmTecnico_ApplyChangesTecnico);
  end;
  if not Assigned(ADeltaList) then
    FApplyChangesTecnicoCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FApplyChangesTecnicoCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FApplyChangesTecnicoCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(ADeltaList), True);
      if FInstanceOwner then
        ADeltaList.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FApplyChangesTecnicoCommand.Execute;
end;

procedure TsmTecnicoClient.DeleteTecnico(AId: Integer);
begin
  if FDeleteTecnicoCommand = nil then
  begin
    FDeleteTecnicoCommand := FConnection.CreateCommand;
    FDeleteTecnicoCommand.RequestType := 'GET';
    FDeleteTecnicoCommand.Text := 'TsmTecnico.DeleteTecnico';
    FDeleteTecnicoCommand.Prepare(TsmTecnico_DeleteTecnico);
  end;
  FDeleteTecnicoCommand.Parameters[0].Value.SetInt32(AId);
  FDeleteTecnicoCommand.Execute;
end;

constructor TsmTecnicoClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TsmTecnicoClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TsmTecnicoClient.Destroy;
begin
  FGetAllTecnicoCommand.DisposeOf;
  FGetAllTecnicoCommand_Cache.DisposeOf;
  FApplyChangesTecnicoCommand.DisposeOf;
  FDeleteTecnicoCommand.DisposeOf;
  inherited;
end;

function TsmMarcaClient.GetAllMarca(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetAllMarcaCommand = nil then
  begin
    FGetAllMarcaCommand := FConnection.CreateCommand;
    FGetAllMarcaCommand.RequestType := 'GET';
    FGetAllMarcaCommand.Text := 'TsmMarca.GetAllMarca';
    FGetAllMarcaCommand.Prepare(TsmMarca_GetAllMarca);
  end;
  FGetAllMarcaCommand.Execute(ARequestFilter);
  if not FGetAllMarcaCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetAllMarcaCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetAllMarcaCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetAllMarcaCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TsmMarcaClient.GetAllMarca_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetAllMarcaCommand_Cache = nil then
  begin
    FGetAllMarcaCommand_Cache := FConnection.CreateCommand;
    FGetAllMarcaCommand_Cache.RequestType := 'GET';
    FGetAllMarcaCommand_Cache.Text := 'TsmMarca.GetAllMarca';
    FGetAllMarcaCommand_Cache.Prepare(TsmMarca_GetAllMarca_Cache);
  end;
  FGetAllMarcaCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetAllMarcaCommand_Cache.Parameters[0].Value.GetString);
end;

procedure TsmMarcaClient.ApplyChangesMarca(ADeltaList: TFDJSONDeltas);
begin
  if FApplyChangesMarcaCommand = nil then
  begin
    FApplyChangesMarcaCommand := FConnection.CreateCommand;
    FApplyChangesMarcaCommand.RequestType := 'POST';
    FApplyChangesMarcaCommand.Text := 'TsmMarca."ApplyChangesMarca"';
    FApplyChangesMarcaCommand.Prepare(TsmMarca_ApplyChangesMarca);
  end;
  if not Assigned(ADeltaList) then
    FApplyChangesMarcaCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FApplyChangesMarcaCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FApplyChangesMarcaCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(ADeltaList), True);
      if FInstanceOwner then
        ADeltaList.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FApplyChangesMarcaCommand.Execute;
end;

procedure TsmMarcaClient.DeleteMarca(AId: Integer);
begin
  if FDeleteMarcaCommand = nil then
  begin
    FDeleteMarcaCommand := FConnection.CreateCommand;
    FDeleteMarcaCommand.RequestType := 'GET';
    FDeleteMarcaCommand.Text := 'TsmMarca.DeleteMarca';
    FDeleteMarcaCommand.Prepare(TsmMarca_DeleteMarca);
  end;
  FDeleteMarcaCommand.Parameters[0].Value.SetInt32(AId);
  FDeleteMarcaCommand.Execute;
end;

constructor TsmMarcaClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TsmMarcaClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TsmMarcaClient.Destroy;
begin
  FGetAllMarcaCommand.DisposeOf;
  FGetAllMarcaCommand_Cache.DisposeOf;
  FApplyChangesMarcaCommand.DisposeOf;
  FDeleteMarcaCommand.DisposeOf;
  inherited;
end;

function TsmServicoClient.GetAllServico(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetAllServicoCommand = nil then
  begin
    FGetAllServicoCommand := FConnection.CreateCommand;
    FGetAllServicoCommand.RequestType := 'GET';
    FGetAllServicoCommand.Text := 'TsmServico.GetAllServico';
    FGetAllServicoCommand.Prepare(TsmServico_GetAllServico);
  end;
  FGetAllServicoCommand.Execute(ARequestFilter);
  if not FGetAllServicoCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetAllServicoCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetAllServicoCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetAllServicoCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TsmServicoClient.GetAllServico_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetAllServicoCommand_Cache = nil then
  begin
    FGetAllServicoCommand_Cache := FConnection.CreateCommand;
    FGetAllServicoCommand_Cache.RequestType := 'GET';
    FGetAllServicoCommand_Cache.Text := 'TsmServico.GetAllServico';
    FGetAllServicoCommand_Cache.Prepare(TsmServico_GetAllServico_Cache);
  end;
  FGetAllServicoCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetAllServicoCommand_Cache.Parameters[0].Value.GetString);
end;

procedure TsmServicoClient.ApplyChangesServico(ADeltaList: TFDJSONDeltas);
begin
  if FApplyChangesServicoCommand = nil then
  begin
    FApplyChangesServicoCommand := FConnection.CreateCommand;
    FApplyChangesServicoCommand.RequestType := 'POST';
    FApplyChangesServicoCommand.Text := 'TsmServico."ApplyChangesServico"';
    FApplyChangesServicoCommand.Prepare(TsmServico_ApplyChangesServico);
  end;
  if not Assigned(ADeltaList) then
    FApplyChangesServicoCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FApplyChangesServicoCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FApplyChangesServicoCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(ADeltaList), True);
      if FInstanceOwner then
        ADeltaList.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FApplyChangesServicoCommand.Execute;
end;

procedure TsmServicoClient.DeleteServico(AId: Integer);
begin
  if FDeleteServicoCommand = nil then
  begin
    FDeleteServicoCommand := FConnection.CreateCommand;
    FDeleteServicoCommand.RequestType := 'GET';
    FDeleteServicoCommand.Text := 'TsmServico.DeleteServico';
    FDeleteServicoCommand.Prepare(TsmServico_DeleteServico);
  end;
  FDeleteServicoCommand.Parameters[0].Value.SetInt32(AId);
  FDeleteServicoCommand.Execute;
end;

constructor TsmServicoClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TsmServicoClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TsmServicoClient.Destroy;
begin
  FGetAllServicoCommand.DisposeOf;
  FGetAllServicoCommand_Cache.DisposeOf;
  FApplyChangesServicoCommand.DisposeOf;
  FDeleteServicoCommand.DisposeOf;
  inherited;
end;

function TsmBacenClient.GetAllBacen(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetAllBacenCommand = nil then
  begin
    FGetAllBacenCommand := FConnection.CreateCommand;
    FGetAllBacenCommand.RequestType := 'GET';
    FGetAllBacenCommand.Text := 'TsmBacen.GetAllBacen';
    FGetAllBacenCommand.Prepare(TsmBacen_GetAllBacen);
  end;
  FGetAllBacenCommand.Execute(ARequestFilter);
  if not FGetAllBacenCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetAllBacenCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetAllBacenCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetAllBacenCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TsmBacenClient.GetAllBacen_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetAllBacenCommand_Cache = nil then
  begin
    FGetAllBacenCommand_Cache := FConnection.CreateCommand;
    FGetAllBacenCommand_Cache.RequestType := 'GET';
    FGetAllBacenCommand_Cache.Text := 'TsmBacen.GetAllBacen';
    FGetAllBacenCommand_Cache.Prepare(TsmBacen_GetAllBacen_Cache);
  end;
  FGetAllBacenCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetAllBacenCommand_Cache.Parameters[0].Value.GetString);
end;

procedure TsmBacenClient.ApplyChangesBacen(ADeltaList: TFDJSONDeltas);
begin
  if FApplyChangesBacenCommand = nil then
  begin
    FApplyChangesBacenCommand := FConnection.CreateCommand;
    FApplyChangesBacenCommand.RequestType := 'POST';
    FApplyChangesBacenCommand.Text := 'TsmBacen."ApplyChangesBacen"';
    FApplyChangesBacenCommand.Prepare(TsmBacen_ApplyChangesBacen);
  end;
  if not Assigned(ADeltaList) then
    FApplyChangesBacenCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FApplyChangesBacenCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FApplyChangesBacenCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(ADeltaList), True);
      if FInstanceOwner then
        ADeltaList.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FApplyChangesBacenCommand.Execute;
end;

procedure TsmBacenClient.DeleteBacen(AId: Integer);
begin
  if FDeleteBacenCommand = nil then
  begin
    FDeleteBacenCommand := FConnection.CreateCommand;
    FDeleteBacenCommand.RequestType := 'GET';
    FDeleteBacenCommand.Text := 'TsmBacen.DeleteBacen';
    FDeleteBacenCommand.Prepare(TsmBacen_DeleteBacen);
  end;
  FDeleteBacenCommand.Parameters[0].Value.SetInt32(AId);
  FDeleteBacenCommand.Execute;
end;

constructor TsmBacenClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TsmBacenClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TsmBacenClient.Destroy;
begin
  FGetAllBacenCommand.DisposeOf;
  FGetAllBacenCommand_Cache.DisposeOf;
  FApplyChangesBacenCommand.DisposeOf;
  FDeleteBacenCommand.DisposeOf;
  inherited;
end;

function TsmFormaPagamentoClient.GetAllFormaPagamento(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetAllFormaPagamentoCommand = nil then
  begin
    FGetAllFormaPagamentoCommand := FConnection.CreateCommand;
    FGetAllFormaPagamentoCommand.RequestType := 'GET';
    FGetAllFormaPagamentoCommand.Text := 'TsmFormaPagamento.GetAllFormaPagamento';
    FGetAllFormaPagamentoCommand.Prepare(TsmFormaPagamento_GetAllFormaPagamento);
  end;
  FGetAllFormaPagamentoCommand.Execute(ARequestFilter);
  if not FGetAllFormaPagamentoCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetAllFormaPagamentoCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetAllFormaPagamentoCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetAllFormaPagamentoCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TsmFormaPagamentoClient.GetAllFormaPagamento_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetAllFormaPagamentoCommand_Cache = nil then
  begin
    FGetAllFormaPagamentoCommand_Cache := FConnection.CreateCommand;
    FGetAllFormaPagamentoCommand_Cache.RequestType := 'GET';
    FGetAllFormaPagamentoCommand_Cache.Text := 'TsmFormaPagamento.GetAllFormaPagamento';
    FGetAllFormaPagamentoCommand_Cache.Prepare(TsmFormaPagamento_GetAllFormaPagamento_Cache);
  end;
  FGetAllFormaPagamentoCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetAllFormaPagamentoCommand_Cache.Parameters[0].Value.GetString);
end;

procedure TsmFormaPagamentoClient.ApplyChangesFormaPagamento(ADeltaList: TFDJSONDeltas);
begin
  if FApplyChangesFormaPagamentoCommand = nil then
  begin
    FApplyChangesFormaPagamentoCommand := FConnection.CreateCommand;
    FApplyChangesFormaPagamentoCommand.RequestType := 'POST';
    FApplyChangesFormaPagamentoCommand.Text := 'TsmFormaPagamento."ApplyChangesFormaPagamento"';
    FApplyChangesFormaPagamentoCommand.Prepare(TsmFormaPagamento_ApplyChangesFormaPagamento);
  end;
  if not Assigned(ADeltaList) then
    FApplyChangesFormaPagamentoCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FApplyChangesFormaPagamentoCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FApplyChangesFormaPagamentoCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(ADeltaList), True);
      if FInstanceOwner then
        ADeltaList.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FApplyChangesFormaPagamentoCommand.Execute;
end;

procedure TsmFormaPagamentoClient.DeleteFormaPagamento(AId: Integer);
begin
  if FDeleteFormaPagamentoCommand = nil then
  begin
    FDeleteFormaPagamentoCommand := FConnection.CreateCommand;
    FDeleteFormaPagamentoCommand.RequestType := 'GET';
    FDeleteFormaPagamentoCommand.Text := 'TsmFormaPagamento.DeleteFormaPagamento';
    FDeleteFormaPagamentoCommand.Prepare(TsmFormaPagamento_DeleteFormaPagamento);
  end;
  FDeleteFormaPagamentoCommand.Parameters[0].Value.SetInt32(AId);
  FDeleteFormaPagamentoCommand.Execute;
end;

constructor TsmFormaPagamentoClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TsmFormaPagamentoClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TsmFormaPagamentoClient.Destroy;
begin
  FGetAllFormaPagamentoCommand.DisposeOf;
  FGetAllFormaPagamentoCommand_Cache.DisposeOf;
  FApplyChangesFormaPagamentoCommand.DisposeOf;
  FDeleteFormaPagamentoCommand.DisposeOf;
  inherited;
end;

end.

