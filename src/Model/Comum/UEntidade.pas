unit UEntidade;

interface

uses
  System.Classes, Data.DB, System.Rtti, FireDAC.Comp.Client;

type
  TNaoPermiteLimpar = class(TCustomAttribute)
  end;

type
  TCampoTipoBlob = class(TCustomAttribute)
  end;

type
  TLimitarValorMaximo = class(TCustomAttribute)
  public
    FNomeDominio : String;
    constructor Create(NomeDominio : String); overload;

  end;

type
  TEntidade = class (TInterfacedPersistent)
  protected
    function VerificarPropriedadeEditavel(Propriedade : TRttiProperty) : Boolean;
    procedure definirPadroes; virtual;
  private
    FNome               : String;
    FSeq_Count          : Integer;
    FSufixoClasseAdpter : String;
    FCdEmpresa_Fisica   : Integer;
    FNomeTabela         : String;
    FNomePesquisa       : String;
    FPinturaGridPesquisa : Integer;
    FFiltroAtivos       : Boolean;
    FConnection         : TFDConnection;
    FThread             : Boolean;

    function GetNomeTabela: String;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    procedure Carregar(DataSet : TDataSet); overload;
    procedure Carregar(Dto : TEntidade); overload;
    procedure Limpar; virtual;

    [TNaoPermiteLimpar]
    property SufixoClasseAdapter : String        read FSufixoClasseAdpter write FSufixoClasseAdpter;
    [TNaoPermiteLimpar]
    property Nome                : string        read FNome               write FNome;
    [TNaoPermiteLimpar]
    property NomeTabela          : String        read GetNomeTabela       write FNomeTabela;
    [TNaoPermiteLimpar]
    property NomePesquisa        : String        read FNomePesquisa       write FNomePesquisa;
    [TNaoPermiteLimpar]
    property PinturaGridPesquisa : Integer read FPinturaGridPesquisa write FPinturaGridPesquisa;

    property Seq_Count           : Integer       read FSeq_Count          write FSeq_Count;
    property CdEmpresa_Fisica    : Integer       read FCdEmpresa_Fisica   write FCdEmpresa_Fisica;
    property FiltroAtivos        : Boolean       read FFiltroAtivos       write FFiltroAtivos;

    property Connection          : TFDConnection read FConnection         write FConnection;
    property Thread              : Boolean       read FThread             write FThread;
  end;

implementation

uses
  System.SysUtils, System.TypInfo, Datasnap.DBClient;

procedure TEntidade.Carregar(DataSet: TDataSet);
var
  RttiType    : TRttiType;
  RttiContext : TRttiContext;
  Propriedade : TRttiProperty;
  Field       : TField;
  Valor       : TValue;
begin
  if ((not Assigned(DataSet)) or (DataSet.State = TDataSetState.dsInactive)) then
  begin
    Exit;
  end;

  try
    try
      RttiContext := TRttiContext.Create;
      RttiType    := RttiContext.GetType(Self.ClassInfo);

      for Field in DataSet.Fields do
      begin
        Propriedade := RttiType.GetProperty(Field.FieldName);

        if (Propriedade <> nil) and (VerificarPropriedadeEditavel(Propriedade)) then
        begin
          case Propriedade.PropertyType.TypeKind of
            TTypeKind.tkInteger: Propriedade.SetValue(Self, Field.AsInteger);

            TTypeKind.tkString,
            TTypeKind.tkUString,
            TTypeKind.tkChar,
            TTypeKind.tkWChar,
            TTypeKind.tkLString,
            TTypeKind.tkWString: Propriedade.SetValue(Self, Field.AsString);

            TTypeKind.tkFloat:
            begin
              if (Propriedade.PropertyType.Name.Trim.ToUpper.Equals('TDATE')) or
                 (Propriedade.PropertyType.Name.Trim.ToUpper.Equals('TDATETIME')) or
                 (Propriedade.PropertyType.Name.Trim.ToUpper.Equals('TTIME')) then
              begin
                Propriedade.SetValue(Self, Field.AsDateTime);
              end
              else
              begin
                Propriedade.SetValue(Self, Field.AsFloat);
              end;
            end;

            TTypeKind.tkEnumeration:
            begin
              Valor := TValue.FromOrdinal(Propriedade.PropertyType.Handle, GetEnumValue(Propriedade.PropertyType.Handle, GetEnumName(Propriedade.PropertyType.Handle, Field.AsInteger)));

              Propriedade.SetValue(Self, Valor);
            end;

            TTypeKind.tkClass:
            begin
              if Propriedade.PropertyType.AsInstance.MetaclassType.InheritsFrom(TMemoryStream) then
              begin
                TMemoryStream(Propriedade.GetValue(Self).AsObject).Clear;
                TBlobField(Field).SaveToStream(TMemoryStream(Propriedade.GetValue(Self).AsObject));
              end;
            end;
          end;
        end;
      end;
    except
      on Expt: System.SysUtils.Exception do
      begin
        raise;
      end;
    end;
  finally
    RttiContext.Free;
  end;
