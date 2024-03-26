unit UModel.Pais;

interface
uses
 UModel;

type
  TPaisModel = class(TModel)
  private
    FDescricao: String;
    FId: Integer;
    FSigla: String;

    procedure SetDescricao(const Value: String);
    procedure SetId(const Value: Integer);
    procedure SetSigla(const Value: String);

  public
    property Id: Integer read FId write SetId;
    property Sigla: String read FSigla write SetSigla;
    property Descricao: String read FDescricao write SetDescricao;
  end;

implementation

{ TPais }

procedure TPaisModel.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TPaisModel.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TPaisModel.SetSigla(const Value: String);
begin
  FSigla := Value;
end;

end.
