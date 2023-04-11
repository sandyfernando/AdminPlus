unit ULogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, UUsuario, System.ImageList, Vcl.ImgList, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TFLogin = class(TForm)
    grbLogin: TGroupBox;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    lblUsuario: TLabel;
    lblSenha: TLabel;
    BtnLogar: TButton;
    ImageList1: TImageList;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnLogarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FUsuario: TUsuario;
    { Private declarations }
    procedure CarregarModel;
    procedure Logar;
  public
    { Public declarations }
  published
    property Usuario : TUsuario read FUsuario write FUsuario;
  end;

var
  FLogin: TFLogin;

implementation
uses ULoginController;
{$R *.dfm}

{ TFLogin }

procedure TFLogin.CarregarModel;
begin
  Usuario.Login := edtUsuario.Text;
  Usuario.Senha := edtSenha.Text;
end;

procedure TFLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if not Usuario.CalcLogado then
     Application.Terminate;
end;

procedure TFLogin.FormCreate(Sender: TObject);
begin
  FUsuario := TUsuario.Create;
end;

procedure TFLogin.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FUsuario);
end;

procedure TFLogin.Logar;
var
  LoginContoller : TLoginController;
begin
  LoginContoller := TLoginController.Create;
  try
    CarregarModel;
    if LoginContoller.Logar(FUsuario) then
    begin
       Usuario.CalcLogado := True;
       Close;
    end
    else
    begin
      Usuario.CalcLogado := False;;
      ShowMessage('Usuario não Localizado!');
    end;
  finally
   FreeAndNil(LoginContoller);
  end;
end;

procedure TFLogin.BtnLogarClick(Sender: TObject);
begin
  Logar;
end;

end.
