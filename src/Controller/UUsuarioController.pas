unit UUsuarioController;

interface
uses
  UController, UUsuario, FireDAC.Comp.Client, UUsuarioDAO, UConexaoDAO;
type
  TUsauario = class(TController)
    private
      FUsuario    : TUsuario;
      FUsuarioDAO : TUsuarioDAO;
    public
      procedure Gravar             (aUsuario : TUsuario);

      function BuscarEntidade      (aUsuario : TUsuario) : Boolean;
      function BuscarListaEntidade (aUsuario : TUsuario) : TFDMemTable;
      function Excluir             (aUsuario : TUsuario) : Boolean;

      property  Usuario : TUsuario read FUsuario write FUsuario;

      constructor Create;
      Destructor  Destroy; override;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs;

{ TUsauario }

function TUsauario.BuscarEntidade(aUsuario: TUsuario): Boolean;
begin

end;

function TUsauario.BuscarListaEntidade(aUsuario: TUsuario): TFDMemTable;
begin

end;

constructor TUsauario.Create;
begin
  inherited;
  FUsuario    := TUsuario.Create;;
  FUsuarioDAO := TUsuarioDAO.Create;
end;

destructor TUsauario.Destroy;
begin
  FreeAndNil(FUsuario);
  FreeAndNil(FUsuarioDAO);
  inherited;
end;

function TUsauario.Excluir(aUsuario: TUsuario): Boolean;
begin

end;

procedure TUsauario.Gravar(aUsuario: TUsuario);
begin
  try
    aUsuario.Connection.Assign(TConexaoDAO.getfdConnection);
    TConexaoDAO.IniciarTransacao(aUsuario.Connection);

    FUsuarioDAO.Gravar(aUsuario);

    TConexaoDAO.FinalizarTransacao(aUsuario.Connection, nil , True);
  except
    on E: Exception do
    begin
      TConexaoDAO.FinalizarTransacao(aUsuario.Connection, nil , False);
      ShowMessage(e.Message);
    end;
  end;
end;

end.
