inherited FListaUsuario: TFListaUsuario
  Caption = 'Lista Usu'#225'rio'
  FormStyle = fsMDIForm
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  inherited Panel2: TPanel
    inherited gdLista: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'IDUSUARIO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LOGIN'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDFUNCIONARIO'
          Visible = True
        end>
    end
  end
  inherited Imagem32x32: TImageList
    Left = 673
    Top = 229
  end
  inherited Imagem24x24: TImageList
    Left = 576
    Top = 285
  end
  inherited Imagem14x14: TImageList
    Left = 568
    Top = 230
  end
  inherited Imagem16x16: TImageList
    Left = 672
    Top = 293
  end
  inherited Imagem12x12: TImageList
    Left = 448
    Top = 278
  end
  inherited ImagemGrid: TImageList
    Left = 449
    Top = 229
  end
end
