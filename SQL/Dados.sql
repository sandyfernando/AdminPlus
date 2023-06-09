CREATE TABLE ESTADO (IDESTADO INTEGER NOT NULL PRIMARY KEY,
					 UF       VARCHAR(2) NOT NULL,
					DESCRICAO VARCHAR(250) NOT NULL);
					
CREATE TABLE CIDADE(IDCIDADE    INTEGER NOT NULL PRIMARY KEY,
				    DESCRICAO   VARCHAR(250)NOT NULL,
				    CDIBGE      VARCHAR(50) NOT NULL,
				    IDESTADO    INTEGER NOT NULL,
				   CONSTRAINT FK_CIDADE_ESTADO FOREIGN KEY (IDESTADO) REFERENCES ESTADO(IDESTADO));
				   
CREATE TABLE ENDERECO(IDENDERECO   INTEGER NOT NULL PRIMARY KEY,
					  RUA          VARCHAR(250) NOT NULL,
					  NUMERO       VARCHAR(50),
					  BAIRRO       VARCHAR(250) NOT NULL,
					  IDCIDADE     INTEGER NOT NULL,
					  CEP          VARCHAR(8) NOT NULL,
					  COMPLEMENTO  VARCHAR(250),
					  REFERENCIA   VARCHAR(250),
					 CONSTRAINT FK_ENDERECO_CIDADE FOREIGN KEY (IDCIDADE) REFERENCES CIDADE(IDCIDADE));
					 
CREATE TABLE CONTATO (IDCONTATO INTEGER NOT NULL PRIMARY KEY,
					  TEL      VARCHAR (12),
					  CEL      VARCHAR (12) NOT NULL,
					  EMAIL    VARCHAR(250),
					  EMAIL2   VARCHAR (250));
					  
		
					  
CREATE TABLE PESSOA(IDPESSOA       INTEGER NOT NULL PRIMARY KEY,
                     TIPO           INTEGER NOT NULL,--1 CLIENTE 2 FORNECEDOR 3 FUNCIONARIO 4 CLIENTE/FORNECEDOR
					 TIPOJURIDICO   INTEGER NOT NULL,-- 1 FISICO 2 JURIDICO
					 CPFCNPJ        INTEGER,
					 DESCRICAO      VARCHAR(250) NOT NULL,
					 FANTASIA       VARCHAR(250),
					 INSMUNICIPAL   VARCHAR(15),
					 INSESTADUAL    VARCHAR(15),
					 CNAES          VARCHAR(10),
					 IDCONTATO      INTEGER,
					 IDENDERECOENT  INTEGER,
					 IDENDERECOCOB  INTEGER,
					CONSTRAINT FK_PESSOA_ENDERECOENT FOREIGN KEY (IDENDERECOENT) REFERENCES ENDERECO(IDENDERECO),
					CONSTRAINT FK_PESSOA_ENDERECOCOB FOREIGN KEY (IDENDERECOCOB) REFERENCES ENDERECO(IDENDERECO),
					CONSTRAINT FK_PESSOA_CONTATO  FOREIGN KEY (IDCONTATO)  REFERENCES CONTATO(IDCONTATO));
					
				

CREATE TABLE CARGO(IDCARGO   INTEGER NOT NULL PRIMARY KEY,
				   DESCRICAO VARCHAR(250) NOT NULL);
					
CREATE TABLE FUNCIONARIO (IDFUNCIONARIO INTEGER NOT NULL PRIMARY KEY,
						  IDPESSOA      INTEGER NOT NULL,
						  IDCARGO       INTEGER NOT NULL,
						  NIS           VARCHAR(250),
						  SALARIO       NUMERIC,
						  DATAADMISSAO  DATE,
						  DATADEMISSAO  DATE,
						 CONSTRAINT FK_FUNCIONARIO_PESSOA FOREIGN KEY (IDPESSOA) REFERENCES PESSOA(IDPESSOA),
						 CONSTRAINT FK_FUNCIONARIO_CARGO  FOREIGN KEY (IDCARGO)  REFERENCES CARGO(IDCARGO) );
						 
CREATE TABLE USUARIO(IDUSUARIO     INTEGER NOT NULL PRIMARY KEY,
					 LOGIN         VARCHAR(250) NOT NULL,
					 SENHA         VARCHAR (80) NOT NULL,
					 IDFUNCIONARIO INTEGER,
					CONSTRAINT FK_USUARIO_FUNCIONARIO FOREIGN KEY (IDFUNCIONARIO) REFERENCES FUNCIONARIO(IDFUNCIONARIO));
					
INSERT INTO USUARIO(IDUSUARIO, LOGIN, SENHA) VALUES (1, 'admin','admin' )
					 