unit Form.FormaPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Vcl.Mask, Vcl.DBCtrls, Data.DB, FireDAC.Stan.StorageJSON,
  FireDAC.Stan.StorageBin, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Data.FireDACJSONReflect, Datasnap.DSClientRest;

type
  TfrmFormaPagamento = class(TForm)
    pgcFormaPagamento: TPageControl;
    tsConsulta: TTabSheet;
    tsCadastro: TTabSheet;
    grdFormaPagamento: TDBGrid;
    btnNew: TButton;
    fdMemTableFormaPagamento: TFDMemTable;
    dsFormaPagamento: TDataSource;
    sslBin: TFDStanStorageBinLink;
    sslJson: TFDStanStorageJSONLink;
    intgrfldMemTableFormaPagamentoID: TIntegerField;
    wdstrngfldMemTableFormaPagamentoDESCRICAO: TWideStringField;
    wdstrngfldMemTableFormaPagamentoTIPO: TWideStringField;
    intgrfldMemTableFormaPagamentoEXIBIR_VENDA: TIntegerField;
    intgrfldMemTableFormaPagamentoEXIBIR_BAIXA: TIntegerField;
    intgrfldMemTableFormaPagamentoACEITA_TROCO: TIntegerField;
    lbl1: TLabel;
    edtId: TDBEdit;
    lbl2: TLabel;
    edtDescricao: TDBEdit;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    btnDelete: TButton;
    btnClean: TButton;
    btnSave: TButton;
    cbbExibirVenda: TComboBox;
    cbbExibirBaixa: TComboBox;
    cbbAceitaTroco: TComboBox;
    cbbTipo: TComboBox;
    wdstrngfldMemTableFormaPagamentoESPECIE: TWideStringField;
    lbl7: TLabel;
    cbbEspecie: TComboBox;
    procedure btnCleanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure initialize(AEnabled: Boolean; AFocusIndex, AActivedIndex: Integer);

    procedure GetAllFormaPagamento;
    procedure ApplyUpdate;
    function DeleteFormaPagamento(AId: Integer): Boolean;
    function GetDeltas: TFDJSONDeltas;
  public
    { Public declarations }
  end;

var
  frmFormaPagamento: TfrmFormaPagamento;

implementation

uses ClientModule, System.Generics.Collections, System.JSON;

{$R *.dfm}

procedure HandleRESTException(const AConnection: TDSRestConnection; const APrefix: string; const E: TDSRestProtocolException);
var
  LJSONValue: TJSONValue;
  LMessage: string;
  LPair: TJSONPair;
begin
  // Padronizando mensagem de erro no caso de exceção do servidor

  LJSONValue := TJSONObject.ParseJSONValue(BytesOf(E.ResponseText), 0);
  try
    LMessage :=  E.ResponseText;

    if LJSONValue is TJSONObject then
    begin
      LPair := TJSONObject(LJSONValue).Get(0);
      if LPair.JsonString.Value = 'SessionExpired' then
      begin
          AConnection.SessionID := '';
      end;

      LMessage := LPair.JSONValue.Value;
    end
  finally
    LJSONValue.Free;
  end;

  ShowMessageFmt('%s: %s', [APrefix, LMessage]);
end;

{ TfrmFormaPagamento }

procedure TfrmFormaPagamento.ApplyUpdate;
var
  LDeltaList: TFDJSONDeltas;
begin
  LDeltaList := GetDeltas;
  try
    ClientModule.smRestConnection.smFormaPagamentoClient.ApplyChangesFormaPagamento(LDeltaList);
    GetAllFormaPagamento
  except
    on E: TDSRestProtocolException do
      HandleRestException(ClientModule.smRestConnection.DSRestConnection1, 'Apply Updates error', E)
    else
      raise;
  end;
end;

procedure TfrmFormaPagamento.btnCleanClick(Sender: TObject);
begin
  edtDescricao.SetFocus;
  cbbExibirVenda.Clear;
  cbbExibirBaixa.Clear;
  cbbAceitaTroco.Clear;
  cbbTipo.Clear;
  cbbEspecie.Clear;
  fdMemTableFormaPagamento.Insert;
end;

function TfrmFormaPagamento.DeleteFormaPagamento(AId: Integer): Boolean;
begin
  try
    ClientModule.smRestConnection.smFormaPagamentoClient.DeleteFormaPagamento(AId);
    Result := True;
  except
    on E: TDSRestProtocolException do
      HandleRestException(ClientModule.smRestConnection.DSRestConnection1, 'Delete error', E)
    else
      Result := False;
  end
end;

procedure TfrmFormaPagamento.FormCreate(Sender: TObject);
begin
  initialize(False, 1, 0);
end;

procedure TfrmFormaPagamento.FormShow(Sender: TObject);
begin
  GetAllFormaPagamento;
end;

procedure TfrmFormaPagamento.GetAllFormaPagamento;
var
  LDataSetList: TFDJSONDataSets;
begin
  try
    LDataSetList := ClientModule.smRestConnection.smFormaPagamentoClient.GetAllFormaPagamento;
    fdMemTableFormaPagamento.Active := False;
    Assert(TFDJSONDataSetsReader.GetListCount(LDataSetList) = 1);
    fdMemTableFormaPagamento.AppendData(TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));
    fdMemTableFormaPagamento.Active := True;
  except
    on E: TDSRestProtocolException do
      HandleRestException(ClientModule.smRestConnection.DSRestConnection1, 'Get Forma de Pagamento error', E)
    else
      raise;
  end;
end;

function TfrmFormaPagamento.GetDeltas: TFDJSONDeltas;
begin
  if fdMemTableFormaPagamento.State in dsEditModes then
  begin
    fdMemTableFormaPagamento.Post;
  end;
  Result := TFDJSONDeltas.Create;
  TFDJSONDeltasWriter.ListAdd(Result, 'forma_pagamento', fdMemTableFormaPagamento);
end;

procedure TfrmFormaPagamento.initialize(AEnabled: Boolean; AFocusIndex,
  AActivedIndex: Integer);
begin
  pgcFormaPagamento.Pages[AFocusIndex].Enabled := AEnabled;
  pgcFormaPagamento.Pages[AFocusIndex].Visible := AEnabled;

  pgcFormaPagamento.ActivePageIndex := AActivedIndex;
end;

end.
