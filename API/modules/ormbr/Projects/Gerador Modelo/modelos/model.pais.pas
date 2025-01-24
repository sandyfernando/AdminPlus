unit model.pais;

interface

uses
  DB, 
  Classes, 
  SysUtils, 
  Generics.Collections, 

  /// orm 
  ormbr.types.blob, 
  ormbr.types.lazy, 
  ormbr.types.mapping, 
  ormbr.types.nullable, 
  ormbr.mapping.classes, 
  ormbr.mapping.register, 
  ormbr.mapping.attributes; 

type
  [Entity]
  [Table('pais', '')]
  [PrimaryKey('id', NotInc, NoSort, False, 'Chave prim�ria')]
  Tpais = class
  private
    { Private declarations } 
    Fid: Nullable<Integer>;
    Fsigla: Nullable<String>;
    Fdescricao: Nullable<String>;
  public 
    { Public declarations } 
    [Column('id', ftInteger)]
    [Dictionary('id', 'Mensagem de valida��o', '', '', '', taCenter)]
    property id: Nullable<Integer> read Fid write Fid;

    [Column('sigla', ftString, 3)]
    [Dictionary('sigla', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property sigla: Nullable<String> read Fsigla write Fsigla;

    [Column('descricao', ftString, 250)]
    [Dictionary('descricao', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property descricao: Nullable<String> read Fdescricao write Fdescricao;
  end;

implementation

initialization
  TRegisterClass.RegisterEntity(Tpais)

end.
