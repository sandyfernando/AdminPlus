unit UService.Cidade;

interface
uses
  UDAO, UDAO.Conexao, UModel.Cidade, Horse;
type
  TServiceCidade = class
  private
    FDAO: TDAO<TCidade>;
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

{ TServiceCidade }

constructor TServiceCidade.Create;
begin
  FDAO := TDAO<Tcidade>.create(TConecaoDAO.ObterInstancia.Connectar);
end;

procedure TServiceCidade.Delete(Req: THorseRequest; Res: THorseResponse);
var
  lId: String;
  lCidade: TCidade;
begin
  lId := Req.Params['id'];
  lCidade := FDAO.findWhere('id = ' + lId);
  try
    FDAO.delete(lCidade);
    Res.Status(THTTPStatus.NoContent);
  finally
    FreeAndNil(lCidade)
  end;
end;

destructor TServiceCidade.Destroy;
begin
  if Assigned(FDAO) then
    FDAO.Free;
  inherited;
end;

procedure TServiceCidade.Find(Req: THorseRequest; Res: THorseResponse);
var
  lId: String;
  lCidade: TCidade;
begin
  lId := Req.Params['id'];
  lCidade := FDAO.findWhere('id = ' + lId);
  try
    Res.Send(TORMBrJson.ObjectToJsonString(lCidade))
      .ContentType('application/json');
  finally
    FreeAndNil(lCidade)
  end;

end;

procedure TServiceCidade.Insert(Req: THorseRequest; Res: THorseResponse);
var
  lCidade: TCidade;
begin
  lCidade := TORMBrJson.JsonToObject<TCidade>(Req.Body);
  try
    FDAO.insert(lCidade);

    Res.Send(TORMBrJson.ObjectToJsonString(lCidade))
      .ContentType('application/json');

  finally
    lCidade.Free;
  end;

end;

procedure TServiceCidade.Load(Req: THorseRequest; Res: THorseResponse);
var
  lListCidade: TObjectList<TCidade>;
begin
  lListCidade := FDAO.listAll;
  try
    Res.Send(TORMBrJson.ObjectListToJsonString<TCidade>(lListCidade))
      .ContentType('application/json');
  finally
    lListCidade.Free;
  end;
end;

procedure TServiceCidade.Update(Req: THorseRequest; Res: THorseResponse);
var
  lId: String;
  lCidade: TCidade;
begin
  lId := Req.Params['id'];
  lCidade := FDAO.findWhere('id = ' + lId);
  try
    FDAO.modify(lCidade);

    TORMBrJson.JsonToObject(Req.Body, lCidade);

    FDAO.update(lCidade);

    Res.Send(TORMBrJson.ObjectToJsonString(lCidade))
      .ContentType('application/json')
  finally
    FreeAndNil(lCidade)
  end;

end;

end.
