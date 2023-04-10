unit UPessoa;

interface
uses UEndereco, System.classes, UEntidade;
  type
    TPessoa = class(TEntidade)
    private
      FCnae                : String;
      FIdContato           : Integer;
      FDescricao           : String;
      FInscEstadual        : String;
      FCpfCnpj             : String;
      FInscmunc            : String;
      FIdpessoa            : Integer;
      FNomeFantazia        : String;
      FTipo                : Integer;
      FIdEnderecoPrincipal : TEndereco;

      procedure SetCnae              (const Value: String);
      procedure SetCpfCnpj           (const Value: String);
      procedure SetDescricao         (const Value: String);
      procedure SetIdContato         (const Value: Integer);
      procedure SetIdpessoa          (const Value: Integer);
      procedure SetInscEstadual      (const Value: String);
      procedure SetInscmunc          (const Value: String);
      procedure SetNomeFantazia      (const Value: String);
      procedure SetTipo              (const Value: Integer);
      procedure SetIdEnderecoPrincipal (const Value: TEndereco);

    public
      property Idpessoa             : Integer   read FIdpessoa            write SetIdpessoa;
      property Descricao            : String    read FDescricao           write SetDescricao;
      property Tipo                 : Integer   read FTipo                write SetTipo;
      property CpfCnpj              : String    read FCpfCnpj             write SetCpfCnpj;
      property NomeFantazia         : String    read FNomeFantazia        write SetNomeFantazia;
      property InscEstadual         : String    read FInscEstadual        write SetInscEstadual;
      property Inscmunc             : String    read FInscmunc            write SetInscmunc;
      property Cnae                 : String    read FCnae                write SetCnae;
      property IdEnderecoPrincipal  : TEndereco read FIdEnderecoPrincipal write SetIdEnderecoPrincipal;
      property IdContato            : Integer   read FIdContato           write SetIdContato;

      constructor Crete  ;
      destructor  Destroy;
    end;

implementation
uses
  System.SysUtils, System.TypInfo, System.Rtti;

{ TPessoa }

constructor TPessoa.Crete;
begin
  inherited;
  FIdEnderecoPrincipal := TEndereco.Create;

end;

destructor TPessoa.Destroy;
begin
   FreeAndNil(FIdEnderecoPrincipal);
end;

procedure TPessoa.SetCnae(const Value: String);
begin
  FCnae := Value;
end;

procedure TPessoa.SetCpfCnpj(const Value: String);
begin
  FCpfCnpj := Value;
end;

procedure TPessoa.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TPessoa.SetIdContato(const Value: Integer);
begin
  FIdContato := Value;
end;


procedure TPessoa.SetIdEnderecoPrincipal(const Value: TEndereco);
begin
  FIdEnderecoPrincipal := Value;
end;

procedure TPessoa.SetIdpessoa(const Value: Integer);
begin
  FIdpessoa := Value;
end;

procedure TPessoa.SetInscEstadual(const Value: String);
begin
  FInscEstadual := Value;
end;

procedure TPessoa.SetInscmunc(const Value: String);
begin
  FInscmunc := Value;
end;

procedure TPessoa.SetNomeFantazia(const Value: String);
begin
  FNomeFantazia := Value;
end;

procedure TPessoa.SetTipo(const Value: Integer);
begin
  FTipo := Value;
end;

end.
