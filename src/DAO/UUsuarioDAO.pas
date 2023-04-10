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
       function BuscarUsuario      (var aUsuario   : TUsuario)                             : Boolean;
       function BuscarUsuarioLista (var aMemTab    : TFDMemTable; const aUsario : TUsuario) : Boolean;
       function Gravar             (const aUsuario : TUsuario) : Boolean;
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
         ' WHERE ID= : ID)                    ');

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

function TUsuarioDAO.BuscarUsuarioLista(var aMemTab: TFDMemTable; const aUsario: TUsuario): Boolean;
begin

end;

function TUsuarioDAO.BuscarUsuario(var aUsuario: TUsuario): Boolean;
var
  lQuery : TFDQuery;
begin
  lQuery  := PrepararQuery();
  Result := False;
  try
    lQuery.SQL.Add(' SELECT ID,           '+
                  '        LOGIN,        '+
                  '        SENHA,        '+
                  '        IDFUNCIONARIO '+
                  ' FROM usuario         '+
                  ' WHERE LOGIN = :LOGIN '+
                  '   AND SENHA = :SENHA ');

    lQuery.ParamByName('LOGIN').AsString := aUsuario.Login;
    lQuery.ParamByName('SENHA').AsString := aUsuario.Senha;

    lQuery.Open;

    if not lQuery.IsEmpty then
    begin
      aUsuario.Id             := lQuery.FieldByName('ID').AsInteger;
      aUsuario.IdFuncioanerio := lQuery.FieldByName('IDFUNCIONARIO').AsInteger;
      Result                 := True;
    end;
  finally
    System.SysUtils.FreeAndNil(lQuery);
  end;
end;

function TUsuarioDAO.Gravar(const aUsuario: TUsuario): Boolean;
begin
  try
    if aUsuario.Id = 0 then
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


end.
