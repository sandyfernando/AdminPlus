unit ULista;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, System.ImageList, Vcl.ImgList, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, UController;

type
  TFLista = class(TForm)
    pnlFiltro: TPanel;
    Panel2: TPanel;
    gpOpcoes: TGridPanel;
    gdLista: TDBGrid;
    gpLegenda: TGridPanel;
    ds: TDataSource;
    Imagem32x32: TImageList;
    Imagem24x24: TImageList;
    Imagem14x14: TImageList;
    Imagem16x16: TImageList;
    Imagem12x12: TImageList;
    ImagemGrid: TImageList;
    gpBtFiltro: TGridPanel;
    pnlBtVazio: TPanel;
    pnlBtCarregar: TPanel;
    btCarregarLista: TButton;
    pnlIncluir: TPanel;
    pnlBtAlterar: TPanel;
    pnlExcluir: TPanel;
    pnlBtgirdVazio: TPanel;
    pnlImprimir: TPanel;
    btIncluir: TButton;
    btAlterar: TButton;
    btExcluir: TButton;
    btImprimir: TButton;
    pnlInativo: TPanel;
    pnlBloqueado: TPanel;
    pnalLgVazio: TPanel;
    spInativo: TShape;
    shBloqueado: TShape;
    lblgIntativo: TLabel;
    lbLgBloqueado: TLabel;
    procedure btCarregarListaClick(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarrecarLista;                                  virtual; abstract;
    procedure Incluir;                                        virtual; abstract;
    procedure Alterar;                                        virtual; abstract;
    procedure Excluir;                                        virtual; abstract;
    procedure Imprimir;                                        virtual; abstract;
    procedure CarregarDTO;                                    virtual; abstract;
  public
    { Public declarations }
  end;

var
  FLista: TFLista;

implementation

{$R *.dfm}

procedure TFLista.btAlterarClick(Sender: TObject);
begin
  Alterar;
end;

procedure TFLista.btCarregarListaClick(Sender: TObject);
begin
  CarrecarLista;
end;

procedure TFLista.btExcluirClick(Sender: TObject);
begin
  Excluir;
end;

procedure TFLista.btImprimirClick(Sender: TObject);
begin
  Imprimir;
end;

procedure TFLista.btIncluirClick(Sender: TObject);
begin
  Incluir;
end;

end.
