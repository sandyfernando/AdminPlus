unit UController.Cidade;

interface
uses
  Horse;
  procedure Registry;

implementation

uses
  System.SysUtils,
  Uservice.Cidade,
  Horse.Commons;

procedure Get(Req: THorseRequest; Res: THorseResponse; NEXT: TProc);
var
  lServiceCidade: TServiceCidade;
begin
  lServiceCidade := TServiceCidade.Create;
  try
    try
      lServiceCidade.Load(Req, Res);
    except
      on E: Exception do
      begin
        Res.Send(e.Message).Status(THTTPStatus.InternalServerError)
      end;
    end;

  finally
    FreeAndNil(lServiceCidade);
  end;
end;

procedure Find(Req: THorseRequest; Res: THorseResponse; NEXT: TProc);
var
  lServiceCidade: TServiceCidade;
begin
  lServiceCidade := TServiceCidade.Create;
  try
    try
      lServiceCidade.Find(Req, Res);
    except
      on E: Exception do
      begin
        Res.Send(e.Message).Status(THTTPStatus.InternalServerError)
      end;
    end;

  finally
    FreeAndNil(lServiceCidade);
  end;
end;

procedure Post(Req: THorseRequest; Res: THorseResponse; NEXT: TProc);
var
  lServiceCidade: TServiceCidade;
begin
  lServiceCidade := TServiceCidade.Create;
  try
    try
      lServiceCidade.Insert(Req, Res);
    except
      on E: Exception do
      begin
        Res.Send(e.Message).Status(THTTPStatus.InternalServerError)
      end;
    end;

  finally
    FreeAndNil(lServiceCidade);
  end;
end;

procedure Put(Req: THorseRequest; Res: THorseResponse; NEXT: TProc);
var
  lServiceCidade: TServiceCidade;
begin
  lServiceCidade := TServiceCidade.Create;
  try
    try
      lServiceCidade.Update(Req, Res);
    except
      on E: Exception do
      begin
        Res.Send(e.Message).Status(THTTPStatus.InternalServerError)
      end;
    end;

  finally
    FreeAndNil(lServiceCidade);
  end;
end;

procedure Delete(Req: THorseRequest; Res: THorseResponse; NEXT: TProc);
var
  lServiceCidade: TServiceCidade;
begin
  lServiceCidade := TServiceCidade.Create;
  try
    try
      lServiceCidade.Delete(Req, Res);
    except
      on E: Exception do
      begin
        Res.Send(e.Message).Status(THTTPStatus.InternalServerError)
      end;
    end;

  finally
    FreeAndNil(lServiceCidade);
  end;
end;

procedure Registry;
begin
  THorse.Get('cidades', Get);
  THorse.Get('cidades/:id', Find);
  THorse.Post('cidades', Post);
  THorse.Put('cidades/:id', Put);
  THorse.Delete('cidades/:id', Delete);
end;

end.
