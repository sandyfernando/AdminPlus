unit model.pg_catalog.pg_config;

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
  [Table('pg_catalog.pg_config', '')]
  Tpg_catalog.pg_config = class
  private
    { Private declarations } 
    Fname: TBlob;
    Fsetting: TBlob;
  public 
    { Public declarations } 
    [Column('name', ftBlob)]
    [Dictionary('name', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property name: TBlob read Fname write Fname;

    [Column('setting', ftBlob)]
    [Dictionary('setting', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property setting: TBlob read Fsetting write Fsetting;
  end;

implementation

initialization
  TRegisterClass.RegisterEntity(Tpg_catalog.pg_config)

end.
