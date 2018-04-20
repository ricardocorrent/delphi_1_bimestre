unit ServerMethodsFormaPagamento;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth, Datasnap.DSProviderDataModuleAdapter,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Stan.StorageJSON,
  FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  DB.Connection, Data.FireDACJSONReflect;

type
  TsmFormaPagamento = class(TDSServerModule)
    fdQueryAllFormaPagamento: TFDQuery;
    fdQueryFormaPagamento: TFDQuery;
    fdQueryDeleteFormaPagamento: TFDQuery;
    sslBin: TFDStanStorageBinLink;
    sslJson: TFDStanStorageJSONLink;
  private
    { Private declarations }
  public
    { Public declarations }
    function GetAllFormaPagamento: TFDJSONDataSets;
    procedure ApplyChangesFormaPagamento(const ADeltaList: TFDJSONDeltas);
    procedure DeleteFormaPagamento(AId: Integer);
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TsmFormaPagamento }

procedure TsmFormaPagamento.ApplyChangesFormaPagamento(
  const ADeltaList: TFDJSONDeltas);
var
  LApply: IFDJSONDeltasApplyUpdates;
begin
  LApply := TFDJSONDeltasApplyUpdates.Create(ADeltaList);
  LApply.ApplyUpdates('forma_pagamento', fdQueryFormaPagamento.Command);
  if LApply.Errors.Count > 0 then
  begin
    raise Exception.Create(LApply.Errors.Strings.Text);
  end;
  fdQueryFormaPagamento.Active := True;
  fdQueryFormaPagamento.CommitUpdates;
  fdQueryFormaPagamento.Refresh;
end;

procedure TsmFormaPagamento.DeleteFormaPagamento(AId: Integer);
begin
try
  fdQueryDeleteFormaPagamento.Active := False;
  fdQueryDeleteFormaPagamento.ParamByName('ID').AsInteger := AId;
  fdQueryDeleteFormaPagamento.ExecSQL;
except
    raise Exception.Create('Falha ao excluir Forma de Pagamento');
end;
end;

function TsmFormaPagamento.GetAllFormaPagamento: TFDJSONDataSets;
begin
  fdQueryAllFormaPagamento.Active := False;
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, fdQueryAllFormaPagamento);
end;

end.

