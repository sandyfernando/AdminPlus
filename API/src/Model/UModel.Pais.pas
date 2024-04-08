unit UModel.pais;

interface

uses
 dbcbr.mapping.attributes,
 dbcbr.types.mapping,
 dbcbr.mapping.register,
 ormbr.types.nullable,
 ormbr.types.blob,
 Data.DB,
 System.Classes;
type
  [Entity]
  [Table('pais', '')]
  [PrimaryKey('id', NotInc, NoSort, False, 'Chave primária')]
  Tpais = class
  private
    { Private declarations } 
    Fid: Nullable<Integer>;
    Fsigla: Nullable<String>;
    Fdescricao: Nullable<String>;
  public 
    { Public declarations } 
    [Column('id', ftInteger)]
    [Dictionary('id', 'Mensagem de validação', '', '', '', taCenter)]
    property id: Nullable<Integer> read Fid write Fid;

    [Column('sigla', ftString, 3)]
    [Dictionary('sigla', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property sigla: Nullable<String> read Fsigla write Fsigla;

    [Column('descricao', ftString, 250)]
    [Dictionary('descricao', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property descricao: Nullable<String> read Fdescricao write Fdescricao;
  end;

implementation

initialization
  TRegisterClass.RegisterEntity(Tpais)

end.
