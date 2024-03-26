unit UControler.Ping;

interface
uses
  Horse;

  procedure Registry;

implementation
procedure Registry;
begin
  THorse.Get('/ping',
    procedure(Req: THorseRequest; Res: THorseResponse)
    begin
      Res.Send('pong');
    end);
end;

end.
