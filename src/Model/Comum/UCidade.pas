unit UCidade;

interface
uses
  System.Classes, UEstado, UEntidade;
  type
    TCidade = class(TEntidade)
      private
    FDescricao: String;
    FIdCidade: Integer;
    FIdestado: TEstado;
    FCodigoIBGE: String;
    procedure SetCodigoIBGE(const Value: String);
    procedure SetDescricao(const Value: String);
    procedure SetIdCidade(const Value: Integer);
    procedure SetIdestado(const Value: TEstado);


      public
         constructor Create;
         Destructor  Destroy;
         property IdCidade   : Integer read FIdCidade write SetIdCidade;
         property Descricao  : String read FDescricao write SetDescricao;
         property CodigoIBGE : String read FCodigoIBGE write SetCodigoIBGE;
         property Idestado   : TEstado read FIdestado write SetIdestado;
    end;

implementation
uses
  System.SysUtils;

{ TCidade }

constructor TCidade.Create;
begin
  FIdestado := TEstado.Create;
end;

destructor TCidade.Destroy;
begin
  FreeAndNil(FIdestado);
end;

procedure TCidade.SetCodigoIBGE(const Value: String);
begin
  FCodigoIBGE := Value;
end;

procedure TCidade.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TCidade.SetIdCidade(const Value: Integer);
begin
  FIdCidade := Value;
end;

procedure TCidade.SetIdestado(const Value: TEstado);
begin
  FIdestado := Value;
end;

end.
