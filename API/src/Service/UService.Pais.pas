unit UService.Pais;

interface
uses
  UDAO, UDAO.Conexao,  Horse, UModel.Pais, ormbr.json;
type
  TServicePais = class
  private
    FDAO: TDAO<TPaisModel>;
    FPaisModel: TPaisModel;
  public
    constructor Create;

    function Load(Req: THorseRequest; Res: THorseResponse): String;
    procedure Insert(Req: THorseRequest; Res: THorseResponse);

    destructor Destroy; override;
  end;

implementation

uses
  System.SysUtils, System.Generics.Collections;

{ TServicePais }

constructor TServicePais.Create;
begin
  inherited;
  FDAO := TDAO<TPaisModel>.create(TConecaoDAO.ObterInstancia.Connectar);
  FPaisModel := TPaisModel.Create;
end;

destructor TServicePais.Destroy;
begin
  if Assigned(FDAO) then
    FreeAndNil(FDAO);
  if Assigned(FPaisModel) then
    FreeAndNil(FPaisModel);

  inherited;
end;

procedure TServicePais.Insert(Req: THorseRequest; Res: THorseResponse);
var
  lPais : TPaisModel;
begin
  lPais := TORMBrJson.JsonToObject<TPaisModel>(Req.Body);
  try
    Fdao.insert(lPais);
    Res.Send(TORMBrJson.ObjectToJsonString(lPais))
       .Status(201)
       .ContentType('application/json');

  finally
    lPais.Free;
  end;

end;

function TServicePais.Load(Req: THorseRequest; Res: THorseResponse): String;
var
  lPaisList: TObjectList<TPaisModel>;
begin

  lPaisList := FDAO.listAll;
  try
    Res.Send(TORMBrJson.ObjectListToJsonString<TPaisModel>(lPaisList))
       .ContentType('application/json');
  finally
    lPaisList.Free;
  end;

end;

end.
