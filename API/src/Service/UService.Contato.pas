unit UService.Contato;

interface
uses
  UDAO, UDAO.Conexao, UModel.Contato, Horse;
type
  TServiceContato = class
  private
    FDAO: TDAO<TContato>;
  public
    constructor Create;

    procedure Load(Req: THorseRequest; Res: THorseResponse);
    procedure Insert(Req: THorseRequest; Res: THorseResponse);
    procedure Find(Req: THorseRequest; Res: THorseResponse);
    procedure Update(Req: THorseRequest; Res: THorseResponse);
    procedure Delete(Req: THorseRequest; Res: THorseResponse);

    destructor Destroy;override;
  end;

implementation

uses
  System.Generics.Collections,
  ormbr.json, System.SysUtils;

{ TServiceContato }

constructor TServiceContato.Create;
begin
  FDAO := TDAO<TContato>.create(TConecaoDAO.ObterInstancia.Connectar);
end;

procedure TServiceContato.Delete(Req: THorseRequest; Res: THorseResponse);
var
  lId: String;
  lContato: TContato;
begin
  lId := Req.Params['id'];
  lContato := FDAO.findWhere('id = ' + lId);
  try
    FDAO.delete(lContato);
    Res.Status(THTTPStatus.NoContent);
  finally
    FreeAndNil(lContato)
  end;
end;

destructor TServiceContato.Destroy;
begin
  if Assigned(FDAO) then
    FDAO.Free;
  inherited;
end;

procedure TServiceContato.Find(Req: THorseRequest; Res: THorseResponse);
var
  lId: String;
  lContato: TContato;
begin
  lId := Req.Params['id'];
  lContato := FDAO.findWhere('id = ' + lId);
  try
    Res.Send(TORMBrJson.ObjectToJsonString(lContato))
      .ContentType('application/json');
  finally
    FreeAndNil(lContato)
  end;

end;

procedure TServiceContato.Insert(Req: THorseRequest; Res: THorseResponse);
var
  lContato: TContato;
begin
  lContato := TORMBrJson.JsonToObject<TContato>(Req.Body);
  try
    FDAO.insert(lContato);

    Res.Send(TORMBrJson.ObjectToJsonString(lContato))
      .ContentType('application/json');

  finally
    lContato.Free;
  end;

end;

procedure TServiceContato.Load(Req: THorseRequest; Res: THorseResponse);
var
  lListContato: TObjectList<TContato>;
begin
  lListContato := FDAO.listAll;
  try
    Res.Send(TORMBrJson.ObjectListToJsonString<TContato>(lListContato))
      .ContentType('application/json');
  finally
    lListContato.Free;
  end;
end;

procedure TServiceContato.Update(Req: THorseRequest; Res: THorseResponse);
var
  lId: String;
  lContato: TContato;
begin
  lId := Req.Params['id'];
  lContato := FDAO.findWhere('id = ' + lId);
  try
    FDAO.modify(lContato);

    TORMBrJson.JsonToObject(Req.Body, lContato);

    FDAO.update(lContato);

    Res.Send(TORMBrJson.ObjectToJsonString(lContato))
      .ContentType('application/json')
  finally
    FreeAndNil(lContato)
  end;

end;

end.
