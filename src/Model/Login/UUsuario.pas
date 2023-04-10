unit UUsuario;

interface
uses
 UEntidade;
  type
    TUsuario = class(TEntidade)
    private
      FIdFuncionario : Integer;
      FId            : Integer;
      FSenha         : String;
      FLogin         : String;
      FCalcLogado    : Boolean;

    public
      property Id             : Integer read FId              write Fid;
      property Login          : String  read FLogin           write FlOGIN;
      property Senha          : String  read FSenha           write FSenha;
      property IdFuncioanerio : Integer read FIdFuncionario   write FIdFuncionario;
      property CalcLogado     : Boolean read FCalcLogado      write FCalcLogado;
    end;

implementation

end.
