unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Vcl.StdCtrls;

type
  TFPrincipal = class(TForm)
    PnlCLient: TPanel;
    ImageList: TImageList;
    pnlMenuLateralComum: TPanel;
    Panel1: TPanel;
    GdPnlMenuPrincipal: TGridPanel;
    BtCadComum: TButton;
    Img64: TImageList;
    BtnFinanceiro: TButton;
    Button2: TButton;
    Button3: TButton;
    BtnSair: TButton;
    Img32: TImageList;
    PnlCadPessoa: TPanel;
    BtCadastroPessoa: TButton;
    PnlUsuario: TPanel;
    BtnUsuario: TButton;
    PnlFinanceiro: TPanel;
    Panel2: TPanel;
    BtnRelatorioFinanceiro: TButton;
    Panel3: TPanel;
    btnContasReceber: TButton;
    Panel4: TPanel;
    BtnContaPagar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtCadComumClick(Sender: TObject);
    procedure BtnFinanceiroClick(Sender: TObject);
    procedure GdPnlMenuPrincipalClick(Sender: TObject);
    procedure PnlCLientClick(Sender: TObject);
    procedure BtnUsuarioClick(Sender: TObject);
  private
    { Private declarations }
    procedure CriarLogin;

    procedure MenuCadatro;
    procedure MenuFinanceiro;
    procedure FecharTodosMenu;

    procedure AbrirTelaListaUsuario;
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation
uses
  ULogin, UFListaUsuario;
{$R *.dfm}

{ TFPrincipal }

procedure TFPrincipal.AbrirTelaListaUsuario;
var
  UsuarioLista : TFListaUsuario;
begin

  UsuarioLista := TFListaUsuario.Create(Application);
  try
    FecharTodosMenu;
    UsuarioLista.Show;

  finally
//    UsuarioLista.Free
  end;

end;

procedure TFPrincipal.BtCadComumClick(Sender: TObject);
begin
  MenuCadatro;
end;

procedure TFPrincipal.BtnFinanceiroClick(Sender: TObject);
begin
  MenuFinanceiro;
end;

procedure TFPrincipal.BtnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFPrincipal.BtnUsuarioClick(Sender: TObject);
begin
  AbrirTelaListaUsuario;
end;

procedure TFPrincipal.CriarLogin;
var
  Login : TFLogin;
begin
  Login := TFLogin.Create(Application);
  Login.ShowModal;
end;

procedure TFPrincipal.FecharTodosMenu;
begin
  pnlMenuLateralComum.Visible := False;
  PnlFinanceiro.Visible       := False;
end;

procedure TFPrincipal.FormCreate(Sender: TObject);
begin
  CriarLogin;
end;

procedure TFPrincipal.GdPnlMenuPrincipalClick(Sender: TObject);
begin
  FecharTodosMenu;
end;

procedure TFPrincipal.MenuCadatro;
begin
  if pnlMenuLateralComum.Visible then
  begin
    pnlMenuLateralComum.Visible := False;
    exit;
  end;
  pnlMenuLateralComum.Visible := True;
  PnlFinanceiro.Visible       := False;
end;

procedure TFPrincipal.MenuFinanceiro;
begin
  if PnlFinanceiro.Visible then
  begin
    pnlMenuLateralComum.Visible := False;
    exit
  end;
  pnlMenuLateralComum.Visible := False;
  PnlFinanceiro.Visible       := True;
end;

procedure TFPrincipal.PnlCLientClick(Sender: TObject);
begin
  FecharTodosMenu;
end;

end.
