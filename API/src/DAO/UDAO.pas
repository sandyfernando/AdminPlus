unit UDAO;

interface
uses
  FireDAC.Comp.Client, FireDAC.Stan.Def, UDAO.Conexao;
type
  TDAO = class
    private
      FConexao: TFDConnection;
    public
      constructor Create;
      destructor Destroy; override;
  end;

implementation

uses
  System.SysUtils;

{ TDAO }

constructor TDAO.Create;
begin
  FConexao := TConecaoDAO.ObterInstancia.Connectar;
end;

destructor TDAO.Destroy;
begin
//  if Assigned(FConexao) then
//    FreeAndNil(FConexao);

  inherited;
end;

end.
