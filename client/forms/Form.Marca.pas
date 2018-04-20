unit Form.Marca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Data.DB, FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Data.FireDACJSONReflect, Datasnap.DSClientRest;

type
  TfrmMarca = class(TForm)
    pgcMarca: TPageControl;
    tsConsulta: TTabSheet;
    tsCadastro: TTabSheet;
    btnNew: TButton;
    grdMarca: TDBGrid;
    fdMemTableMarca: TFDMemTable;
    dsMarca: TDataSource;
    sslBin: TFDStanStorageBinLink;
    sslJson: TFDStanStorageJSONLink;
    intgrfldMemTableMarcaID: TIntegerField;
    wdstrngfldMemTableMarcaDESCRICAO: TWideStringField;
    lbl1: TLabel;
    edtId: TDBEdit;
    lbl2: TLabel;
    edtDescricao: TDBEdit;
    btnDelete: TButton;
    btnClear: TButton;
    btnSave: TButton;
    procedure btnClearClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdMarcaDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure initialize(AEnabled: Boolean; AFocusIndex, AActivedIndex: Integer);

    procedure GetAllMarca;
    procedure ApplyUpdate;
    function DeleteMarca(AId: Integer): Boolean;
    function GetDeltas: TFDJSONDeltas;
  public
    { Public declarations }
  end;

var
  frmMarca: TfrmMarca;

implementation

uses ClientModule, System.Generics.Collections, System.JSON;

{$R *.dfm}

procedure HandleRESTException(const AConnection: TDSRestConnection; const APrefix: string; const E: TDSRestProtocolException);
var
  LJSONValue: TJSONValue;
  LMessage: string;
  LPair: TJSONPair;
begin
  // Padronizando mensagem de erro no caso de exce��o do servidor

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

{ TfrmMarca }

procedure TfrmMarca.ApplyUpdate;
var
  LDeltaList: TFDJSONDeltas;
begin
  LDeltaList := GetDeltas;
  try
    ClientModule.smRestConnection.smMarcaClient.ApplyChangesMarca(LDeltaList);
    GetAllMarca;
  except
    on E: TDSRestProtocolException do
      HandleRestException(ClientModule.smRestConnection.DSRestConnection1, 'Apply Updates error', E)
    else
      raise;
  end;
end;

procedure TfrmMarca.btnClearClick(Sender: TObject);
begin
  edtDescricao.SetFocus;
  fdMemTableMarca.Insert;
end;

procedure TfrmMarca.btnDeleteClick(Sender: TObject);
var
  Msg: string;
  Id: Integer;
begin
  Id := StrToInt(edtId.Field.Text);

  Msg := Format('Deseja remover o registro atual, %d?', [id]);

  if MessageDlg(Msg, mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
  begin
    if DeleteMarca(Id) then
    begin
      fdMemTableMarca.Delete;
      initialize(False, 1, 0);
      Exit;
    end;
  end;
end;

procedure TfrmMarca.btnNewClick(Sender: TObject);
begin
  initialize(True, 1, 1);
  fdMemTableMarca.Insert;
end;

procedure TfrmMarca.btnSaveClick(Sender: TObject);
begin
  ApplyUpdate;
  initialize(False, 1, 0);
end;

function TfrmMarca.DeleteMarca(AId: Integer): Boolean;
begin
  try
    ClientModule.smRestConnection.smMarcaClient.DeleteMarca(AId);
    Result := True;
  except
    on E: TDSRestProtocolException do
      HandleRestException(ClientModule.smRestConnection.DSRestConnection1, 'Delete error', E)
    else
      Result := False;
  end
end;


procedure TfrmMarca.FormCreate(Sender: TObject);
begin
  initialize(False, 1, 0);
end;

procedure TfrmMarca.FormShow(Sender: TObject);
begin
  GetAllMarca;
end;

procedure TfrmMarca.GetAllMarca;
var
  LDataSetList: TFDJSONDataSets;
begin
  try
    LDataSetList := ClientModule.smRestConnection.smMarcaClient.GetAllMarca();
    fdMemTableMarca.Active := False;
    Assert(TFDJSONDataSetsReader.GetListCount(LDataSetList) = 1);
    fdMemTableMarca.AppendData(TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));
    fdMemTableMarca.Active := True;
  except
    on E: TDSRestProtocolException do
      HandleRestException(ClientModule.smRestConnection.DSRestConnection1, 'Get Marca error', E)
    else
      raise;
  end;
end;


function TfrmMarca.GetDeltas: TFDJSONDeltas;
begin
  if fdMemTableMarca.State in dsEditModes then
  begin
    fdMemTableMarca.Post;
  end;
  Result := TFDJSONDeltas.Create;
  TFDJSONDeltasWriter.ListAdd(Result, 'marca', fdMemTableMarca);
end;

procedure TfrmMarca.grdMarcaDblClick(Sender: TObject);
begin
  initialize(True, 1, 1);
end;

procedure TfrmMarca.initialize(AEnabled: Boolean; AFocusIndex,
  AActivedIndex: Integer);
begin
  pgcMarca.Pages[AFocusIndex].Enabled := AEnabled;
  pgcMarca.Pages[AFocusIndex].Visible := AEnabled;

  pgcMarca.ActivePageIndex := AActivedIndex;
end;

end.
