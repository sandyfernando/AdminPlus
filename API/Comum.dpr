program Comum;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  Horse,
  Horse.Jhonson,
  System.JSON,
  UModel.Pais in 'src\Model\UModel.Pais.pas',
  UControler.Pais in 'src\Controller\UControler.Pais.pas',
  UControler.Ping in 'src\Controller\UControler.Ping.pas',
  UDAO.Conexao in 'src\DAO\UDAO.Conexao.pas',
  UModel in 'src\Model\UModel.pas',
  UDAO in 'src\DAO\UDAO.pas',
  UService in 'src\Service\UService.pas',
  UService.Pais in 'src\Service\UService.Pais.pas',
  UModel.estado in 'src\Model\UModel.estado.pas',
  UController.Estado in 'src\Controller\UController.Estado.pas',
  UService.Estado in 'src\Service\UService.Estado.pas',
  UModel.cidade in 'src\Model\UModel.cidade.pas',
  UUtils.Ini in 'src\Utils\UUtils.Ini.pas',
  UModel.Confg in 'src\Model\UModel.Confg.pas',
  UController.Cidade in 'src\Controller\UController.Cidade.pas',
  UService.Cidade in 'src\Service\UService.Cidade.pas',
  UModel.endereco in 'src\Model\UModel.endereco.pas',
  UController.Endereco in 'src\Controller\UController.Endereco.pas',
  UService.Endereco in 'src\Service\UService.Endereco.pas',
  UModel.contato in 'src\Model\UModel.contato.pas',
  UService.Contato in 'src\Service\UService.Contato.pas',
  UController.Pessoa in 'src\Controller\UController.Pessoa.pas',
  UModel.pessoa in 'src\Model\UModel.pessoa.pas',
  UService.Pessoa in 'src\Service\UService.Pessoa.pas';

begin
  ReportMemoryLeaksOnShutdown := True;
  THorse.Use(Jhonson);
  UControler.Ping.Registry;
  UControler.Pais.Registry;
  UController.Estado.Registry;
  UController.Cidade.Registry;
  UController.Endereco.Registry;
  UController.Pessoa.Registry;

//{$IFDEF MSWINDOWS}
//  if DebugHook = 1 then // verifica se esta sendo feito a execução em modo Debug
//  begin

//    Writeln('Execuação em modo debug')
//  end
//  else
//    Writeln('Execução nomal');
//{$ENDIF}

  THorse.Listen(9000);

end.
