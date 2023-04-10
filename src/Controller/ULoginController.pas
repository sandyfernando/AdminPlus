unit ULoginController;

interface
uses
  UUsuario, UController, UConexaoDAO;
  type
    TLoginController = Class(TController)
      private
         function ValidarDadosLogin(Usuario : TUsuario) : Boolean;
      public
        function Logar(var Usuario : TUsuario) : Boolean;
    End;


implementation
uses
  UUsuarioDAO, System.SysUtils, Vcl.Dialogs;

{ TLoginController }

function TLoginController.Logar(var Usuario: TUsuario): Boolean;
var
  UsuarioDAO : TUsuarioDAO;
begin
  UsuarioDAO := TUsuarioDAO.Create;
  try
    if ValidarDadosLogin(Usuario) then
    begin
      Result := False;
      exit;
    end;

    Result := UsuarioDAO.BuscarUsuario(Usuario);

  finally
    FreeAndNil(UsuarioDAO);
  end;
end;

function TLoginController.ValidarDadosLogin(Usuario: TUsuario): Boolean;
var
  msg: String;
begin
  Result := False;
  msg    := '';

  if Usuario.Login = '' then
    msg := 'Login não pode esta em branco.';

  if Usuario.Senha = '' then
    msg := 'Senha não pode esta em branco';

  if msg <> '' then
  begin
    ShowMessage(msg);
    Result := True;
  end;


end;

end.
