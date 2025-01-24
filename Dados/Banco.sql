-- dados.cliente definition

CREATE TABLE cliente (
  Codigo where b NOT NULL ,
  Nome varchar(250) NOT NULL,
  Cidade varchar(150) NOT NULL,
  UF varchar(2) NOT NULL,
  PRIMARY KEY (`Codigo`)
);


-- dados.contato definition

CREATE TABLE `contato` (
  `IDCONTATO` int(11) NOT NULL AUTO_INCREMENT,
  `CEL` varchar(50) NOT NULL,
  `CELCOMERCIAL` varchar(50) NOT NULL,
  `CELFINANCEIRO` varchar(50) NOT NULL,
  `EMAIL` varchar(250) NOT NULL,
  `EMAILCOMERCIAL` varchar(250) NOT NULL,
  `EMAILFINANCA` varchar(250) NOT NULL,
  PRIMARY KEY (`IDCONTATO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- dados.estado definition

CREATE TABLE `estado` (
  `IDESTADO` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRICAO` int(11) NOT NULL,
  `PAIS` int(11) NOT NULL,
  PRIMARY KEY (`IDESTADO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- dados.pedidoitvenda definition

CREATE TABLE `pedidoitvenda` (
  `NumItVenda` int(11) NOT NULL AUTO_INCREMENT,
  `NumPedido` int(11) NOT NULL,
  `FKProduto` int(11) NOT NULL,
  `VlUnitario` double NOT NULL,
  `Qauntidade` double NOT NULL,
  `VlTotal` double NOT NULL,
  PRIMARY KEY (`NumItVenda`),
  KEY `PedidoItPedidoNumPedido` (`NumPedido`),
  KEY `fk_produto_pedidoItVenda` (`FKProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- dados.pedidovenda definition

CREATE TABLE `pedidovenda` (
  `NumPedido` int(11) NOT NULL AUTO_INCREMENT,
  `DataEmissao` date NOT NULL,
  `FkCLiente` int(11) NOT NULL,
  `ValorTotal` double NOT NULL,
  PRIMARY KEY (`NumPedido`),
  KEY `PedidoVendaFkCliente` (`FkCLiente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- dados.produto definition

CREATE TABLE `produto` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(250) NOT NULL,
  `PRECOVENDA` double NOT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- dados.cidade definition

CREATE TABLE `cidade` (
  `IDCIDADE` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRICAO` varchar(250) NOT NULL,
  `CODIGOIBGE` varchar(100) NOT NULL,
  `IDESTADO` int(11) NOT NULL,
  PRIMARY KEY (`IDCIDADE`),
  KEY `cidade_ibfk_1` (`IDESTADO`),
  CONSTRAINT `cidade_ibfk_1` FOREIGN KEY (`IDESTADO`) REFERENCES `estado` (`IDESTADO`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- dados.endereco definition

CREATE TABLE `endereco` (
  `IDENDERECO` int(11) NOT NULL AUTO_INCREMENT,
  `LOGRADOURO` varchar(250) NOT NULL,
  `NUMERO` varchar(10) NOT NULL,
  `BAIRRO` varchar(250) NOT NULL,
  `COMPLEMENTO` varchar(250) NOT NULL,
  `IDCIDADE` int(11) NOT NULL,
  PRIMARY KEY (`IDENDERECO`),
  KEY `endereco_ibfk_1` (`IDCIDADE`),
  CONSTRAINT `endereco_ibfk_1` FOREIGN KEY (`IDCIDADE`) REFERENCES `cidade` (`IDCIDADE`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- dados.pessoa definition

CREATE TABLE `pessoa` (
  `IDPESSOA` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRICAO` varchar(250) NOT NULL,
  `TIPO` int(11) NOT NULL,
  `CPFCNPJ` int(11) NOT NULL,
  `NOMEFANTAZIA` varchar(250) NOT NULL,
  `INSCESTADUAL` varchar(50) NOT NULL,
  `INSCMUNC` varchar(50) NOT NULL,
  `CNAE` varchar(50) NOT NULL,
  `IDENDERECOPRINCIPAL` int(11) NOT NULL,
  `IDCONTATO` int(11) NOT NULL,
  PRIMARY KEY (`IDPESSOA`),
  KEY `FK_PESSOA_ENDERECO` (`IDENDERECOPRINCIPAL`),
  KEY `FK_PESSOA_CONTATO` (`IDCONTATO`),
  CONSTRAINT `FK_PESSOA_CONTATO` FOREIGN KEY (`IDCONTATO`) REFERENCES `contato` (`IDCONTATO`),
  CONSTRAINT `FK_PESSOA_ENDERECO` FOREIGN KEY (`IDENDERECOPRINCIPAL`) REFERENCES `endereco` (`IDENDERECO`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- dados.funcionario definition

CREATE TABLE `funcionario` (
  `IDFUNCIONARIO` int(11) NOT NULL AUTO_INCREMENT,
  `DTADMISSAO` date NOT NULL,
  `DATADEMISSAO` date NOT NULL,
  `IDPESSOA` int(11) NOT NULL,
  `IDCARGO` int(11) NOT NULL,
  `PIS` varchar(50) NOT NULL,
  `CARGAHORARIA` double NOT NULL,
  `SALARIO` double NOT NULL,
  PRIMARY KEY (`IDFUNCIONARIO`),
  KEY `FK_FUNCIONARIO_PESSOA` (`IDPESSOA`),
  CONSTRAINT `FK_FUNCIONARIO_PESSOA` FOREIGN KEY (`IDPESSOA`) REFERENCES `pessoa` (`IDPESSOA`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- dados.usuario definition

CREATE TABLE `usuario` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN` text NOT NULL,
  `SENHA` text NOT NULL,
  `IDFUNCIONARIO` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `INDEXUSUARIO` (`LOGIN`) USING HASH,
  KEY `FK_USUARIO_FUNCIONARIO` (`IDFUNCIONARIO`),
  CONSTRAINT `FK_USUARIO_FUNCIONARIO` FOREIGN KEY (`IDFUNCIONARIO`) REFERENCES `funcionario` (`IDFUNCIONARIO`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;