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

  end;

implementation
uses
 ormbr.json, Horse.Commons, System.Generics.Collections;

{ TServiceEstado }

constructor TServiceEstado.Create;
begin
  FDAO := TDAO<TEstado>.create(TConecaoDAO.ObterInstancia.Connectar);
end;

destructor TServiceEstado.Destroy;
begin
  if Assigned(FDAO) then
    FDAO.Free;
  inherited;
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
