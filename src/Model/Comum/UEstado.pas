unit UEstado;

interface
uses
  System.Classes, UEntidade;
  type
    TEstado = class(TEntidade)
      private
        FDescricao: String;
        FIdEstado: Integer;
        FPais: Integer;
        procedure SetDescricao(const Value: String);
        procedure SetIdEstado(const Value: Integer);
        procedure SetPais(const Value: Integer);

      public
        property IdEstado  : Integer read FIdEstado write SetIdEstado;
        property Descricao : String read FDescricao write SetDescricao;
        property Pais      : Integer read FPais write SetPais;
    end;

implementation

{ TEstado }

procedure TEstado.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TEstado.SetIdEstado(const Value: Integer);
begin
  FIdEstado := Value;
end;

procedure TEstado.SetPais(const Value: Integer);
begin
  FPais := Value;
end;

end.
