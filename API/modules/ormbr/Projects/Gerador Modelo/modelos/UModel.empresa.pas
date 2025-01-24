unit UModel.empresa;

interface

uses
  DB, 
  Classes, 
  SysUtils, 
  Generics.Collections, 

  /// orm 
  UModel.pessoa,
  ormbr.types.blob, 
  ormbr.types.lazy, 
  ormbr.types.mapping, 
  ormbr.types.nullable, 
  ormbr.mapping.classes, 
  ormbr.mapping.register, 
  ormbr.mapping.attributes; 

type
  [Entity]
  [Table('empresa', '')]
  [PrimaryKey('id', NotInc, NoSort, False, 'Chave primária')]
  Tempresa = class
  private
    { Private declarations } 
    Fid: Nullable<Integer>;
    Fid_pessoa: Nullable<Integer>;
    Ftipo_empresa: Nullable<Integer>;
    Flicenca: Nullable<String>;

    Fpessoa_0:  Tpessoa  ;
  public 
    { Public declarations } 
    constructor Create;
    destructor Destroy; override;
    [Column('id', ftInteger)]
    [Dictionary('id', 'Mensagem de validação', '', '', '', taCenter)]
    property id: Nullable<Integer> read Fid write Fid;

    [Column('id_pessoa', ftInteger)]
    [ForeignKey('fk_empresa_pessoal', 'id_pessoa', 'pessoa', 'id', SetNull, SetNull)]
    [Dictionary('id_pessoa', 'Mensagem de validação', '', '', '', taCenter)]
    property id_pessoa: Nullable<Integer> read Fid_pessoa write Fid_pessoa;

    [Column('tipo_empresa', ftInteger)]
    [Dictionary('tipo_empresa', 'Mensagem de validação', '', '', '', taCenter)]
    property tipo_empresa: Nullable<Integer> read Ftipo_empresa write Ftipo_empresa;

    [Column('licenca', ftString, 250)]
    [Dictionary('licenca', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property licenca: Nullable<String> read Flicenca write Flicenca;

    [Association(OneToOne,'id_pessoa','pessoa','id')]
    property pessoa: Tpessoa read Fpessoa_0 write Fpessoa_0;

  end;

implementation

constructor Tempresa.Create;
begin
  Fpessoa_0 := Tpessoa.Create;
end;

destructor Tempresa.Destroy;
begin
  if Assigned(Fpessoa_0) then
    Fpessoa_0.Free;

  inherited;
end;

initialization
  TRegisterClass.RegisterEntity(Tempresa)

end.
