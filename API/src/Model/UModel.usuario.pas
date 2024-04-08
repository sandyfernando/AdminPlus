unit UModel.usuario;

interface

uses
  DB, 
  Classes, 
  SysUtils, 
  Generics.Collections, 

  /// orm 
  UModel.empresa,
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
  [Table('usuario', '')]
  [PrimaryKey('id', NotInc, NoSort, False, 'Chave primária')]
  Tusuario = class
  private
    { Private declarations } 
    Fid: Nullable<Integer>;
    Fid_pessoa: Nullable<Integer>;
    Fid_empresa: Nullable<Integer>;
    Flogin: Nullable<String>;
    Fsenha: Nullable<String>;

    Fempresa_0:  Tempresa  ;
    Fpessoa_1:  Tpessoa  ;
  public 
    { Public declarations } 
    constructor Create;
    destructor Destroy; override;
    [Column('id', ftInteger)]
    [Dictionary('id', 'Mensagem de validação', '', '', '', taCenter)]
    property id: Nullable<Integer> read Fid write Fid;

    [Column('id_pessoa', ftInteger)]
    [ForeignKey('fk_usuario_pessoa', 'id_pessoa', 'pessoa', 'id', SetNull, SetNull)]
    [Dictionary('id_pessoa', 'Mensagem de validação', '', '', '', taCenter)]
    property id_pessoa: Nullable<Integer> read Fid_pessoa write Fid_pessoa;

    [Column('id_empresa', ftInteger)]
    [ForeignKey('fk_usuario_empresa', 'id_empresa', 'empresa', 'id', SetNull, SetNull)]
    [Dictionary('id_empresa', 'Mensagem de validação', '', '', '', taCenter)]
    property id_empresa: Nullable<Integer> read Fid_empresa write Fid_empresa;

    [Column('login', ftString, 250)]
    [Dictionary('login', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property login: Nullable<String> read Flogin write Flogin;

    [Column('senha', ftString, 250)]
    [Dictionary('senha', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property senha: Nullable<String> read Fsenha write Fsenha;

    [Association(OneToOne,'id_empresa','empresa','id')]
    property empresa: Tempresa read Fempresa_0 write Fempresa_0;

    [Association(OneToOne,'id_pessoa','pessoa','id')]
    property pessoa: Tpessoa read Fpessoa_1 write Fpessoa_1;

  end;

implementation

constructor Tusuario.Create;
begin
  Fempresa_0 := Tempresa.Create;
  Fpessoa_1 := Tpessoa.Create;
end;

destructor Tusuario.Destroy;
begin
  if Assigned(Fempresa_0) then
    Fempresa_0.Free;

  if Assigned(Fpessoa_1) then
    Fpessoa_1.Free;

  inherited;
end;

initialization
  TRegisterClass.RegisterEntity(Tusuario)

end.
