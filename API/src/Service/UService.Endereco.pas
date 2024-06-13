unit UService.Endereco;

interface
uses
  UDAO, UDAO.Conexao, UModel.Endereco, Horse;
type
  TServiceEndereco = class
  private
    FDAO: TDAO<TEndereco>;
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

{ TServiceEndereco }

constructor TServiceEndereco.Create;
begin
  FDAO := TDAO<TEndereco>.create(TConecaoDAO.ObterInstancia.Connectar);
end;

procedure TServiceEndereco.Delete(Req: THorseRequest; Res: THorseResponse);
var
  lId: String;
  lEndereco: TEndereco;
begin
  lId := Req.Params['id'];
  lEndereco := FDAO.findWhere('id = ' + lId);
  try
    FDAO.delete(lEndereco);
    Res.Status(THTTPStatus.NoContent);
  finally
    FreeAndNil(lEndereco)
  end;
end;

destructor TServiceEndereco.Destroy;
begin
  if Assigned(FDAO) then
    FDAO.Free;
  inherited;
end;

procedure TServiceEndereco.Find(Req: THorseRequest; Res: THorseResponse);
var
  lId: String;
  lEndereco: TEndereco;
begin
  lId := Req.Params['id'];
  lEndereco := FDAO.findWhere('id = ' + lId);
  try
    Res.Send(TORMBrJson.ObjectToJsonString(lEndereco))
      .ContentType('application/json');
  finally
    FreeAndNil(lEndereco)
  end;

end;

procedure TServiceEndereco.Insert(Req: THorseRequest; Res: THorseResponse);
var
  lEndereco: TEndereco;
begin
  lEndereco := TORMBrJson.JsonToObject<TEndereco>(Req.Body);
  try
    FDAO.insert(lEndereco);

    Res.Send(TORMBrJson.ObjectToJsonString(lEndereco))
      .ContentType('application/json');

  finally
    lEndereco.Free;
  end;

end;

procedure TServiceEndereco.Load(Req: THorseRequest; Res: THorseResponse);
var
  lListEndereco: TObjectList<TEndereco>;
begin
  lListEndereco := FDAO.listAll;
  try
    Res.Send(TORMBrJson.ObjectListToJsonString<TEndereco>(lListEndereco))
      .ContentType('application/json');
  finally
    lListEndereco.Free;
  end;
end;

procedure TServiceEndereco.Update(Req: THorseRequest; Res: THorseResponse);
var
  lId: String;
  lEndereco: TEndereco;
begin
  lId := Req.Params['id'];
  lEndereco := FDAO.findWhere('id = ' + lId);
  try
    FDAO.modify(lEndereco);

    TORMBrJson.JsonToObject(Req.Body, lEndereco);

    FDAO.update(lEndereco);

    Res.Send(TORMBrJson.ObjectToJsonString(lEndereco))
      .ContentType('application/json')
  finally
    FreeAndNil(lEndereco)
  end;

end;

end.
