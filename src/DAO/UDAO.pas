unit UDAO;

interface
uses
  FireDAC.Comp.Client, UConexaoDAO, UEntidade, Data.DB;
  type
    TFieldType = Data.DB.TFieldType;
    TDAO = Class
    Connection: TFDConnection;

      private
        protected
          procedure CarregarParametros(Query : TFDQuery; Model : TEntidade);
      public
        constructor Create; reintroduce;
      published
        function PrepararQuery(Connection : TFDConnection = nil) : TFDQuery;
    End;

    var

      DAO       : TDAO;
      Transacao : TFDTransaction;

implementation
uses System.Rtti, FireDAC.Stan.Param, System.Classes, System.SysUtils;
{ TDAO }

procedure TDAO.CarregarParametros(Query: TFDQuery; Model: TEntidade);
var
  RttiType        : TRttiType;
  RttiContext     : TRttiContext;
  Propriedade     : TRttiProperty;
  Attribute       : TCustomAttribute;
  Parametro       : TFDParam;
  I               : Integer;
  Blob            : String;
  Pular           : Boolean;
  Valor           : TValue;
begin
  try
    try
      RttiContext := TRttiContext.Create;
      RttiType    := RttiContext.GetType(Model.ClassInfo);

      for I := 0 to Query.Params.Count -1 do
      begin
        Parametro   := Query.Params.Items[I];
        Propriedade := RttiType.GetProperty(Parametro.Name);

        if (Propriedade <> nil) and (Propriedade.IsReadable) then
        begin
          Pular := False;

          for Attribute in Propriedade.GetAttributes do
          begin
            if Attribute is TCampoTipoBlob then
            begin
              Blob             := Propriedade.GetValue(Model).AsString;
              Parametro.AsBlob := Blob;
              Pular            := True;
              Break;
            end;

            if Attribute is TLimitarValorMaximo then
            begin

              case Propriedade.PropertyType.TypeKind of
                TTypeKind.tkFloat, TTypeKind.tkInteger, TTypeKind.tkInt64:
                begin
                  Valor := Propriedade.GetValue(Model).AsExtended;
                end;
                TTypeKind.tkString,
                TTypeKind.tkUString,
                TTypeKind.tkChar,
                TTypeKind.tkWChar,
                TTypeKind.tkLString,
                TTypeKind.tkWString:
                begin
                  Valor := Propriedade.GetValue(Model).AsString;
                end;
              end;
            end;

          end;

          if Pular then
          begin
            Continue;
          end;

          case Propriedade.PropertyType.TypeKind of
            TTypeKind.tkInteger: Parametro.AsInteger  := Propriedade.GetValue(Model).AsInteger;
            TTypeKind.tkInt64  : Parametro.AsLargeint := Propriedade.GetValue(Model).AsInt64;

            TTypeKind.tkEnumeration: Parametro.AsInteger := Propriedade.GetValue(Model).AsOrdinal;

            TTypeKind.tkString,
            TTypeKind.tkUString,
            TTypeKind.tkChar,
            TTypeKind.tkWChar,
            TTypeKind.tkLString,
            TTypeKind.tkWString: Parametro.AsString := Propriedade.GetValue(Model).AsString;

            TTypeKind.tkClass:
            begin
              if Propriedade.PropertyType.AsInstance.MetaclassType.InheritsFrom(TMemoryStream) then
              begin
                Parametro.LoadFromStream(Propriedade.GetValue(Model).AsType<TMemoryStream>, TFieldType.ftBlob);
              end;
            end;

            TTypeKind.tkFloat:
            begin
              if (Propriedade.PropertyType.Name = 'TDate') then
              begin
                if (Propriedade.GetValue(Model).AsExtended <> 0) and (Propriedade.GetValue(Model).AsExtended <> -700000) then
                begin
                  Parametro.AsDate := Propriedade.GetValue(Model).AsExtended;
                end;
                Continue;
              end;

              if (Propriedade.PropertyType.Name = 'TDateTime') then
              begin
                if (Propriedade.GetValue(Model).AsExtended <> 0) and (Propriedade.GetValue(Model).AsExtended <> -700000) then
                begin
                  Parametro.AsDateTime := Propriedade.GetValue(Model).AsExtended;
                end;
                Continue;
              end;

              if (Propriedade.PropertyType.Name = 'TTime') then
              begin
                Parametro.AsTime := Propriedade.GetValue(Model).AsExtended;
                Continue;
              end;

              Parametro.AsFloat := Propriedade.GetValue(Model).AsExtended;
            end;
          end;
        end;
      end;
    except
      on E: Exception do
      begin
        raise
      end;
    end;
  finally
    RttiContext.Free;
  end;
end;

constructor TDAO.Create;
begin
  if not Assigned(Connection) then
  begin
    Connection := TConexaoDAO.getfdConnection;
  end;
end;

function TDAO.PrepararQuery(Connection: TFDConnection): TFDQuery;
var
  Query : TFDQuery;
begin
  Query := nil;

  if not Assigned(DAO) then
  begin
    DAO := TDAO.Create;
  end;

  Query := TFDQuery.Create(nil);
  Query.Connection := DAO.Connection;
  Result := Query;
end;

end.
