unit UModel.Contato;

interface

uses
  DB, 
  Classes, 
  SysUtils, 
  Generics.Collections, 

  /// orm 
  ormbr.types.blob, 
  ormbr.types.lazy, 
  dbcbr.types.mapping,
  ormbr.types.nullable, 
  dbcbr.mapping.classes,
  dbcbr.mapping.register,
  dbcbr.mapping.attributes;

type
  [Entity]
  [Table('contato', '')]
  [PrimaryKey('id', NotInc, NoSort, False, 'Chave primária')]
  Tcontato = class
  private
    { Private declarations } 
    Fid: Nullable<Integer>;
    Ftelefone_princial: Nullable<String>;
    Ftelefone_cobranca: Nullable<String>;
    Ftelefone_entrega: Nullable<String>;
    Fcelular_princial: Nullable<String>;
    Fcelular_cobranca: Nullable<String>;
    Fcelular_entrega: Nullable<String>;
    Fwhatsapp_princial: Nullable<String>;
    Fwhatsapp_cobranca: Nullable<String>;
    Fwhatsapp_entrega: Nullable<String>;
    Femail_princial: Nullable<String>;
    Femail_cobranca: Nullable<String>;
    Femail_entrega: Nullable<String>;
  public 
    { Public declarations } 
    [Column('id', ftInteger)]
    [Dictionary('id', 'Mensagem de validação', '', '', '', taCenter)]
    property id: Nullable<Integer> read Fid write Fid;

    [Column('telefone_princial', ftString, 16)]
    [Dictionary('telefone_princial', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property telefone_princial: Nullable<String> read Ftelefone_princial write Ftelefone_princial;

    [Column('telefone_cobranca', ftString, 16)]
    [Dictionary('telefone_cobranca', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property telefone_cobranca: Nullable<String> read Ftelefone_cobranca write Ftelefone_cobranca;

    [Column('telefone_entrega', ftString, 16)]
    [Dictionary('telefone_entrega', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property telefone_entrega: Nullable<String> read Ftelefone_entrega write Ftelefone_entrega;

    [Column('celular_princial', ftString, 16)]
    [Dictionary('celular_princial', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property celular_princial: Nullable<String> read Fcelular_princial write Fcelular_princial;

    [Column('celular_cobranca', ftString, 16)]
    [Dictionary('celular_cobranca', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property celular_cobranca: Nullable<String> read Fcelular_cobranca write Fcelular_cobranca;

    [Column('celular_entrega', ftString, 16)]
    [Dictionary('celular_entrega', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property celular_entrega: Nullable<String> read Fcelular_entrega write Fcelular_entrega;

    [Column('whatsapp_princial', ftString, 16)]
    [Dictionary('whatsapp_princial', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property whatsapp_princial: Nullable<String> read Fwhatsapp_princial write Fwhatsapp_princial;

    [Column('whatsapp_cobranca', ftString, 16)]
    [Dictionary('whatsapp_cobranca', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property whatsapp_cobranca: Nullable<String> read Fwhatsapp_cobranca write Fwhatsapp_cobranca;

    [Column('whatsapp_entrega', ftString, 16)]
    [Dictionary('whatsapp_entrega', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property whatsapp_entrega: Nullable<String> read Fwhatsapp_entrega write Fwhatsapp_entrega;

    [Column('email_princial', ftString, 250)]
    [Dictionary('email_princial', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property email_princial: Nullable<String> read Femail_princial write Femail_princial;

    [Column('email_cobranca', ftString, 250)]
    [Dictionary('email_cobranca', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property email_cobranca: Nullable<String> read Femail_cobranca write Femail_cobranca;

    [Column('email_entrega', ftString, 250)]
    [Dictionary('email_entrega', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property email_entrega: Nullable<String> read Femail_entrega write Femail_entrega;
  end;

implementation

initialization
  TRegisterClass.RegisterEntity(Tcontato)

end.
