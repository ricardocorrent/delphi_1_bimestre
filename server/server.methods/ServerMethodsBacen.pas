unit ServerMethodsBacen;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Datasnap.DSProviderDataModuleAdapter,
  DB.Connection, Data.FireDACJSONReflect, FireDAC.Stan.StorageJSON,
  FireDAC.Stan.StorageBin;

type
  TsmBacen = class(TDSServerModule)
    fdQueryAllBacen: TFDQuery;
    fdQueryBacen: TFDQuery;
    fdQueryDeleteBacen: TFDQuery;
    sslBin: TFDStanStorageBinLink;
    sslJson: TFDStanStorageJSONLink;
  private
    { Private declarations }
  public
    { Public declarations }
    function GetAllBacen: TFDJSONDataSets;
    procedure ApplyChangesBacen(const ADeltaList: TFDJSONDeltas);
    procedure DeleteBacen(AId: Integer);
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TsmBacen }

procedure TsmBacen.ApplyChangesBacen(const ADeltaList: TFDJSONDeltas);
var
  LApply: IFDJSONDeltasApplyUpdates;
begin
  LApply := TFDJSONDeltasApplyUpdates.Create(ADeltaList);
  LApply.ApplyUpdates('bacen', fdQueryBacen.Command);
  if LApply.Errors.Count > 0 then
  begin
    raise Exception.Create(LApply.Errors.Strings.Text);
  end;
  fdQueryBacen.Active := True;
  fdQueryBacen.CommitUpdates;
  fdQueryBacen.Refresh;
end;

procedure TsmBacen.DeleteBacen(AId: Integer);
begin
try
  fdQueryDeleteBacen.Active := False;
  fdQueryDeleteBacen.ParamByName('ID').AsInteger := AId;
  fdQueryDeleteBacen.ExecSQL;
except
    raise Exception.Create('Falha ao excluir Bacen');
end;
end;

function TsmBacen.GetAllBacen: TFDJSONDataSets;
begin
  fdQueryAllBacen.Active := False;
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, fdQueryAllBacen);
end;

end.

