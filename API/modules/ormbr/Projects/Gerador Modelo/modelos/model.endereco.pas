unit model.endereco;

interface

uses
  DB, 
  Classes, 
  SysUtils, 
  Generics.Collections, 

  /// orm 
  model.cidade,
  ormbr.types.blob, 
  ormbr.types.lazy, 
  ormbr.types.mapping, 
  ormbr.types.nullable, 
  ormbr.mapping.classes, 
  ormbr.mapping.register, 
  ormbr.mapping.attributes; 

type
  [Entity]
  [Table('endereco', '')]
  [PrimaryKey('id', NotInc, NoSort, False, 'Chave primária')]
  Tendereco = class
  private
    { Private declarations } 
    Fid: Nullable<Integer>;
    Fid_cidade: Nullable<Integer>;
    Flogradouro: Nullable<String>;
    Fbairro: Nullable<String>;
    Fnumero: Nullable<String>;
    Fcep: Nullable<String>;
    Fcomplmento: Nullable<String>;
    Fponto_referencia: Nullable<String>;
    Ftipo_endereco: Nullable<Integer>;

    Fcidade_0:  Tcidade  ;
  public 
    { Public declarations } 
    constructor Create;
    destructor Destroy; override;
    [Column('id', ftInteger)]
    [Dictionary('id', 'Mensagem de validação', '', '', '', taCenter)]
    property id: Nullable<Integer> read Fid write Fid;

    [Column('id_cidade', ftInteger)]
    [ForeignKey('fk_endereco_cidade', 'id_cidade', 'cidade', 'id', SetNull, SetNull)]
    [Dictionary('id_cidade', 'Mensagem de validação', '', '', '', taCenter)]
    property id_cidade: Nullable<Integer> read Fid_cidade write Fid_cidade;

    [Column('logradouro', ftString, 250)]
    [Dictionary('logradouro', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property logradouro: Nullable<String> read Flogradouro write Flogradouro;

    [Column('bairro', ftString, 250)]
    [Dictionary('bairro', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property bairro: Nullable<String> read Fbairro write Fbairro;

    [Column('numero', ftString, 9)]
    [Dictionary('numero', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property numero: Nullable<String> read Fnumero write Fnumero;

    [Column('cep', ftString, 10)]
    [Dictionary('cep', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property cep: Nullable<String> read Fcep write Fcep;

    [Column('complmento', ftString, 250)]
    [Dictionary('complmento', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property complmento: Nullable<String> read Fcomplmento write Fcomplmento;

    [Column('ponto_referencia', ftString, 250)]
    [Dictionary('ponto_referencia', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property ponto_referencia: Nullable<String> read Fponto_referencia write Fponto_referencia;

    [Column('tipo_endereco', ftInteger)]
    [Dictionary('tipo_endereco', 'Mensagem de validação', '', '', '', taCenter)]
    property tipo_endereco: Nullable<Integer> read Ftipo_endereco write Ftipo_endereco;

    [Association(OneToOne,'id_cidade','cidade','id')]
    property cidade: Tcidade read Fcidade_0 write Fcidade_0;

  end;

implementation

constructor Tendereco.Create;
begin
  Fcidade_0 := Tcidade.Create;
end;

destructor Tendereco.Destroy;
begin
  if Assigned(Fcidade_0) then
    Fcidade_0.Free;

  inherited;
end;

initialization
  TRegisterClass.RegisterEntity(Tendereco)

end.
