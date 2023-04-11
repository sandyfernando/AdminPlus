unit UUsuario;

interface
uses
 UEntidade;
  type
    TUsuario = class(TEntidade)
    private
      FIdFuncionario : Integer;
      FIdUsuario     : Integer;
      FSenha         : String;
      FLogin         : String;
      FCalcLogado    : Boolean;

    public
      property IdUsuario      : Integer read FIdUsuario       write FIdUsuario;
      property Login          : String  read FLogin           write FlOGIN;
      property Senha          : String  read FSenha           write FSenha;
      property IdFuncioanerio : Integer read FIdFuncionario   write FIdFuncionario;
      property CalcLogado     : Boolean read FCalcLogado      write FCalcLogado;
    end;

implementation

end.
