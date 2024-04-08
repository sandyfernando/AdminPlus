unit UService.Estado;

interface
uses
  UDAO, UModel.estado, UDAO.Conexao, Horse, System.SysUtils;
type
  TServiceEstado = class
    private
      FDAO : TDAO<TEstado>;
    public
      constructor Create;
      destructor Destroy;override;

      procedure Load(Req: THorseRequest; Res: THorseResponse);
      procedure Insert(Req: THorseRequest; Res: THorseResponse);
      procedure Find(Req: THorseRequest; Res: THorseResponse);
      procedure Update(Req: THorseRequest; Res: THorseResponse);
      procedure Delete(Req: THorseRequest; Res: THorseResponse);

  end;

implementation
uses
 ormbr.json, Horse.Commons, System.Generics.Collections;

{ TServiceEstado }

constructor TServiceEstado.Create;
begin
  FDAO := TDAO<TEstado>.create(TConecaoDAO.ObterInstancia.Connectar);
end;

procedure TServiceEstado.Delete(Req: THorseRequest; Res: THorseResponse);
var
  lId: String;
  lEstado: TEstado;
begin
  lId := Req.Params['id'];
  lEstado := FDAO.findWhere('id = ' + lId);
  try
    FDAO.delete(lEstado);
    Res.Status(THTTPStatus.NoContent);
  finally
    lEstado.Free;
  end;
end;

destructor TServiceEstado.Destroy;
begin
  if Assigned(FDAO) then
    FDAO.Free;
  inherited;
end;

procedure TServiceEstado.Find(Req: THorseRequest; Res: THorseResponse);
var
  lId: String;
  lEstado: TEstado;
begin
  lId := Req.Params['id'];

  lEstado := FDAO.findWhere('id = ' + lId);
  try
    Res.Send(TORMBrJson.ObjectToJsonString(lEstado))
      .ContentType('application/json');
  finally
    lEstado.Free;
  end;

end;

procedure TServiceEstado.Load(Req: THorseRequest; Res: THorseResponse);
var
  lListEstado: TObjectList<TEstado>;
begin
  lListEstado := FDAO.listAll;
  try
    Res.Send(TORMBrJson.ObjectListToJsonString<TEstado>(lListEstado))
      .ContentType('application/json');
  finally
    lListEstado.Free;
  end;
end;

procedure TServiceEstado.Update(Req: THorseRequest; Res: THorseResponse);
var
  lId: String;
  lEstado: TEstado;
begin
  lId := Req.Params['id'];
  lEstado := FDAO.findWhere('id = ' + lId);
  try
    FDAO.modify(lEstado);

    TORMBrJson.JsonToObject(req.Body, lEstado);

    FDAO.update(lEstado);

    Res.Send(TORMBrJson.ObjectToJsonString(lEstado))
      .ContentType('application/json');
  finally
    lEstado.Free;
  end;
end;

procedure TServiceEstado.Insert(Req: THorseRequest; Res: THorseResponse);
var
  lEstado: TEstado;
begin
  lEstado := TORMBrJson.JsonToObject<TEstado>(Req.Body);
  try
    FDAO.insert(lEstado);

    Res.Send(TORMBrJson.ObjectToJsonString(lEstado))
      .Status(THTTPStatus.Created)
      .ContentType('application/json');

  finally
    lEstado.Free
  end;
end;

end.
