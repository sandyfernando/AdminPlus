unit UController.Estado;

interface
uses
  Horse,
  Horse.Jhonson,
  System.JSON,
  UService.Estado,
  Horse.Commons;
  procedure Registry;


implementation

uses
  System.SysUtils;

procedure Get(Req: THorseRequest; Res: THorseResponse; NEXT: TProc);
var
  lServiceEstado: TServiceEstado;
begin
  lServiceEstado := TServiceEstado.Create;
  try
    try
      lServiceEstado.Load(Req, Res);
    except
      on E: Exception do
      begin
        Res.Send(e.Message).Status(THTTPStatus.InternalServerError);
      end;
    end;
  finally
    lServiceEstado.Free;
  end;
end;

procedure Find(Req: THorseRequest; Res: THorseResponse; NEXT: TProc);
var
  lServiceEstado: TServiceEstado;
begin
  lServiceEstado := TServiceEstado.Create;
  try
    try
      lServiceEstado.Find(Req, Res);
    except
      on E: Exception do
      begin
        Res.Send(e.Message).Status(THTTPStatus.InternalServerError);
      end;
    end;
  finally
    lServiceEstado.Free;
  end;
end;

procedure Post(Req: THorseRequest; Res: THorseResponse; NEXT: TProc);
var
  lServiceEstado: TServiceEstado;
begin
  lServiceEstado := TServiceEstado.Create;
  try
    try
      lServiceEstado.Insert(Req, Res);
    except
      on e: Exception do
      begin
        Res.Send(e.Message).Status(THTTPStatus.InternalServerError);
      end;

    end;
  finally
    lServiceEstado.Free;
  end;
end;

procedure Put(Req: THorseRequest; Res: THorseResponse; NEXT: TProc);
var
  lServiceEstado: TServiceEstado;
begin
  lServiceEstado := TServiceEstado.Create;
  try
    try
      lServiceEstado.Update(Req, Res);
    except
      on E: Exception do
      begin
        Res.Send(e.Message).Status(THTTPStatus.InternalServerError);
      end;
    end;
  finally
    lServiceEstado.Free;
  end;
end;

procedure Delete(Req: THorseRequest; Res: THorseResponse; NEXT: TProc);
var
  lServiceEstado: TServiceEstado;
begin
  lServiceEstado := TServiceEstado.Create;
  try
    try
      lServiceEstado.Delete(Req, Res);
    except
      on E: Exception do
      begin
        Res.Send(E.Message).Status(THTTPStatus.InternalServerError);
      end;
    end;
  finally
    lServiceEstado.Free;
  end;
end;
procedure Registry;
begin
  THorse.Get('estados', Get);
  THorse.Get('estados/:id', Find);
  THorse.Post('estados', Post);
  THorse.Put('estados/:id', Put);
  THorse.Delete('estados/:id', Delete)
end;

end.
