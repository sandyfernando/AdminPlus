unit UCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, UController;

type
  TFCad = class(TForm)
    PGPrincipal: TPageControl;
    TComum: TTabSheet;
    pnlRodape: TPanel;
    GridPanel1: TGridPanel;
    pnlRodapeVasio: TPanel;
    pnlCancelar: TPanel;
    pnlSalvar: TPanel;
    btCancelar: TButton;
    btSALVAR: TButton;
    Imagem12x12: TImageList;
    Imagem14x14: TImageList;
    Imagem24x24: TImageList;
    Imagem32x32: TImageList;
    Imagem16x16: TImageList;
    ImagemGrid: TImageList;
    GPDADOS1: TGridPanel;
    pnlcodigo: TPanel;
    pnlvasio: TPanel;
    pnlStatus: TPanel;
    lbCodigo: TLabel;
    lbStatus: TLabel;
    edtCodigo: TEdit;
    cbStatus: TComboBox;
    procedure btSALVARClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarModelo;                                  virtual; abstract;
    procedure Cancelar;                                        virtual; abstract;
    procedure Gravar;                                          virtual; abstract;
    procedure CarregarDTO;                                     virtual; abstract;

  public
    { Public declarations }
  end;

var
  FCad: TFCad;

implementation

{$R *.dfm}

procedure TFCad.btCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TFCad.btSALVARClick(Sender: TObject);
begin
  Gravar;
end;

procedure TFCad.FormShow(Sender: TObject);
begin
  CarregarModelo;
end;

end.
