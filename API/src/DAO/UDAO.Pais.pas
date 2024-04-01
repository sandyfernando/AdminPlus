unit UDAO.Pais;

interface
uses
  UModel.Pais, UDAO;
type
  TDAOPais = class(TDAO)
    private

    public
      constructor Create;
      destructor Destroy; override;

      function Save(aPais: TPaisModel; aTransacao: Boolean = True): Integer;
      function Select(aPais: TPaisModel): Boolean;
      function Update(aPais: TPaisModel; aTransacao: Boolean = True): Integer;
      function Delete(aPais: TPaisModel; aTransacao: Boolean = True): Integer;

  end;
implementation

uses
  dbcbr.mapping.register;

{ TPaisDAO }

constructor TDAOPais.Create;
begin
  inherited;
end;

function TDAOPais.Delete(aPais: TPaisModel; aTransacao: Boolean): Integer;
begin

end;

destructor TDAOPais.Destroy;
begin
  inherited;
end;

function TDAOPais.Save(aPais: TPaisModel; aTransacao: Boolean): Integer;
begin

end;

function TDAOPais.Select(aPais: TPaisModel): Boolean;
begin

end;

function TDAOPais.Update(aPais: TPaisModel; aTransacao: Boolean): Integer;
begin

end;

end.
