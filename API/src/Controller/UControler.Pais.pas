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
begin
  Res.Send('put pais');
end;

procedure Delete(Req: THorseRequest; Res: THorseResponse; NEXT: TProc);
begin
  Res.Send('delete pais').Status(THTTPStatus.NoContent);
end;

procedure Registry;
begin
  THorse.Use(Jhonson);
  THorse.Get('/pais',Get);
  THorse.Post('/pais', Post);
  THorse.Put('/pais', Put);
  THorse.Delete('/pais', Delete);

end;
end.
