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
begin
  Res.Send('get find estado');
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

procedure Registry;
begin
  THorse.Use(Jhonson);
  THorse.Get('estados', Get);
  THorse.Get('estados\:id', Find);
  THorse.Post('estados', Post);
end;
end.
