unit UFCadUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UCad, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, UUsuarioController;

type
  TFCadUsuario = class(TFCad)
    GridPanel2: TGridPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    edtLogin: TEdit;
    Label2: TLabel;
    edtSenha: TEdit;
    GridPanel3: TGridPanel;
    Panel3: TPanel;
    Label3: TLabel;
    edtIdFuncionario: TEdit;
    Panel4: TPanel;
    edtDsFuncionario: TEdit;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FUsauarioController : TUsauarioController;
  protected
    procedure CarregarModelo; override;
    procedure CarregarDTO; override;
  public
    { Public declarations }

  end;


implementation

{$R *.dfm}

{ TFCadUsuario }

procedure TFCadUsuario.CarregarDTO;
begin
  inherited;
  edtCodigo.Text        := FUsauarioController.Usuario.IdUsuario.ToString;
  edtLogin.Text         := FUsauarioController.Usuario.Login;
  edtIdFuncionario.Text := FUsauarioController.Usuario.IdFuncioanerio.ToString;
  edtDsFuncionario.Text := FUsauarioController.Usuario.IdFuncioanerio.ToString;
end;

procedure TFCadUsuario.CarregarModelo;
begin
  FUsauarioController.Usuario.IdUsuario := Id;
  FUsauarioController.BuscarEntidade(FUsauarioController.Usuario);

end;

procedure TFCadUsuario.FormCreate(Sender: TObject);
begin
  inherited;
  FUsauarioController := TUsauarioController.Create;
end;

procedure TFCadUsuario.FormDestroy(Sender: TObject);
begin
  inherited;
  FUsauarioController.Free;
end;

end.
