program AdminPlus;

uses
  Vcl.Forms,
  UController in 'src\Controller\UController.pas',
  ULoginController in 'src\Controller\ULoginController.pas',
  UConexaoDAO in 'src\DAO\UConexaoDAO.pas',
  UDAO in 'src\DAO\UDAO.pas',
  UUsuarioDAO in 'src\DAO\UUsuarioDAO.pas',
  UCad in 'src\View\UCad.pas' {FCad},
  ULista in 'src\View\ULista.pas' {FLista},
  ULogin in 'src\View\ULogin.pas' {FLogin},
  UPrincipal in 'src\View\UPrincipal.pas' {FPrincipal},
  UEntidade in 'src\Model\Comum\UEntidade.pas',
  UCidade in 'src\Model\Comum\UCidade.pas',
  UEndereco in 'src\Model\Comum\UEndereco.pas',
  UEstado in 'src\Model\Comum\UEstado.pas',
  UUsuario in 'src\Model\Login\UUsuario.pas',
  UPessoa in 'src\Model\Comum\UPessoa.pas',
  UUsuarioController in 'src\Controller\UUsuarioController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.Run;
end.
