unit uClienteDao;

interface

uses
  FireDAC.Comp.Client, uConexao, uClienteModel, System.SysUtils;

type
  TClienteDao = class
  private
    FConexao: TConexao;
  public
    constructor Create;

    function Incluir(AClienteModel: TClienteModel): Boolean;
    function Alterar(AClienteModel: TClienteModel): Boolean;
    function Excluir(AClienteModel: TClienteModel): Boolean;
    function GetId(AAutoIncrementar: Integer): Integer;
    function Obter: TFDQuery;
  end;

implementation

{ TClienteDao }

uses uSistemaControl;

function TClienteDao.Alterar(AClienteModel: TClienteModel): Boolean;
var
  VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  try
    VQry.ExecSQL('update cliente set nome = :nome, cpfcnpj = :cpfcnpj  where (codigo = :codigo)', [AClienteModel.Nome, AClienteModel.CpfCnpj, AClienteModel.Codigo]);

    Result := True;
  finally
    VQry.Free;
  end;
end;

constructor TClienteDao.Create;
begin
  FConexao := TSistemaControl.GetInstance().Conexao;
end;

function TClienteDao.Excluir(AClienteModel: TClienteModel): Boolean;
var
  VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  try
    VQry.ExecSQL('delete from cliente where (codigo = :codigo)', [AClienteModel.Codigo]);

    Result := True;
  finally
    VQry.Free;
  end;
end;

function TClienteDao.GetId(AAutoIncrementar: Integer): Integer;
var
  VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  try
    VQry.Open('select gen_id(gen_cliente_id, ' + IntToStr(AAutoIncrementar) + ' ) from rdb$database');
    try
      Result := VQry.Fields[0].AsInteger;
    finally
      VQry.Close;
    end;
  finally
    VQry.Free;
  end;
end;

function TClienteDao.Incluir(AClienteModel: TClienteModel): Boolean;
var
  VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  try
    VQry.ExecSQL('insert into cliente (codigo, nome, cpfcnpj) values (:codigo, :nome, :cpfcnpj)', [AClienteModel.Codigo, AClienteModel.Nome, AClienteModel.CpfCnpj]);

    Result := True;
  finally
    VQry.Free;
  end;
end;

function TClienteDao.Obter: TFDQuery;
var
  VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();

  VQry.Open('select codigo, nome from cliente order by 1');

  Result := VQry;
end;

end.
