unit UEndereco;

interface
uses
  System.Classes, UCidade, UEntidade;
  type
    TEndereco = Class(TEntidade)
      private
        FLogradouro  : String;
        FBairro      : String;
        FIdEndereco  : Integer;
        FNumero      : String;
        FComplemento : String;
    FIdCidade: TCidade;

        procedure SetBairro     (const Value: String);
        procedure SetComplemento(const Value: String);
        procedure SetIdEndereco (const Value: Integer);
        procedure SetLogradouro (const Value: String);
        procedure SetNumero     (const Value: String);
    procedure SetIdCidade(const Value: TCidade);

    public
        property IdEndereco  : Integer read FIdEndereco  write SetIdEndereco;
        property Logradouro  : String  read FLogradouro  write SetLogradouro;
        property Numero      : String  read FNumero      write SetNumero;
        property Bairro      : String  read FBairro      write SetBairro;
        property Complemento : String  read FComplemento write SetComplemento;
        property IdCidade    : TCidade read FIdCidade write SetIdCidade;

        constructor Create ;
        destructor  Destroy ;

    End;

implementation
uses
  System.SysUtils;

{ TEndereco }

constructor TEndereco.Create;
begin
  FIdCidade := TCidade.Create;
end;

destructor TEndereco.Destroy;
begin
  FreeAndNil(FIdCidade);
end;

procedure TEndereco.SetBairro(const Value: String);
begin
  FBairro := Value;
end;

procedure TEndereco.SetComplemento(const Value: String);
begin
  FComplemento := Value;
end;


procedure TEndereco.SetIdCidade(const Value: TCidade);
begin
  FIdCidade := Value;
end;

procedure TEndereco.SetIdEndereco(const Value: Integer);
begin
  FIdEndereco := Value;
end;

procedure TEndereco.SetLogradouro(const Value: String);
begin
  FLogradouro := Value;
end;

procedure TEndereco.SetNumero(const Value: String);
begin
  FNumero := Value;
end;

end.
