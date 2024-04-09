unit UUtils.Ini;

interface
type
  TUtilsIni = class
  private
    constructor Create;
  public
    destructor Destroy; override;
    class function ObterInstancia: TUtilsIni;
    class function NewInstance: TObject; override;


  end;
var
  Instancia: TUtilsIni;

implementation

{ TUtils }

constructor TUtilsIni.Create;
begin

end;

destructor TUtilsIni.Destroy;
begin

  inherited;
end;

class function TUtilsIni.NewInstance: TObject;
begin

end;

class function TUtilsIni.ObterInstancia: TUtilsIni;
begin

end;

end.
