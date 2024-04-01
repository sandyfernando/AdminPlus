unit UDAO.Conexao;

interface
uses
  FireDAC.Comp.Client, FireDAC.Phys.PG, System.SysUtils, FireDAC.Stan.Def;
type
  TConecaoDAO = class
    private
      FConexao: TFDConnection;

      procedure CarregarDadosConexao;


      constructor Create;
    public
      destructor Destroy; override;

    class function ObterInstancia: TConecaoDAO;
    class function NewInstance: TObject; override;
    function Connectar: TFDConnection;

  end;
var
  Instancia: TConecaoDAO;

implementation
uses
  System.IniFiles;

{ TConecaoDAO }

procedure TConecaoDAO.CarregarDadosConexao;
var
  lArq_ini: string;
  lIni: TIniFile;
begin
  try
    try
      lArq_ini := GetCurrentDir + '\bd.ini';

      // Verifica se INI existe...
      if NOT FileExists(lArq_ini) then
      begin
          raise Exception.Create('Arquivo INI não encontrado: ' + lArq_ini);
          exit;
      end;

      lIni := TIniFile.Create(lArq_ini);

      FConexao.Params.Clear;
      FConexao.LoginPrompt := False;
      FConexao.DriverName  := 'PG';
      FConexao.Params.Add('Database=' + lIni.ReadString('bd', 'Database', ''));
      FConexao.Params.Add('DriverID=PG');
      FConexao.Params.Add('Server=' + lIni.ReadString('bd', 'Server', ''));
      FConexao.Params.Add('User_Name=' + lIni.ReadString('bd', 'User_name', ''));
      FConexao.Params.Add('Password=' + lIni.ReadString('bd', 'Password', ''));
      FConexao.Params.Add('port=' + lIni.ReadString('bd', 'Port', ''));

      FConexao.Open;

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao carregar banco: ' + E.Message);
      end;
    end;

  finally
    if Assigned(lIni) then
      lIni.DisposeOf;
  end;
end;

function TConecaoDAO.Connectar: TFDConnection;
begin
  Result := FConexao;
end;

constructor TConecaoDAO.Create;
begin
  if not Assigned(FConexao) then
  begin
    FConexao := TFDConnection.Create(nil);
    CarregarDadosConexao;
  end;
end;

destructor TConecaoDAO.Destroy;
begin
  if Assigned(FConexao) then
    FConexao.Free;
  inherited;
end;

class function TConecaoDAO.NewInstance: TObject;
begin
  if not Assigned(Instancia) then
  begin
    // chama a função "NewInstance" da herança (TObject)
    Instancia := TConecaoDAO(inherited NewInstance);
  end;

  result := Instancia
end;

class function TConecaoDAO.ObterInstancia: TConecaoDAO;
begin
  Result := TConecaoDAO.Create;
end;
initialization

finalization

  FreeAndNil(Instancia);
end.
