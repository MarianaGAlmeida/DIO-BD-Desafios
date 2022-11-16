CREATE TABLE cliente (
  idCliente INT PRIMARY KEY,
  nome VARCHAR(45),
  cpf VARCHAR(11),
  telefono VARCHAR(11),
  email VARCHAR(45),
  bairro VARCHAR(45),

);

CREATE TABLE veiculo (
  idVeiculo INT PRIMARY KEY,
  atendimento VARCHAR(10),
  placa VARCHAR(10),
  modelo VARCHAR(20),
  ano SMALLINT(4)
  FOREIGN KEY(cliente_idCliente) REFERENCES cliente(idCliente) ON DELETE SET NULL
);


CREATE TABLE os (
  idOS INT PRIMARY KEY,
  numero INT(10),
  status VARCHAR(10),
  descricao MEDIUMTEXT
  autorizacao ENUM()
  data_emissao DATE,
  data_entrega DATE,
  valor_pecas_total FLOAT,
  valor_mdo_total FLOAT,
  valor_OS_total FLOAT,
  FOREIGN KEY(veiculo_idVeiculo) REFERENCES veiculo(idVeiculo) ON DELETE SET NULL
  FOREIGN KEY(veiculo_cliente_idCliente) REFERENCES veiculo(cliente_idCliente) ON DELETE SET NULL
);


CREATE TABLE mecanicos (
  idMecanicos INT PRIMARY KEY,
  codigo_mec VARCHAR(45),
  nome VARCHAR(45),
  especialidade ENUM(),
  endereco VARCHAR(45),
);


CREATE TABLE maodeobra (
  idMaodeObra INT PRIMARY KEY,
  FOREIGN KEY(mecanicos_idMecanicos) REFERENCES mecanicos(idMecanicos) ON DELETE SET NULL
  trabalho VARCHAR(45),
  valor FLOAT,
);

CREATE TABLE pecas (
  idPecas INT PRIMARY KEY,
  nome VARCHAR(45),
  valor FLOAT,
);

CREATE TABLE OSEquipe (
  os_idOS INT,
  mecanicos_idMecanicos INT,
  PRIMARY KEY(os_idOS, mecanicos_idMecanicos),
  FOREIGN KEY(os_idOS) REFERENCES os(idOS) ON DELETE CASCADE,
  FOREIGN KEY(mecanicos_idMecanicos) REFERENCES mecanicos(idMecanicos) ON DELETE CASCADE
);

CREATE TABLE oshasmdo (
  os_idOS INT,
  mecanicos_idMecanicos INT,
  PRIMARY KEY(os_idOS, mecanicos_idMecanicos),
  FOREIGN KEY(os_idOS) REFERENCES os(idOS) ON DELETE CASCADE,
  FOREIGN KEY(mecanicos_idMecanicos) REFERENCES mecanicos(idMecanicos) ON DELETE CASCADE
);

CREATE TABLE oshaspecas (
  os_idOS INT,
  mecanicos_idMecanicos INT,
  PRIMARY KEY(os_idOS, mecanicos_idMecanicos),
  FOREIGN KEY(os_idOS) REFERENCES os(idOS) ON DELETE CASCADE,
  FOREIGN KEY(mecanicos_idMecanicos) REFERENCES mecanicos(idMecanicos) ON DELETE CASCADE
);



-- Tabela Cliente
INSERT INTO cliente VALUES(2, 'João', '000.111.222-33', '(31)99999-9999', 'emaildojoao@gmail.com', 'bairrodojoao');
INSERT INTO cliente VALUES(3, 'Zé', '000.123.456-78', '(31)98888-9999', 'emaildoze@gmail.com', 'bairrodoze');

UPDATE cliente
SET nome = 'José'
WHERE idCliente = 3;


-- ALTER TABLE



