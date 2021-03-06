unit ServerMethodsTecnico;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth, Datasnap.DSProviderDataModuleAdapter,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Stan.StorageJSON,
  FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  DB.Connection, Data.FireDACJSONReflect;

type
  TsmTecnico = class(TDSServerModule)
    fdQueryAllTecnico: TFDQuery;
    sslBin: TFDStanStorageBinLink;
    sslJson: TFDStanStorageJSONLink;
    fdQueryTecnico: TFDQuery;
    fdQueryDeleteTecnico: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function GetAllTecnico: TFDJSONDataSets;
    procedure ApplyChangesTecnico(const ADeltaList: TFDJSONDeltas);
    procedure DeleteTecnico(AId: Integer);
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TsmTecnico }

procedure TsmTecnico.ApplyChangesTecnico(const ADeltaList: TFDJSONDeltas);
var
  LApply: IFDJSONDeltasApplyUpdates;
begin
  LApply := TFDJSONDeltasApplyUpdates.Create(ADeltaList);
  LApply.ApplyUpdates('tecnico', fdQueryTecnico.Command);
  if LApply.Errors.Count > 0 then
  begin
    raise Exception.Create(LApply.Errors.Strings.Text);
  end;
  fdQueryTecnico.Active := True;
  fdQueryTecnico.CommitUpdates;
  fdQueryTecnico.Refresh;
end;

procedure TsmTecnico.DeleteTecnico(AId: Integer);
begin
try
  fdQueryDeleteTecnico.Active := False;
  fdQueryDeleteTecnico.ParamByName('ID').AsInteger := AId;
  fdQueryDeleteTecnico.ExecSQL;
except
    raise Exception.Create('Falha ao excluir t�cnico');
end;
end;

function TsmTecnico.GetAllTecnico: TFDJSONDataSets;
begin
  fdQueryAllTecnico.Active := False;
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, fdQueryAllTecnico);
end;

end.

