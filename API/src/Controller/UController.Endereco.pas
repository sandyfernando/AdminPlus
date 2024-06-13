unit UController.Endereco;

interface
uses
  Horse;
  procedure Registry;

implementation

uses
  System.SysUtils,
  Uservice.Endereco,
  Horse.Commons;

procedure Get(Req: THorseRequest; Res: THorseResponse; NEXT: TProc);
var
  lServiceEndereco: TServiceEndereco;
begin
  lServiceEndereco := TServiceEndereco.Create;
  try
    try
      lServiceEndereco.Load(Req, Res);
    except
      on E: Exception do
      begin
        Res.Send(e.Message).Status(THTTPStatus.InternalServerError)
      end;
    end;

  finally
    FreeAndNil(lServiceEndereco);
  end;
end;

procedure Find(Req: THorseRequest; Res: THorseResponse; NEXT: TProc);
var
  lServiceEndereco: TServiceEndereco;
begin
  lServiceEndereco := TServiceEndereco.Create;
  try
    try
      lServiceEndereco.Find(Req, Res);
    except
      on E: Exception do
      begin
        Res.Send(e.Message).Status(THTTPStatus.InternalServerError)
      end;
    end;

  finally
    FreeAndNil(lServiceEndereco);
  end;
end;

procedure Post(Req: THorseRequest; Res: THorseResponse; NEXT: TProc);
var
  lServiceEndereco: TServiceEndereco;
begin
  lServiceEndereco := TServiceEndereco.Create;
  try
    try
      lServiceEndereco.Insert(Req, Res);
    except
      on E: Exception do
      begin
        Res.Send(e.Message).Status(THTTPStatus.InternalServerError)
      end;
    end;

  finally
    FreeAndNil(lServiceEndereco);
  end;
end;

procedure Put(Req: THorseRequest; Res: THorseResponse; NEXT: TProc);
var
  lServiceEndereco: TServiceEndereco;
begin
  lServiceEndereco := TServiceEndereco.Create;
  try
    try
      lServiceEndereco.Update(Req, Res);
    except
      on E: Exception do
      begin
        Res.Send(e.Message).Status(THTTPStatus.InternalServerError)
      end;
    end;

  finally
    FreeAndNil(lServiceEndereco);
  end;
end;

procedure Delete(Req: THorseRequest; Res: THorseResponse; NEXT: TProc);
var
  lServiceEndereco: TServiceEndereco;
begin
  lServiceEndereco := TServiceEndereco.Create;
  try
    try
      lServiceEndereco.Delete(Req, Res);
    except
      on E: Exception do
      begin
        Res.Send(e.Message).Status(THTTPStatus.InternalServerError)
      end;
    end;

  finally
    FreeAndNil(lServiceEndereco);
  end;
end;

procedure Registry;
begin
  THorse.Get('enderecos', Get);
  THorse.Get('enderecos/:id', Find);
  THorse.Post('enderecos', Post);
  THorse.Put('enderecos/:id', Put);
  THorse.Delete('enderecos/:id', Delete);
end;

end.
