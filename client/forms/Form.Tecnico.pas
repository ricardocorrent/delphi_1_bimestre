unit Form.Tecnico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Vcl.Mask, Vcl.DBCtrls, Data.DB, FireDAC.Stan.StorageJSON,
  FireDAC.Stan.StorageBin, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Data.FireDACJSONReflect, Datasnap.DSClientRest;

type
  TfrmTecnico = class(TForm)
    pgcTecnico: TPageControl;
    tsConsulta: TTabSheet;
    tsCadastro: TTabSheet;
    grdTecnico: TDBGrid;
    btnNew: TButton;
    fdMemTableTecnico: TFDMemTable;
    dsTecnico: TDataSource;
    sslBin: TFDStanStorageBinLink;
    sslJson: TFDStanStorageJSONLink;
    intgrfldMemTableTecnicoID: TIntegerField;
    wdstrngfldMemTableTecnicoNOME: TWideStringField;
    lbl1: TLabel;
    edtId: TDBEdit;
    lbl2: TLabel;
    edtNome: TDBEdit;
    btnDelete: TButton;
    btnClean: TButton;
    btnSave: TButton;
    procedure btnCleanClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdTecnicoDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure initialize(AEnabled: Boolean; AFocusIndex, AActivedIndex: Integer);

    procedure GetAllTecnico;
    procedure ApplyUpdate;
    function DeleteTecnico(AId: Integer): Boolean;
    function GetDeltas: TFDJSONDeltas;
  public
    { Public declarations }
  end;

var
  frmTecnico: TfrmTecnico;

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

{ TfrmTecnico }

procedure TfrmTecnico.ApplyUpdate;
var
  LDeltaList: TFDJSONDeltas;
begin
  LDeltaList := GetDeltas;
  try
    ClientModule.smRestConnection.smTecnicoClient.ApplyChangesTecnico(LDeltaList);
    GetAllTecnico;
  except
    on E: TDSRestProtocolException do
      HandleRestException(ClientModule.smRestConnection.DSRestConnection1, 'Apply Updates error', E)
    else
      raise;
  end;
end;

procedure TfrmTecnico.btnCleanClick(Sender: TObject);
begin
  edtNome.SetFocus;
  fdMemTableTecnico.Insert;
end;

procedure TfrmTecnico.btnDeleteClick(Sender: TObject);
var
  Msg: string;
  Id: Integer;
begin
  Id := StrToInt(edtId.Field.Text);

  Msg := Format('Deseja remover o registro atual, %d?', [id]);

  if MessageDlg(Msg, mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
  begin
    if DeleteTecnico(Id) then
    begin
      fdMemTableTecnico.Delete;
      initialize(False, 1, 0);
      Exit;
    end;
  end;
end;

procedure TfrmTecnico.btnNewClick(Sender: TObject);
begin
  initialize(True, 1, 1);
  fdMemTableTecnico.Insert;
end;

procedure TfrmTecnico.btnSaveClick(Sender: TObject);
begin
  ApplyUpdate;
  initialize(False, 1, 0);
end;

function TfrmTecnico.DeleteTecnico(AId: Integer): Boolean;
begin
  try
    ClientModule.smRestConnection.smTecnicoClient.DeleteTecnico(AId);
    Result := True;
  except
    on E: TDSRestProtocolException do
      HandleRestException(ClientModule.smRestConnection.DSRestConnection1, 'Delete error', E)
    else
      Result := False;
  end
end;

procedure TfrmTecnico.FormCreate(Sender: TObject);
begin
  initialize(False, 1, 0);
end;

procedure TfrmTecnico.FormShow(Sender: TObject);
begin
  GetAllTecnico;
end;

procedure TfrmTecnico.GetAllTecnico;
var
  LDataSetList: TFDJSONDataSets;
begin
  try
    LDataSetList := ClientModule.smRestConnection.smTecnicoClient.GetAllTecnico;
    fdMemTableTecnico.Active := False;
    Assert(TFDJSONDataSetsReader.GetListCount(LDataSetList) = 1);
    fdMemTableTecnico.AppendData(TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));
    fdMemTableTecnico.Active := True;
  except
    on E: TDSRestProtocolException do
      HandleRestException(ClientModule.smRestConnection.DSRestConnection1, 'Get Tecnico error', E)
    else
      raise;
  end;
end;

function TfrmTecnico.GetDeltas: TFDJSONDeltas;
begin
  if fdMemTableTecnico.State in dsEditModes then
  begin
    fdMemTableTecnico.Post;
  end;
  Result := TFDJSONDeltas.Create;
  TFDJSONDeltasWriter.ListAdd(Result, 'tecnico', fdMemTableTecnico);
end;

procedure TfrmTecnico.grdTecnicoDblClick(Sender: TObject);
begin
  initialize(True, 1, 1);
end;

procedure TfrmTecnico.initialize(AEnabled: Boolean; AFocusIndex,
  AActivedIndex: Integer);
begin
  pgcTecnico.Pages[AFocusIndex].Enabled := AEnabled;
  pgcTecnico.Pages[AFocusIndex].Visible := AEnabled;

  pgcTecnico.ActivePageIndex := AActivedIndex;
end;

end.
