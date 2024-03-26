unit UControler.Pais;

interface

uses
  Horse,
  System.JSON,
  System.SysUtils,
  UService.Pais,
  Horse.Commons;
  procedure Registry;

implementation
procedure Get(Req: THorseRequest; Res: THorseResponse);
var
  lPaisService: TServicePais;
begin
  try
    try
      lPaisService := TServicePais.Create;
      Res.Send(lPaisService.Load(Req));
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

procedure Post(Req: THorseRequest; Res: THorseResponse);
begin
  Res.Send('post pais');
end;

procedure Put(Req: THorseRequest; Res: THorseResponse);
begin
  Res.Send('put pais');
end;

procedure Delete(Req: THorseRequest; Res: THorseResponse);
begin
  Res.Send('delete pais');
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
