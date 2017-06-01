unit uClienteControl;

interface

uses
  uClienteModel, System.SysUtils, FireDAC.Comp.Client, uClienteDao, uEnumerado;

type
  TClienteControl = class
  private
    FClienteModel: TClienteModel;

  public
    constructor Create;
    destructor Destroy; override;

    function Salvar: Boolean;
    function Obter: TFDQuery;
    function GetId(AAutoIncrementar: Integer): Integer;

    property ClienteModel: TClienteModel read FClienteModel write FClienteModel;
  end;

implementation

{ TClienteControl }

constructor TClienteControl.Create;
begin
  FClienteModel := TClienteModel.Create;
end;

destructor TClienteControl.Destroy;
begin
  FClienteModel.Free;

  inherited;
end;

function TClienteControl.GetId(AAutoIncrementar: Integer): Integer;
var
  VClienteDao: TClienteDao;
begin
  VClienteDao := TClienteDao.Create;
  try
    Result := VClienteDao.GetId(AAutoIncrementar);
  finally
    VClienteDao.Free;
  end;
end;


function TClienteControl.Obter: TFDQuery;
var
  VClienteDao: TClienteDao;
begin
  VClienteDao := TClienteDao.Create;
  try
    Result := VClienteDao.Obter;
  finally
    VClienteDao.Free;
  end;
end;

function TClienteControl.Salvar: Boolean;
var
  VClienteDao: TClienteDao;
begin
  Result := False;
  VClienteDao := TClienteDao.Create;
  try
    case ClienteModel.Acao of
      uEnumerado.tacIncluir: Result := VClienteDao.Incluir(ClienteModel);
      uEnumerado.tacAlterar: Result := VClienteDao.Alterar(ClienteModel);
      uEnumerado.tacExcluir: Result := VClienteDao.Excluir(ClienteModel);
    end;
    Result := True;
  finally
    VClienteDao.Free;
  end;

end;

end.