end;

procedure TEntidade.Carregar(Dto: TEntidade);
var
  RttiType        : TRttiType;
  RttiContext     : TRttiContext;
  Propriedade     : TRttiProperty;
  MetodosCarregar : TArray<TRttiMethod>;
  MetodoCarregar  : TRttiMethod;
  ObjetoDTO       : TObject;
begin
  if Self.ClassName <> Dto.ClassName then
  begin
    raise Exception.Create('Entidade diferentes da passada');;
  end;

  try
    RttiContext := TRttiContext.Create;
    RttiType    := RttiContext.GetType(Self.ClassInfo);

    for Propriedade in RttiType.GetProperties() do
    begin
      if (Propriedade <> nil) and (VerificarPropriedadeEditavel(Propriedade)) then
      begin
        if Propriedade.PropertyType.TypeKind = TTypeKind.tkClass then
        begin
          ObjetoDTO := Propriedade.GetValue(Self).AsObject;

          if ((Assigned(ObjetoDTO)) and (ObjetoDTO.InheritsFrom(TEntidade))) then
          begin
            MetodosCarregar := TRttiInstanceType(Propriedade.PropertyType).GetMethods('Carregar');

            for MetodoCarregar in MetodosCarregar do
            begin
              if MetodoCarregar.GetParameters[0].Name = 'Dto' then
              begin
                MetodoCarregar.Invoke(Propriedade.GetValue(Self), [Propriedade.GetValue(Dto)]);
                Break;
              end;
            end;
          end;
        end
        else
        begin
          Propriedade.SetValue(Self, Propriedade.GetValue(Dto));
        end;
      end;
    end;
  finally
    System.SysUtils.FreeAndNil(RttiType);
  end;
end;

constructor TEntidade.Create;
begin
  FSufixoClasseAdpter := EmptyStr;
  FNomePesquisa       := EmptyStr;
  FNomeTabela         := FNome;
  FThread             := False;
  FConnection         := TFDConnection.Create(nil);
  definirPadroes;
end;

procedure TEntidade.definirPadroes;
begin
  FFiltroAtivos := False;
  PinturaGridPesquisa := 0;
end;

function TEntidade.VerificarPropriedadeEditavel(Propriedade : TRttiProperty): Boolean;
var
  Attribute : TCustomAttribute;
begin
  if not Propriedade.IsWritable then
  begin
    Exit(False);
  end;

  for Attribute in Propriedade.GetAttributes do
  begin
    if Attribute is TNaoPermiteLimpar then
    begin
      Exit(False);
    end;
  end;

  Result := True;
end;

destructor TEntidade.Destroy;
begin
  if FConnection <> nil then
    System.SysUtils.FreeAndNil(FConnection);

  inherited;
end;

function TEntidade.GetNomeTabela: String;
begin
  if Trim(FNomeTabela) <> EmptyStr then
    Result := FNomeTabela
  else
    Result := FNome;
end;

procedure TEntidade.Limpar;
var
  RttiType    : TRttiType;
  RttiContext : TRttiContext;
  Propriedade : TRttiProperty;
begin
  try
    try
      RttiContext := TRttiContext.Create;
      RttiType    := RttiContext.GetType(Self.ClassInfo);

      for Propriedade in RttiType.GetProperties() do
      begin
        if VerificarPropriedadeEditavel(Propriedade) then
        begin
          if Propriedade.PropertyType.TypeKind = tkClass then
          begin
            {$REGION 'Trata as classes dentro de propriedades'}
            if Propriedade.GetValue(Self).AsObject <> nil then
            begin
              if TRttiInstanceType(Propriedade.PropertyType).MetaclassType.InheritsFrom(TEntidade) then
              begin
                TRttiInstanceType(Propriedade.PropertyType).GetMethod('Limpar').Invoke(Propriedade.GetValue(Self), []);
              end
              else
              begin
                if TRttiInstanceType(Propriedade.PropertyType).MetaclassType.InheritsFrom(TClientDataSet) then
                begin
                  if not TRttiInstanceType(Propriedade.PropertyType).GetMethod('IsEmpty').Invoke(Propriedade.GetValue(Self), []).AsBoolean then
                  begin
                    TRttiInstanceType(Propriedade.PropertyType).GetMethod('EmptyDataSet').Invoke(Propriedade.GetValue(Self), []);
                  end;
                end;
              end;
            end;
            {$ENDREGION}
          end
          else
          begin
            Propriedade.SetValue(Self, TValue.Empty);
          end;
        end;
      end;

      definirPadroes;
    except
      on Expt: System.SysUtils.Exception do
      begin
        raise;
      end;
    end;
  finally
    System.SysUtils.FreeAndNil(RttiType);
  end;
end;

{ TLimitarValorMaximo }

constructor TLimitarValorMaximo.Create(NomeDominio: String);
begin
  FNomeDominio := NomeDominio;
end;

end.
