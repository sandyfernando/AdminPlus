unit UController;

interface
uses
  UEntidade, FireDAC.Comp.Client, Vcl.Controls, System.Classes, UConexaoDAO;
  type
    TController = class(TPersistent)
      private
        FMemTab: TFDMemTable;

        procedure Processar;

      public
        procedure Gravar        (Entidade : TEntidade);                           virtual; abstract;
        procedure MostrarObjeto (Objeto : TControl; Centralizar : Boolean = True);

        function BuscarEntidade      (Entidade : TEntidade) : Boolean;     virtual; abstract;
        function BuscarListaEntidade (Entidade : TEntidade) : TFDMemTable; virtual; abstract;
        function Excluir             (Entidade : TEntidade) : Boolean;     virtual; abstract;

        property MemTab : TFDMemTable read FMemTab write FMemTab;

        constructor Create;
        destructor  Destroy; override;
    end;

implementation
uses
  Vcl.Forms, System.SysUtils;
{ TControllerCad }

constructor TController.Create;
begin
  FMemTab := TFDMemTable.Create(nil);
end;

destructor TController.Destroy;
begin
  FreeAndNil(FMemTab);
  inherited;
end;

procedure TController.MostrarObjeto(Objeto: TControl; Centralizar: Boolean);
var
  Owner : TControl;
begin
  if Centralizar then
  begin
    if (Objeto.Owner is TControl) then
    begin
      Owner       := (Objeto.Owner as TControl);
      Objeto.Top  := Round(((Owner.ClientHeight) / 2) - (Objeto.Height / 2));
      Objeto.Left := Round(((Owner.ClientWidth)  / 2) - (Objeto.Width  / 2));
    end;
  end;

  Objeto.Show;
  Objeto.BringToFront;
  Processar();

end;

procedure TController.Processar;
begin
  if Application.MainForm.Enabled then
  begin
    Application.MainForm.Enabled := False;
    Application.ProcessMessages;
    Application.MainForm.Enabled := True;
  end else
  begin
    Application.ProcessMessages;
  end;
end;

end.
