unit UService.Pais;

interface
uses
  UDAO, UDAO.Conexao,  Horse, UModel.Pais;
type
  TServicePais = class
  private
    FDAO: TDAO<TPais>;
  public
    constructor Create;

    function Load(Req: THorseRequest; Res: THorseResponse): String;
    procedure Insert(Req: THorseRequest; Res: THorseResponse);
    procedure Find(Req: THorseRequest; Res: THorseResponse; Next: TProc);
    procedure Update(Req: THorseRequest; Res: THorseResponse; Next: TProc);
    procedure Delete(Req: THorseRequest; Res: THorseResponse; Next: TProc);

    destructor Destroy; override;
  end;

implementation
uses
  System.SysUtils, System.Generics.Collections, Horse.Commons, ormbr.json;

{ TServicePais }

constructor TServicePais.Create;
begin
  inherited;
  FDAO := TDAO<TPais>.create(TConecaoDAO.ObterInstancia.Connectar);
end;

procedure TServicePais.Delete(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
var
  lPais: Tpais;
  lId: String;
begin
  lId := Req.Params['id'];
  lPais := FDAO.findWhere('id = ' + lId);
  try
    FDAO.delete(lPais);
    Res.Status(THTTPStatus.NoContent);
  finally
    lPais.Free;
  end;

end;

destructor TServicePais.Destroy;
begin
  if Assigned(FDAO) then
    FreeAndNil(FDAO);
  inherited;
end;

procedure TServicePais.Find(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
var
  lPais : TPais;
  id : String;
begin
  id := Req.Params['id'];
  lPais := Fdao.findWhere('id = ' + id);
  try
    Res.Send(TORMBrJson.ObjectToJsonString(lPais))
       .ContentType('application/json');
  finally
    lPais.Free;
  end;
end;

procedure TServicePais.Insert(Req: THorseRequest; Res: THorseResponse);
var
  lPais : TPais;
begin
  lPais := TORMBrJson.JsonToObject<TPais>(Req.Body);
  try
    Fdao.insert(lPais);
    Res.Send(TORMBrJson.ObjectToJsonString(lPais))
       .Status(THTTPStatus.Created)
       .ContentType('application/json');
  finally
    lPais.Free;
  end;
end;

function TServicePais.Load(Req: THorseRequest; Res: THorseResponse): String;
var
  lPaisList: TObjectList<TPais>;
begin
  lPaisList := FDAO.listAll;
  try
    Res.Send(TORMBrJson.ObjectListToJsonString<TPais>(lPaisList))
       .ContentType('application/json');
  finally
    lPaisList.Free;
  end;

end;

procedure TServicePais.Update(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
var
  lPais: Tpais;
  lId: String;
begin
  lId := Req.Params['id'];
  lPais := FDAO.findWhere('id = ' + lId);
  try
    FDAO.modify(lPais);

    TORMBrJson.JsonToObject(Req.Body, lPais);

    FDAO.update(lPais);

    Res.Send(TORMBrJson.ObjectToJsonString(lPais))
           .ContentType('application/json');
  finally
    lPais.Free;
  end;

end;

end.
