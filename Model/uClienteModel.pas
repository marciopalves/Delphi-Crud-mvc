unit uClienteModel;

interface

uses
  uEnumerado;

type
  TClienteModel = class
  private
    FAcao: TAcao;
    FCodigo: Integer;
    FNome: string;
    FCpfCnpj: string;

  public
    property Codigo: Integer read FCodigo write FCodigo;
    property Nome: string read FNome write FNome;
    property Acao: TAcao read FAcao write FAcao;
    property CpfCnpj : string read FCpfCnpj write FCpfCnpj;
  end;

implementation

{ TCliente }


end.
