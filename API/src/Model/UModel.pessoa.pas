unit UModel.pessoa;

interface

uses
  DB, 
  Classes, 
  SysUtils, 
  Generics.Collections, 

  /// orm 
  UModel.contato,
  UModel.endereco,
  ormbr.types.blob, 
  ormbr.types.lazy, 
  ormbr.types.mapping, 
  ormbr.types.nullable, 
  ormbr.mapping.classes, 
  ormbr.mapping.register, 
  ormbr.mapping.attributes; 

type
  [Entity]
  [Table('pessoa', '')]
  [PrimaryKey('id', NotInc, NoSort, False, 'Chave primária')]
  Tpessoa = class
  private
    { Private declarations } 
    Fid: Nullable<Integer>;
    Fid_endereco_principal: Nullable<Integer>;
    Fid_endereco_cobranca: Nullable<Integer>;
    Fid_endereco_entrega: Nullable<Integer>;
    Fid_contato: Nullable<Integer>;
    Ftipo_pessoal: Nullable<Integer>;
    Ftipo_pessoa_juridico: Nullable<Integer>;
    Fcpf_cnpj: Nullable<String>;
    Fdescricao: Nullable<String>;
    Fnome_fantasia: Nullable<String>;
    Finsc_estadual: Nullable<String>;
    Finsc_municipal: Nullable<String>;

    Fcontato_0:  Tcontato  ;
    Fendereco_1:  Tendereco  ;
    Fendereco_2:  Tendereco  ;
    Fendereco_3:  Tendereco  ;
  public 
    { Public declarations } 
    constructor Create;
    destructor Destroy; override;
    [Column('id', ftInteger)]
    [Dictionary('id', 'Mensagem de validação', '', '', '', taCenter)]
    property id: Nullable<Integer> read Fid write Fid;

    [Column('id_endereco_principal', ftInteger)]
    [ForeignKey('fk_pessoa_endereco_principal', 'id_endereco_principal', 'endereco', 'id', SetNull, SetNull)]
    [Dictionary('id_endereco_principal', 'Mensagem de validação', '', '', '', taCenter)]
    property id_endereco_principal: Nullable<Integer> read Fid_endereco_principal write Fid_endereco_principal;

    [Column('id_endereco_cobranca', ftInteger)]
    [ForeignKey('fk_pessoa_endereco_cobranca', 'id_endereco_cobranca', 'endereco', 'id', SetNull, SetNull)]
    [Dictionary('id_endereco_cobranca', 'Mensagem de validação', '', '', '', taCenter)]
    property id_endereco_cobranca: Nullable<Integer> read Fid_endereco_cobranca write Fid_endereco_cobranca;

    [Column('id_endereco_entrega', ftInteger)]
    [ForeignKey('fk_pessoa_endereco_entrega', 'id_endereco_entrega', 'endereco', 'id', SetNull, SetNull)]
    [Dictionary('id_endereco_entrega', 'Mensagem de validação', '', '', '', taCenter)]
    property id_endereco_entrega: Nullable<Integer> read Fid_endereco_entrega write Fid_endereco_entrega;

    [Column('id_contato', ftInteger)]
    [ForeignKey('fk_pessoa_contato', 'id_contato', 'contato', 'id', SetNull, SetNull)]
    [Dictionary('id_contato', 'Mensagem de validação', '', '', '', taCenter)]
    property id_contato: Nullable<Integer> read Fid_contato write Fid_contato;

    [Column('tipo_pessoal', ftInteger)]
    [Dictionary('tipo_pessoal', 'Mensagem de validação', '', '', '', taCenter)]
    property tipo_pessoal: Nullable<Integer> read Ftipo_pessoal write Ftipo_pessoal;

    [Column('tipo_pessoa_juridico', ftInteger)]
    [Dictionary('tipo_pessoa_juridico', 'Mensagem de validação', '', '', '', taCenter)]
    property tipo_pessoa_juridico: Nullable<Integer> read Ftipo_pessoa_juridico write Ftipo_pessoa_juridico;

    [Column('cpf_cnpj', ftString, 14)]
    [Dictionary('cpf_cnpj', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property cpf_cnpj: Nullable<String> read Fcpf_cnpj write Fcpf_cnpj;

    [Column('descricao', ftString, 250)]
    [Dictionary('descricao', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property descricao: Nullable<String> read Fdescricao write Fdescricao;

    [Column('nome_fantasia', ftString, 250)]
    [Dictionary('nome_fantasia', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property nome_fantasia: Nullable<String> read Fnome_fantasia write Fnome_fantasia;

    [Column('insc_estadual', ftString, 30)]
    [Dictionary('insc_estadual', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property insc_estadual: Nullable<String> read Finsc_estadual write Finsc_estadual;

    [Column('insc_municipal', ftString, 30)]
    [Dictionary('insc_municipal', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property insc_municipal: Nullable<String> read Finsc_municipal write Finsc_municipal;

    [Association(OneToOne,'id_contato','contato','id')]
    property contato: Tcontato read Fcontato_0 write Fcontato_0;

    [Association(OneToOne,'id_endereco_cobranca','endereco','id')]
    property endereco: Tendereco read Fendereco_1 write Fendereco_1;

    [Association(OneToOne,'id_endereco_entrega','endereco','id')]
    property endereco: Tendereco read Fendereco_2 write Fendereco_2;

    [Association(OneToOne,'id_endereco_principal','endereco','id')]
    property endereco: Tendereco read Fendereco_3 write Fendereco_3;

  end;

implementation

constructor Tpessoa.Create;
begin
  Fcontato_0 := Tcontato.Create;
  Fendereco_1 := Tendereco.Create;
  Fendereco_2 := Tendereco.Create;
  Fendereco_3 := Tendereco.Create;
end;

destructor Tpessoa.Destroy;
begin
  if Assigned(Fcontato_0) then
    Fcontato_0.Free;

  if Assigned(Fendereco_1) then
    Fendereco_1.Free;

  if Assigned(Fendereco_2) then
    Fendereco_2.Free;

  if Assigned(Fendereco_3) then
    Fendereco_3.Free;

  inherited;
end;

initialization
  TRegisterClass.RegisterEntity(Tpessoa)

end.
