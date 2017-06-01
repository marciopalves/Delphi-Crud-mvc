program PrjMVC;

uses
  Vcl.Forms,
  uFrmPrincipalView in 'View\uFrmPrincipalView.pas' {frmPrincipal},
  uConexao in 'Dao\uConexao.pas',
  uSistemaControl in 'Controlle\uSistemaControl.pas',
  uEmpresaModel in 'Model\uEmpresaModel.pas',
  uEmpresaDao in 'Dao\uEmpresaDao.pas',
  uEnumerado in 'Model\uEnumerado.pas',
  uClienteModel in 'Model\uClienteModel.pas',
  uClienteDao in 'Dao\uClienteDao.pas',
  uClienteControl in 'Controlle\uClienteControl.pas',
  uFrmClienteView in 'View\uFrmClienteView.pas' {frmCadastroCliente};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
