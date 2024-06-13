unit UService.Pessoa;

interface
uses
  UDAO, UDAO.Conexao, UModel.Pessoa, Horse;
type
  TServicePessoa = class
  private
    FDAO: TDAO<TPessoa>;
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

{ TServicePessoa }

constructor TServicePessoa.Create;
begin
  FDAO := TDAO<TPessoa>.create(TConecaoDAO.ObterInstancia.Connectar);
end;

procedure TServicePessoa.Delete(Req: THorseRequest; Res: THorseResponse);
var
  lId: String;
  lPessoa: TPessoa;
begin
  lId := Req.Params['id'];
  lPessoa := FDAO.findWhere('id = ' + lId);
  try
    FDAO.delete(lPessoa);
    Res.Status(THTTPStatus.NoContent);
  finally
    FreeAndNil(lPessoa)
  end;
end;

destructor TServicePessoa.Destroy;
begin
  if Assigned(FDAO) then
    FDAO.Free;
  inherited;
end;

procedure TServicePessoa.Find(Req: THorseRequest; Res: THorseResponse);
var
  lId: String;
  lPessoa: TPessoa;
begin
  lId := Req.Params['id'];
  lPessoa := FDAO.findWhere('id = ' + lId);
  try
    Res.Send(TORMBrJson.ObjectToJsonString(lPessoa))
      .ContentType('application/json');
  finally
    FreeAndNil(lPessoa)
  end;

end;

procedure TServicePessoa.Insert(Req: THorseRequest; Res: THorseResponse);
var
  lPessoa: TPessoa;
begin
  lPessoa := TORMBrJson.JsonToObject<TPessoa>(Req.Body);
  try
    FDAO.insert(lPessoa);

    Res.Send(TORMBrJson.ObjectToJsonString(lPessoa))
      .ContentType('application/json');

  finally
    lPessoa.Free;
  end;

end;

procedure TServicePessoa.Load(Req: THorseRequest; Res: THorseResponse);
var
  lListPessoa: TObjectList<TPessoa>;
begin
  lListPessoa := FDAO.listAll;
  try
    Res.Send(TORMBrJson.ObjectListToJsonString<TPessoa>(lListPessoa))
      .ContentType('application/json');
  finally
    lListPessoa.Free;
  end;
end;

procedure TServicePessoa.Update(Req: THorseRequest; Res: THorseResponse);
var
  lId: String;
  lPessoa: TPessoa;
begin
  lId := Req.Params['id'];
  lPessoa := FDAO.findWhere('id = ' + lId);
  try
    FDAO.modify(lPessoa);

    TORMBrJson.JsonToObject(Req.Body, lPessoa);

    FDAO.update(lPessoa);

    Res.Send(TORMBrJson.ObjectToJsonString(lPessoa))
      .ContentType('application/json')
  finally
    FreeAndNil(lPessoa)
  end;

end;

end.
