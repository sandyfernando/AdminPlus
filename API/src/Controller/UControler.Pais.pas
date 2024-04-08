unit UControler.Pais;

interface

uses
  Horse,
  Horse.Jhonson,
  System.JSON,
  System.SysUtils,
  UService.Pais,
  Horse.Commons;
  procedure Registry;

implementation
procedure Get(Req: THorseRequest; Res: THorseResponse; NEXT: TProc);
var
  lPaisService: TServicePais;
begin
  try
    try
      lPaisService := TServicePais.Create;
      lPaisService.Load(Req, Res);
    except
      on E: Exception do
      begin
        Res.Send(e.Message).Status(THTTPStatus.InternalServerError)
      end;
    end;
  finally
    if Assigned(lPaisService) then
      FreeAndNil(lPaisService);
  end;
end;
procedure Find(Req: THorseRequest; Res: THorseResponse; NEXT: TProc);
var
  lPaisService: TServicePais;
begin
  try
    try
      lPaisService := TServicePais.Create;
      lPaisService.Find(Req, Res, NEXT);
    except
      on E: Exception do
      begin
        Res.Send(e.Message).Status(THTTPStatus.InternalServerError)
      end;
    end;
  finally
    if Assigned(lPaisService) then
      FreeAndNil(lPaisService);
  end;
end;

procedure Post(Req: THorseRequest; Res: THorseResponse; NEXT: TProc);
var
  lPaisService: TServicePais;
begin
  try
    try
      lPaisService := TServicePais.Create;
      lPaisService.Insert(Req, Res);
    except
      on E: Exception do
      begin
        Res.Send(e.Message).Status(THTTPStatus.InternalServerError)
      end;
    end;
  finally
    if Assigned(lPaisService) then
      FreeAndNil(lPaisService);
  end;
end;

procedure Put(Req: THorseRequest; Res: THorseResponse; NEXT: TProc);
var
  lServicesPais: TServicePais;
begin
  lServicesPais := TServicePais.Create;
  try
    try
      lServicesPais.Update(Req, Res, NEXT);
    except
      on E: Exception do
      begin
        Res.Send(e.Message).Status(THTTPStatus.InternalServerError)
      end;
    end;
  finally
    lServicesPais.Free;
  end;
end;

procedure Delete(Req: THorseRequest; Res: THorseResponse; NEXT: TProc);
var
  lServicePais: TServicePais;
begin
  lServicePais := TServicePais.Create;
  try
    try
      lServicePais.Delete(Req, Res, NEXT);
    except
      on E: Exception do
      begin
        Res.Send(e.Message).Status(THTTPStatus.InternalServerError)
      end;
    end;
  finally
    lServicePais.Free;
  end;
end;

procedure Registry;
begin
  THorse.Use(Jhonson);
  THorse.Get('pais',Get);
  THorse.Get('pais/:id',Find);
  THorse.Post('pais/:id', Post);
  THorse.Put('pais/:id', Put);
  THorse.Delete('pais/:id', Delete);

end;
end.
