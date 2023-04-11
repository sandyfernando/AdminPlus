unit UFListaUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ULista, Data.DB, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, UUsuarioController, UUsuario;

type
  TFListaUsuario = class(TFLista)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FUsuarioController : TUsauarioController;
    protected
      procedure CarrecarLista              ; override;
      procedure Incluir                    ;override;
      procedure Alterar; override;
  public
    { Public declarations }
  end;

var
  FListaUsuario: TFListaUsuario;

implementation
uses UFCadUsuario;
{$R *.dfm}

{ TFListaUsuario }

procedure TFListaUsuario.Alterar;
var
  CadUusaurio : TFCadUsuario;
begin
  CadUusaurio := TFCadUsuario.Create(nil);
  try
    CadUusaurio.Id :=  FUsuarioController.MemTab.FieldByName('IDUSUARIO').AsInteger;
    CadUusaurio.ShowModal;
  finally
    CadUusaurio.Free;
  end;
end;

procedure TFListaUsuario.CarrecarLista;
begin
  inherited;
  FUsuarioController.BuscarListaEntidade(FUsuarioController.Usuario);
  ds.DataSet         := FUsuarioController.MemTab;
  gdLista.DataSource := ds;
  Panel2.Enabled     := True;
  btAlterar.Enabled  := True;
end;

procedure TFListaUsuario.FormCreate(Sender: TObject);
begin
  inherited;
  FUsuarioController := TUsauarioController.Create;
end;

procedure TFListaUsuario.FormDestroy(Sender: TObject);
begin
  inherited;
  FUsuarioController.Free;
end;

procedure TFListaUsuario.Incluir;
var
  lFCadUsuario : TFCadUsuario;
begin
  lFCadUsuario := TFCadUsuario.Create(nil);
  try
    lFCadUsuario.ShowModal;
  finally
    lFCadUsuario.Free;
  end;

end;

end.
