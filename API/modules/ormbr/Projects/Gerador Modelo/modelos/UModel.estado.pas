unit UModel.estado;

interface

uses
  DB, 
  Classes, 
  SysUtils, 
  Generics.Collections, 

  /// orm 
  UModel.pais,
  ormbr.types.blob, 
  ormbr.types.lazy, 
  ormbr.types.mapping, 
  ormbr.types.nullable, 
  ormbr.mapping.classes, 
  ormbr.mapping.register, 
  ormbr.mapping.attributes; 

type
  [Entity]
  [Table('estado', '')]
  [PrimaryKey('id', NotInc, NoSort, False, 'Chave primária')]
  Testado = class
  private
    { Private declarations } 
    Fid: Nullable<Integer>;
    Fid_pais: Nullable<Integer>;
    Fuf: Nullable<String>;
    Fdescricao: Nullable<String>;

    Fpais_0:  Tpais  ;
  public 
    { Public declarations } 
    constructor Create;
    destructor Destroy; override;
    [Column('id', ftInteger)]
    [Dictionary('id', 'Mensagem de validação', '', '', '', taCenter)]
    property id: Nullable<Integer> read Fid write Fid;

    [Column('id_pais', ftInteger)]
    [ForeignKey('fk_estado_paid', 'id_pais', 'pais', 'id', SetNull, SetNull)]
    [Dictionary('id_pais', 'Mensagem de validação', '', '', '', taCenter)]
    property id_pais: Nullable<Integer> read Fid_pais write Fid_pais;

    [Column('uf', ftString, 3)]
    [Dictionary('uf', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property uf: Nullable<String> read Fuf write Fuf;

    [Column('descricao', ftString, 250)]
    [Dictionary('descricao', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property descricao: Nullable<String> read Fdescricao write Fdescricao;

    [Association(OneToOne,'id_pais','pais','id')]
    property pais: Tpais read Fpais_0 write Fpais_0;

  end;

implementation

constructor Testado.Create;
begin
  Fpais_0 := Tpais.Create;
end;

destructor Testado.Destroy;
begin
  if Assigned(Fpais_0) then
    Fpais_0.Free;

  inherited;
end;

initialization
  TRegisterClass.RegisterEntity(Testado)

end.
