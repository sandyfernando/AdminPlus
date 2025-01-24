unit model.cidade;

interface

uses
  DB, 
  Classes, 
  SysUtils, 
  Generics.Collections, 

  /// orm 
  model.estado,
  ormbr.types.blob, 
  ormbr.types.lazy, 
  ormbr.types.mapping, 
  ormbr.types.nullable, 
  ormbr.mapping.classes, 
  ormbr.mapping.register, 
  ormbr.mapping.attributes; 

type
  [Entity]
  [Table('cidade', '')]
  [PrimaryKey('id', NotInc, NoSort, False, 'Chave primária')]
  Tcidade = class
  private
    { Private declarations } 
    Fid: Nullable<Integer>;
    Fid_estado: Nullable<Integer>;
    Fcodigo_ibge: Nullable<String>;
    Fdescricao: Nullable<String>;

    Festado_0:  Testado  ;
  public 
    { Public declarations } 
    constructor Create;
    destructor Destroy; override;
    [Column('id', ftInteger)]
    [Dictionary('id', 'Mensagem de validação', '', '', '', taCenter)]
    property id: Nullable<Integer> read Fid write Fid;

    [Column('id_estado', ftInteger)]
    [ForeignKey('fk_cidade_estado', 'id_estado', 'estado', 'id', SetNull, SetNull)]
    [Dictionary('id_estado', 'Mensagem de validação', '', '', '', taCenter)]
    property id_estado: Nullable<Integer> read Fid_estado write Fid_estado;

    [Column('codigo_ibge', ftString, 50)]
    [Dictionary('codigo_ibge', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property codigo_ibge: Nullable<String> read Fcodigo_ibge write Fcodigo_ibge;

    [Column('descricao', ftString, 250)]
    [Dictionary('descricao', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property descricao: Nullable<String> read Fdescricao write Fdescricao;

    [Association(OneToOne,'id_estado','estado','id')]
    property estado: Testado read Festado_0 write Festado_0;

  end;

implementation

constructor Tcidade.Create;
begin
  Festado_0 := Testado.Create;
end;

destructor Tcidade.Destroy;
begin
  if Assigned(Festado_0) then
    Festado_0.Free;

  inherited;
end;

initialization
  TRegisterClass.RegisterEntity(Tcidade)

end.
