inherited FCadUsuario: TFCadUsuario
  Caption = 'Cadastro Usu'#225'rio'
  ClientHeight = 209
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitHeight = 247
  TextHeight = 13
  inherited PGPrincipal: TPageControl
    Height = 157
    inherited TComum: TTabSheet
      ExplicitHeight = 129
      inherited GPDADOS1: TGridPanel
        BevelOuter = bvNone
        inherited pnlcodigo: TPanel
          Left = 0
          Top = 0
          Width = 184
          Height = 41
          inherited edtCodigo: TEdit
            ImeName = 'IDUSUARIO'
          end
        end
        inherited pnlvasio: TPanel
          Top = 0
          Height = 41
        end
        inherited pnlStatus: TPanel
          Top = 0
          Width = 184
          Height = 41
          ExplicitWidth = 184
        end
      end
      object GridPanel2: TGridPanel
        Left = 0
        Top = 41
        Width = 551
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        Caption = 'GridPanel2'
        ColumnCollection = <
          item
            Value = 50.000000000000000000
          end
          item
            Value = 50.000000000000000000
          end>
        ControlCollection = <
          item
            Column = 0
            Control = Panel1
            Row = 0
          end
          item
            Column = 1
            Control = Panel2
            Row = 0
          end>
        RowCollection = <
          item
            Value = 100.000000000000000000
          end>
        ShowCaption = False
        TabOrder = 1
        ExplicitLeft = 216
        ExplicitTop = 72
        ExplicitWidth = 185
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 276
          Height = 41
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel1'
          ShowCaption = False
          TabOrder = 0
          ExplicitLeft = 72
          ExplicitTop = 24
          ExplicitWidth = 185
          object Label1: TLabel
            Left = 0
            Top = 0
            Width = 276
            Height = 13
            Align = alTop
            Caption = 'Login'
            ExplicitWidth = 25
          end
          object edtLogin: TEdit
            AlignWithMargins = True
            Left = 3
            Top = 16
            Width = 270
            Height = 22
            Align = alClient
            TabOrder = 0
            ExplicitLeft = 72
            ExplicitTop = 32
            ExplicitWidth = 121
            ExplicitHeight = 21
          end
        end
        object Panel2: TPanel
          Left = 276
          Top = 0
          Width = 275
          Height = 41
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel1'
          ShowCaption = False
          TabOrder = 1
          ExplicitLeft = 72
          ExplicitTop = 24
          ExplicitWidth = 185
          object Label2: TLabel
            Left = 0
            Top = 0
            Width = 275
            Height = 13
            Align = alTop
            Caption = 'Senha'
            ExplicitLeft = 6
            ExplicitTop = -3
          end
          object edtSenha: TEdit
            AlignWithMargins = True
            Left = 3
            Top = 16
            Width = 269
            Height = 22
            Align = alClient
            PasswordChar = '*'
            TabOrder = 0
            ExplicitHeight = 21
          end
        end
      end
      object GridPanel3: TGridPanel
        Left = 0
        Top = 82
        Width = 551
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        Caption = 'GridPanel2'
        ColumnCollection = <
          item
            SizeStyle = ssAbsolute
            Value = 110.000000000000000000
          end
          item
            Value = 100.000000000000000000
          end>
        ControlCollection = <
          item
            Column = 0
            Control = Panel3
            Row = 0
          end
          item
            Column = 1
            Control = Panel4
            Row = 0
          end>
        RowCollection = <
          item
            Value = 100.000000000000000000
          end>
        ShowCaption = False
        TabOrder = 2
        ExplicitLeft = 24
        ExplicitTop = 129
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 110
          Height = 41
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel1'
          ShowCaption = False
          TabOrder = 0
          ExplicitTop = 6
          ExplicitWidth = 276
          ExplicitHeight = 29
          object Label3: TLabel
            Left = 0
            Top = 0
            Width = 110
            Height = 13
            Align = alTop
            Caption = 'Funcion'#225'rio'
            ExplicitWidth = 55
          end
          object edtIdFuncionario: TEdit
            AlignWithMargins = True
            Left = 3
            Top = 16
            Width = 104
            Height = 22
            Align = alClient
            TabOrder = 0
            ExplicitWidth = 270
            ExplicitHeight = 21
          end
        end
        object Panel4: TPanel
          Left = 110
          Top = 0
          Width = 441
          Height = 41
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel1'
          ShowCaption = False
          TabOrder = 1
          ExplicitLeft = 276
          ExplicitWidth = 275
          object Label4: TLabel
            Left = 0
            Top = 0
            Width = 441
            Height = 13
            Align = alTop
            ExplicitWidth = 3
          end
          object edtDsFuncionario: TEdit
            AlignWithMargins = True
            Left = 3
            Top = 16
            Width = 435
            Height = 22
            Align = alClient
            PasswordChar = '*'
            TabOrder = 0
            ExplicitWidth = 269
            ExplicitHeight = 21
          end
        end
      end
    end
  end
  inherited pnlRodape: TPanel
    Top = 157
  end
end
