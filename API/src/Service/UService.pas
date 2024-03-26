unit UService;

interface
type
  TService = class
  private

  public
    constructor Create;
    destructor Destroy;override;
  end;

implementation

{ TService }

constructor TService.Create;
begin

end;

destructor TService.Destroy;
begin

  inherited;
end;

end.
