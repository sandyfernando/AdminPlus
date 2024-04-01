unit UModel.Pais;

interface
uses
 UModel,
 dbcbr.mapping.attributes,
 dbcbr.types.mapping,
 dbcbr.mapping.register,
 ormbr.types.nullable,
 ormbr.types.blob,
 Data.DB,
 System.Classes;

type
  [Entity]
  [Table('pais','')]
  [PrimaryKey('id', 'Chave primária')]
  [Sequence('pais_id_seq')]
  [OrderBy('id Desc')]
  TPaisModel = class
  private
    FDescricao: String;
    FId: Integer;
    FSigla: String;

    procedure SetDescricao(const Value: String);
    procedure SetId(const Value: Integer);
    procedure SetSigla(const Value: String);

  public
    [Restrictions([TRestriction.NoUpdate, TRestriction.NoInsert , TRestriction.NotNull])]
    [Column('id', ftInteger)]
    [Dictionary('client_id','Mensagem de validação','','','',taCenter)]
    property Id: Integer read FId write SetId;

    [Column('sigla', ftString, 3)]
    [Dictionary('sigla','Valor passado para sigla é invalido','','','',taLeftJustify)]
    property Sigla: String read FSigla write SetSigla;

    [Column('descricao', ftString, 250)]
    [Dictionary('descricao','Valor informado para descriação é invalido','','','',taLeftJustify)]
    property Descricao: String read FDescricao write SetDescricao;
  end;

implementation

{ TPais }

procedure TPaisModel.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TPaisModel.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TPaisModel.SetSigla(const Value: String);
begin
  FSigla := Value;
end;
initialization
  TRegisterClass.RegisterEntity(TPaisModel);
end.
