unit UConexaoDAO;

interface
uses
  FireDAC.Comp.Client, System.Classes, FireDAC.Stan.Def, FireDAC.Phys.MySQL, FireDAC.Phys.pg, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.Intf, FireDAC.Comp.UI, FireDAC.Stan.Async;
  Type
    TConexaoDAO = Class
      public
        class function PrepararQuery(Connection: TFDConnection): TFDQuery;
        class function geTFDConnection: TFDConnection;
        class function IniciarTransacao(Connection: TFDConnection): TFDTransaction;
        class procedure FinalizarTransacao(Connection: TFDConnection; Transacao: TFDTransaction; Commit: Boolean);
    End;

implementation
uses
  Vcl.Forms, System.SysUtils, Vcl.Dialogs;

{ TCanexaoDAO }


class procedure TConexaoDAO.FinalizarTransacao(Connection: TFDConnection; Transacao: TFDTransaction; Commit: Boolean);
begin
  if assigned(Transacao) then
  begin
    if Commit then
      Transacao.Commit
    else
      Transacao.Rollback
  end
  else
  begin
    if Commit then
      Connection.Commit
    else
      Connection.Rollback
  end;
end;

class function TConexaoDAO.geTFDConnection: TFDConnection;
var
  CaminhoRede           : String;
  Connection            : TFDConnection;
  FDPhyspgLDriverLink : TFDPhyspgDriverLink;
begin
  Connection := nil;

  try
    try
      Connection := TFDConnection.Create(nil);
      Connection.DriverName  := 'PG';
      Connection.Params.Values['DriverID']  :='PG';
      Connection.Params.Values['hostname']  :='172.19.51.212';
      Connection.Params.Values['Database']  :='Dados';
      Connection.Params.Values['User_name'] :='postgres';
      Connection.Params.Values['Password']  := 'root';


      Connection.Connected := True;
    except
      on Expt: Exception do
      begin
        if Trim(CaminhoRede) = '' then
        begin
          CaminhoRede := '(Não informado)';
        end;

        MessageDlg
          ('Ocorreu uma falha durante a tentativa de conectar com o banco de dados! Priorize será encerrado.'
          + #13 + 'Caminho de Rede: ' + CaminhoRede + #13 + #13 + 'Mensagem: ' +
          Expt.Message, mtError, [mbOK], 0);

        Application.Terminate;
      end;
    end;
  finally
    Result := Connection;
  end;

end;

class function TConexaoDAO.IniciarTransacao(Connection: TFDConnection): TFDTransaction;
begin
  if not assigned(Connection.Transaction) then
  begin
    Result := TFDTransaction.Create(Nil);
    Connection.Transaction := Result;
  end;
  Connection.Transaction.StartTransaction;
end;

class function TConexaoDAO.PrepararQuery(Connection: TFDConnection): TFDQuery;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  Query.Connection := Connection;
  Result := Query;
end;

end.
