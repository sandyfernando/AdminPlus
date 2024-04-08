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
  UService.Estado in 'src\Service\UService.Estado.pas';

begin
  ReportMemoryLeaksOnShutdown := True;

  UControler.Ping.Registry;
  UControler.Pais.Registry;
  UController.Estado.Registry;

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
