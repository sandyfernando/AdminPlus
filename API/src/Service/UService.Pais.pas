unit UService.Pais;

interface
uses
  UDAO.Pais, Horse, UModel.Pais;
type
  TServicePais = class
  private
    FDAOPais: TDAOPais;
    FPaisModel: TPaisModel;
  public
    constructor Create;

    function Load(Req: THorseRequest): String;

    destructor Destroy; override;
  end;

implementation

uses
  System.SysUtils;

{ TServicePais }

constructor TServicePais.Create;
begin
  inherited;
  FDAOPais := TDAOPais.Create;
  FPaisModel := TPaisModel.Create;
end;

destructor TServicePais.Destroy;
begin
  if Assigned(FDAOPais) then
    FreeAndNil(FDAOPais);
  if Assigned(FPaisModel) then
    FreeAndNil(FPaisModel);

  inherited;
end;

function TServicePais.Load(Req: THorseRequest): String;
begin
  FDAOPais.Select(FPaisModel);
//  Result := FPaisModel;
  Result := 'get pais'
end;

end.
