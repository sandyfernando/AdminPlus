unit UController.Pessoa;

interface
uses
  Horse;
  procedure Registry;

implementation

uses
  System.SysUtils,
  UService.Pessoa,
  Horse.Commons;

procedure Get(Req: THorseRequest; Res: THorseResponse; NEXT: TProc);
var
  lServicePessoa: TServicePessoa;
begin
  lServicePessoa := TServicePessoa.Create;
  try
    try
      lServicePessoa.Load(Req, Res);
    except
      on E: Exception do
      begin
        Res.Send(e.Message).Status(THTTPStatus.InternalServerError)
      end;
    end;

  finally
    FreeAndNil(lServicePessoa);
  end;
end;

procedure Find(Req: THorseRequest; Res: THorseResponse; NEXT: TProc);
var
  lServicePessoa: TServicePessoa;
begin
  lServicePessoa := TServicePessoa.Create;
  try
    try
      lServicePessoa.Find(Req, Res);
    except
      on E: Exception do
      begin
        Res.Send(e.Message).Status(THTTPStatus.InternalServerError)
      end;
    end;

  finally
    FreeAndNil(lServicePessoa);
  end;
end;

procedure Post(Req: THorseRequest; Res: THorseResponse; NEXT: TProc);
var
  lServicePessoa: TServicePessoa;
begin
  lServicePessoa := TServicePessoa.Create;
  try
    try
      lServicePessoa.Insert(Req, Res);
    except
      on E: Exception do
      begin
        Res.Send(e.Message).Status(THTTPStatus.InternalServerError)
      end;
    end;

  finally
    FreeAndNil(lServicePessoa);
  end;
end;

procedure Put(Req: THorseRequest; Res: THorseResponse; NEXT: TProc);
var
  lServicePessoa: TServicePessoa;
begin
  lServicePessoa := TServicePessoa.Create;
  try
    try
      lServicePessoa.Update(Req, Res);
    except
      on E: Exception do
      begin
        Res.Send(e.Message).Status(THTTPStatus.InternalServerError)
      end;
    end;

  finally
    FreeAndNil(lServicePessoa);
  end;
end;

procedure Delete(Req: THorseRequest; Res: THorseResponse; NEXT: TProc);
var
  lServicePessoa: TServicePessoa;
begin
  lServicePessoa := TServicePessoa.Create;
  try
    try
      lServicePessoa.Delete(Req, Res);
    except
      on E: Exception do
      begin
        Res.Send(e.Message).Status(THTTPStatus.InternalServerError)
      end;
    end;

  finally
    FreeAndNil(lServicePessoa);
  end;
end;

procedure Registry;
begin
  THorse.Get('pessoas', Get);
  THorse.Get('pessoas/:id', Find);
  THorse.Post('pessoas', Post);
  THorse.Put('pessoas/:id', Put);
  THorse.Delete('pessoas/:id', Delete);
end;

end.
