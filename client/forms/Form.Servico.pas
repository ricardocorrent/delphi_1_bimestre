unit Form.Servico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Mask, Vcl.DBCtrls,
  Data.FireDACJSONReflect, Datasnap.DSClientRest;

type
  TfrmServico = class(TForm)
    pgcServico: TPageControl;
    tsConsulta: TTabSheet;
    tsCadastro: TTabSheet;
    grdServico: TDBGrid;
    btnNew: TButton;
    fdMemTableServico: TFDMemTable;
    dsServico: TDataSource;
    sslBin: TFDStanStorageBinLink;
    sslJson: TFDStanStorageJSONLink;
    intgrfldMemTableServicoID: TIntegerField;
    wdstrngfldMemTableServicoDESCRICAO: TWideStringField;
    lbl1: TLabel;
    edtId: TDBEdit;
    lbl2: TLabel;
    edtDescricao: TDBEdit;
    lbl3: TLabel;
    btnDelete: TButton;
    btnClear: TButton;
    btnSave: TButton;
    crncyfldMemTableServicoVALOR: TCurrencyField;
    edtValor: TDBEdit;
    procedure btnClearClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdServicoDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure initialize(AEnabled: Boolean; AFocusIndex, AActivedIndex: Integer);

    procedure GetAllServico;
    procedure ApplyUpdate;
    function DeleteServico(AId: Integer): Boolean;
    function GetDeltas: TFDJSONDeltas;
  end;

var
  frmServico: TfrmServico;

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
{ TfrmServico }

procedure TfrmServico.ApplyUpdate;
var
  LDeltaList: TFDJSONDeltas;
begin
  LDeltaList := GetDeltas;
  try
    ClientModule.smRestConnection.smServicoClient.ApplyChangesServico(LDeltaList);
    GetAllServico;
  except
    on E: TDSRestProtocolException do
      HandleRestException(ClientModule.smRestConnection.DSRestConnection1, 'Apply Updates error', E)
    else
      raise;
  end;
end;

procedure TfrmServico.btnClearClick(Sender: TObject);
begin
  edtDescricao.SetFocus;
  edtValor.SetFocus;
  fdMemTableServico.Insert;
end;

procedure TfrmServico.btnDeleteClick(Sender: TObject);
var
  Msg: string;
  Id: Integer;
begin
  Id := StrToInt(edtId.Field.Text);

  Msg := Format('Deseja remover o registro atual, %d?', [id]);

  if MessageDlg(Msg, mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
  begin
    if DeleteServico(Id) then
    begin
      fdMemTableServico.Delete;
      initialize(False, 1, 0);
      Exit;
    end;
  end;
end;

procedure TfrmServico.btnNewClick(Sender: TObject);
begin
  initialize(True, 1, 1);
  fdMemTableServico.Insert;
end;

procedure TfrmServico.btnSaveClick(Sender: TObject);
begin
  ApplyUpdate;
  initialize(False, 1, 0);
end;

function TfrmServico.DeleteServico(AId: Integer): Boolean;
begin
  try
    ClientModule.smRestConnection.smServicoClient.DeleteServico(AId);
    Result := True;
  except
    on E: TDSRestProtocolException do
      HandleRestException(ClientModule.smRestConnection.DSRestConnection1, 'Delete error', E)
    else
      Result := False;
  end
end;

procedure TfrmServico.FormCreate(Sender: TObject);
begin
  initialize(False, 1, 0);
end;

procedure TfrmServico.FormShow(Sender: TObject);
begin
  GetAllServico;
end;

procedure TfrmServico.GetAllServico;
var
  LDataSetList: TFDJSONDataSets;
begin
  try
    LDataSetList := ClientModule.smRestConnection.smServicoClient.GetAllServico();
    fdMemTableServico.Active := False;
    Assert(TFDJSONDataSetsReader.GetListCount(LDataSetList) = 1);
    fdMemTableServico.AppendData(TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));
    fdMemTableServico.Active := True;
  except
    on E: TDSRestProtocolException do
      HandleRestException(ClientModule.smRestConnection.DSRestConnection1, 'Get Serviço error', E)
    else
      raise;
  end;
end;

function TfrmServico.GetDeltas: TFDJSONDeltas;
begin
  if fdMemTableServico.State in dsEditModes then
  begin
    fdMemTableServico.Post;
  end;
  Result := TFDJSONDeltas.Create;
  TFDJSONDeltasWriter.ListAdd(Result, 'servico', fdMemTableServico);
end;

procedure TfrmServico.grdServicoDblClick(Sender: TObject);
begin
  initialize(True, 1, 1);
end;

procedure TfrmServico.initialize(AEnabled: Boolean; AFocusIndex,
  AActivedIndex: Integer);
begin
  pgcServico.Pages[AFocusIndex].Enabled := AEnabled;
  pgcServico.Pages[AFocusIndex].Visible := AEnabled;

  pgcServico.ActivePageIndex := AActivedIndex;
end;

end.
