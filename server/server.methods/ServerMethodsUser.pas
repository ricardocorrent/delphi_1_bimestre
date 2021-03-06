unit ServerMethodsUser;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth, Datasnap.DSProviderDataModuleAdapter,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Stan.StorageJSON,
  FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  DB.Connection, Data.FireDACJSONReflect, System.JSON;

type
  TsmUser = class(TDSServerModule)
    fdQueryAllUser: TFDQuery;
    fdQueryUser: TFDQuery;
    fdQueryDeleteUser: TFDQuery;
    sslBin: TFDStanStorageBinLink;
    sslJson: TFDStanStorageJSONLink;
    fdQueryAccessUser: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function GetAllUser: TFDJSONDataSets;
    procedure ApplyChangesUser(const ADeltaList: TFDJSONDeltas);
    procedure DeleteUser(AId: Integer);
    function AccessUser(ALogin, ASenha: string): TJSONObject;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TsmUser }

function TsmUser.AccessUser(ALogin, ASenha: string): TJSONObject;
begin
Result := TJSONObject.Create;

try
  fdQueryAccessUser.Active := False;
  fdQueryAccessUser.ParamByName('LOGIN').AsString := ALogin;
  fdQueryAccessUser.ParamByName('SENHA').AsString := ASenha;
  fdQueryAccessUser.Open;
  fdQueryAccessUser.First;
  if not StrToBoolDef(fdQueryAccessUser.FindField('access').AsString, False) then
  begin
    raise Exception.Create('Dados inv�lidos.');
  end;
  Result.AddPair(TJSONPair.Create('access', TJSONTrue.Create));

except
Result.AddPair(TJSONPair.Create('access', TJSONFalse.Create));
end;
end;

procedure TsmUser.ApplyChangesUser(const ADeltaList: TFDJSONDeltas);
var
LApply: IFDJSONDeltasApplyUpdates;
begin
  LApply := TFDJSONDeltasApplyUpdates.Create(ADeltaList);
  LApply.ApplyUpdates('usuario', fdQueryUser.Command);
  if LApply.Errors.Count > 0 then
  begin
    raise Exception.Create(LApply.Errors.Strings.Text);
  end;
  fdQueryUser.Active := True;
  fdQueryUser.CommitUpdates;
  fdQueryUser.Refresh;
end;

procedure TsmUser.DeleteUser(AId: Integer);
begin
  try
  fdQueryDeleteUser.Active := False;
  fdQueryDeleteUser.ParamByName('ID').AsInteger := AId;
  fdQueryDeleteUser.ExecSQL;
except
    raise Exception.Create('Falha ao excluir usu�rio');
end;
end;

function TsmUser.GetAllUser: TFDJSONDataSets;
begin
  fdQueryAllUser.Active := False;
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, fdQueryAllUser);
end;

end.

