unit UUsuarioController;

interface
uses
  UController, UUsuario, FireDAC.Comp.Client, UUsuarioDAO, UConexaoDAO;
type
  TUsauarioController = class(TController)
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

function TUsauarioController.BuscarEntidade(aUsuario: TUsuario): Boolean;
begin
  FUsuarioDAO.BuscarUsuario(aUsuario);
end;

function TUsauarioController.BuscarListaEntidade(aUsuario: TUsuario): TFDMemTable;
begin
  FUsuarioDAO.BuscarUsuarioLista(MemTab, Usuario);
end;

constructor TUsauarioController.Create;
begin
  inherited;
  FUsuario    := TUsuario.Create;;
  FUsuarioDAO := TUsuarioDAO.Create;
end;

destructor TUsauarioController.Destroy;
begin
  FreeAndNil(FUsuario);
  FreeAndNil(FUsuarioDAO);
  inherited;
end;

function TUsauarioController.Excluir(aUsuario: TUsuario): Boolean;
begin
   FUsuarioDAO.Excluir(aUsuario);
end;

procedure TUsauarioController.Gravar(aUsuario: TUsuario);
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
