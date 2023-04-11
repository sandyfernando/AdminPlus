unit UUsuarioDAO;

interface
uses
  FireDAC.Comp.Client,
  UUsuario,
  UConexaoDAO,
  UDAO;
  type
   TUsuarioDAO = Class(TDAO)
     private
       procedure Alterar (const aUsuario : TUsuario);
       procedure Incluir (const aUsuario : TUsuario);


     public
       function BuscarUsuario      (var aUsuario   : TUsuario)                          : Boolean;
       function BuscarUsuarioLista (aMemTab    : TFDMemTable; const aUsario : TUsuario) : Boolean;
       function Gravar             (const aUsuario : TUsuario)                          : Boolean;
       function Excluir            (const aUsuario : TUsuario)                          : Boolean;
       function Login              (var aUsuario   : TUsuario)                          : Boolean;
   End;

implementation
uses
  System.SysUtils;

{ TUsuarioDAO }

procedure TUsuarioDAO.Alterar(const aUsuario: TUsuario);
var
  lQuery : TFDQuery;
begin
  lQuery  := PrepararQuery(Connection);
  try
    try
      lQuery.SQL.Add(
         ' UPDATE USUARIO SET                 '+
         '    LOGIN         = :LOGIN,         '+
         '    SENHA         = :SENHA,         '+
         '    IDFUNCIONARIO = :IDFUNCIONARIO  '+
         ' WHERE IDUSUARIO= : IDUSUARIO)                    ');

      CarregarParametros(lQuery, aUsuario);

      lQuery.ExecSQL;
    except
      on E: Exception do
      begin
        raise
      end;
    end;
  finally
    System.SysUtils.FreeAndNil(lQuery);
  end;

end;

function TUsuarioDAO.BuscarUsuarioLista(aMemTab: TFDMemTable; const aUsario: TUsuario): Boolean;
var
  lQuery : TFDQuery;
begin
  lQuery  := PrepararQuery();
  Result := False;
  try
    lQuery.SQL.Add(' SELECT IDUSUARIO,   '+
                  '        LOGIN,        '+
                  '        SENHA,        '+
                  '        IDFUNCIONARIO '+
                  ' FROM usuario         ');

    lQuery.Open;

    if not lQuery.IsEmpty then
    begin
      aMemTab.Data := lQuery.Data;
      Result       := True;
    end;
  finally
    System.SysUtils.FreeAndNil(lQuery);
  end;

end;

function TUsuarioDAO.Excluir(const aUsuario: TUsuario): Boolean;
var
  lQuery : TFDQuery;
begin
  lQuery  := PrepararQuery(Connection);
  try
    try
      lQuery.SQL.Add(
         ' DELETE FROM USUARIO WHERE IDUSUARIO= : IDUSUARIO ');

      CarregarParametros(lQuery, aUsuario);

      lQuery.ExecSQL;

      Result := True;
    except
      on E: Exception do
      begin
        Result := False;
        raise
      end;
    end;
  finally
    System.SysUtils.FreeAndNil(lQuery);
  end;

end;

function TUsuarioDAO.BuscarUsuario(var aUsuario: TUsuario): Boolean;
var
  lQuery : TFDQuery;
begin
  lQuery  := PrepararQuery();
  Result := False;
  try
    lQuery.SQL.Add(' SELECT IDUSUARIO,   '+
                  '        LOGIN,        '+
                  '        SENHA,        '+
                  '        IDFUNCIONARIO '+
                  ' FROM usuario         '+
                  ' WHERE IDUSUARIO = :IDUSUARIO ');

    CarregarParametros(lQuery, aUsuario);

    lQuery.Open;

    if not lQuery.IsEmpty then
    begin
      aUsuario.Carregar(lQuery);
    end;
  finally
    System.SysUtils.FreeAndNil(lQuery);
  end;
end;

function TUsuarioDAO.Gravar(const aUsuario: TUsuario): Boolean;
begin
  try
    if aUsuario.IdUsuario = 0 then
    begin
      Incluir(aUsuario);
    end
    else
    begin
      Alterar(aUsuario);
    end;

  except
    on E: Exception do
    begin
      raise
    end;
  end;


end;

procedure TUsuarioDAO.Incluir(const aUsuario: TUsuario);
var
  lQuery : TFDQuery;
begin
  lQuery  := PrepararQuery(aUsuario.Connection);
  try
    try
    lQuery.SQL.Add(' INSERT INTO USUARIO(     '+
                  '     LOGIN,               '+
                  '     SENHA,               '+
                  '     IDFUNCIONARIO)       '+
                  '   VALUES(                '+
                  '     :LOGIN,              '+
                  '     :SENHA,              '+
                  '     :IDFUNCIONARIO)      ');

    CarregarParametros(lQuery, aUsuario);

    lQuery.ExecSQL
    except
      on E: Exception do
      begin
        raise
      end;
    end;
  finally
    System.SysUtils.FreeAndNil(lQuery);
  end;
end;


function TUsuarioDAO.Login(var aUsuario: TUsuario): Boolean;
var
  lQuery : TFDQuery;
begin
  lQuery  := PrepararQuery();
  Result := False;
  try
    lQuery.SQL.Add(' SELECT IDUSUARIO,   '+
                  '        LOGIN,        '+
                  '        SENHA,        '+
                  '        IDFUNCIONARIO '+
                  ' FROM usuario         '+
                  ' WHERE LOGIN = :LOGIN '+
                  '   AND SENHA = :SENHA  ');

    CarregarParametros(lQuery, aUsuario);

    lQuery.Open;

    if not lQuery.IsEmpty then
    begin
      aUsuario.Carregar(lQuery);
      Result := True;
    end;
  finally
    System.SysUtils.FreeAndNil(lQuery);
  end;

end;

end.
