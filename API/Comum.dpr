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
  UDAO.Pais in 'src\DAO\UDAO.Pais.pas',
  UDAO.Conexao in 'src\DAO\UDAO.Conexao.pas',
  UModel in 'src\Model\UModel.pas',
  UDAO in 'src\DAO\UDAO.pas',
  UService in 'src\Service\UService.pas',
  UService.Pais in 'src\Service\UService.Pais.pas';

begin
  UControler.Pais.Registry;
  UControler.Ping.Registry;

//{$IFDEF MSWINDOWS}
//  if DebugHook = 1 then // verifica se esta sendo feito a execu��o em modo Debug
//  begin
    ReportMemoryLeaksOnShutdown := True;
//    Writeln('Execua��o em modo debug')
//  end
//  else
//    Writeln('Execu��o nomal');
//{$ENDIF}

  THorse.Listen(9000);

end.
