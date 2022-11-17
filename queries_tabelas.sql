CREATE DATABASE oficina_mecanica;
USE oficina_mecanica;

CREATE TABLE Clientes (
  id int PRIMARY KEY IDENTITY(1,1),
  nome varchar(45) NOT NULL,
  cpf varchar(11) NOT NULL,
  telefone varchar(11) NOT NULL,
  email varchar(45),
  bairro varchar(45)
);

CREATE TABLE Veiculos (
  id int PRIMARY KEY IDENTITY(1,1),
  idCliente int NULL,
  atendimento enum('Conserto', 'Revisao Periodica'),
  placa varchar(10),
  modelo varchar(20),
  ano int(4),
  CONSTRAINT FK_Veiculos_Clientes FOREIGN KEY (idCliente) REFERENCES Clientes(id) ON DELETE SET NULL
);

CREATE TABLE OS (
  id int PRIMARY KEY IDENTITY(1,1),
  idVeiculo int,
  numero int(10),
  status_os enum('aberta', 'concluida'),
  descricao mediumtext,
  autorizacao enum('pendente', 'autorizado', 'negado'),
  data_emissao date,
  data_entrega date,
  valor_pecas_total float,
  valor_mdo_total float,
  valor_OS_total float,
  CONSTRAINT FK_OS_Veiculo FOREIGN KEY (idVeiculo) REFERENCES Veiculos(id) ON DELETE SET NULL
);

CREATE TABLE Mecanicos (
  id int PRIMARY KEY IDENTITY(1,1),
  codigo_mec varchar(10),
  nome varchar(45),
  especialidade enum('especialidadeA', 'especialidadeB', 'especialidadeC'),
  rua varchar(20),
  bairro varchar(20),
  numero_endereco varchar(5)
);


CREATE TABLE MaoDeObra (
  id int PRIMARY KEY IDENTITY(1,1),
  idMecanico int,
  tipo_trabalho varchar(45),
  valor float,
  CONSTRAINT FK_MaoDeObra_Mecanicos FOREIGN KEY (idMecanico) REFERENCES Mecanicos(id) ON DELETE SET NULL
);

CREATE TABLE Pecas (
  id int PRIMARY KEY IDENTITY(1,1),
  nome varchar(45),
  valor float
);

CREATE TABLE OSEquipe (
  idOS int,
  idMecanico int,
  PRIMARY KEY (idOS, idMecanico),
  CONSTRAINT FK_OSEquipe_OS FOREIGN KEY (idOS) REFERENCES OS(id) ON DELETE CASCADE,
  CONSTRAINT FK_OSEquipe_Mecanicos FOREIGN KEY (idMecanico) REFERENCES Mecanicos(id) ON DELETE CASCADE
);

CREATE TABLE OSMaoDeObra (
  idOS int,
  idMaodeObra int,
  PRIMARY KEY (idOS, idMaodeObra),
  CONSTRAINT FK_OSMaoDeObra_OS FOREIGN KEY (idOS) REFERENCES OS(id) ON DELETE CASCADE,
  CONSTRAINT FK_OSMaoDeObra_MaoDeObra FOREIGN KEY (idMaoDeObra) REFERENCES MaoDeObra(id) ON DELETE CASCADE,
);

CREATE TABLE OSPecas (
  idOS int,
  idPeca int,
  PRIMARY KEY (idOS, idPecas),
  CONSTRAINT FK_OSPecas_OS FOREIGN KEY (idOS) REFERENCES OS(id) ON DELETE CASCADE,
  CONSTRAINT FK_OSPecas_Pecas FOREIGN KEY (idPeca) REFERENCES Pecas(id) ON DELETE CASCADE,
  quantidade int
);



-- Tabela Clientes
INSERT INTO Clientes VALUES('João', '00100100101', '31900010001', 'emaildojoao@gmail.com', 'bairrodojoao');
INSERT INTO Clientes VALUES('Zé', '00200200202', '31900020002', 'emaildoze@gmail.com', 'bairrodoze');
INSERT INTO Clientes VALUES('Pedro', '00300300303', '31900030003', 'emaildopedro@gmail.com', 'bairrodpedro');
INSERT INTO Clientes VALUES('Lucas', '00400400404', '31900040004', 'emaildolucas@gmail.com', 'bairrodolucas');

-- Tabela Veiculos
INSERT INTO Veiculos VALUES(1,  'Conserto', 'PlacaCl1', 'fusca', '1970');
INSERT INTO Veiculos VALUES(1,  'Revisao Periodica', 'PlacaCl2', 'kombi', '1980');
INSERT INTO Veiculos VALUES(1,  'Conserto', 'PlacaCl3', 'gol', '1990');
INSERT INTO Veiculos VALUES(1,  'Conserto', 'PlacaCl4', 'palio', '2000');

-- Tabela OS
INSERT INTO OS VALUES(1,  '198', 'aberta', 'trocar peça motor', 'autorizado', , , 0.00, 0.00, 0.00);
INSERT INTO OS VALUES(2,  '199', 'aberta', 'trocar pneu', 'pendente', , , 0.00, 0.00, 0.00);
INSERT INTO OS VALUES(3,  '200', 'aberta', 'trocar peça motor', 'autorizado', , , 0.00, 0.00, 0.00);
INSERT INTO OS VALUES(4,  '201', 'aberta', 'trocar pneu', 'pendente', , , 0.00, 0.00, 0.00);

-- Tabela Mecanicos
INSERT INTO Mecanicos VALUES('MC1',  'Nome_Mecanico_1', 'especialidadeA', 'Rua_mc1', 'Bairro_mc2', '112');
INSERT INTO Mecanicos VALUES('MC2',  'Nome_Mecanico_2', 'especialidadeB', 'Rua_mc2', 'Bairro_mc2', '83');
INSERT INTO Mecanicos VALUES('MC3',  'Nome_Mecanico_3', 'especialidadeC', 'Rua_mc3', 'Bairro_mc3', '897');

-- Tabela MaoDeObra
INSERT INTO MaoDeObra VALUES(1,  'trocar_pneu', 50.00);
INSERT INTO MaoDeObra VALUES(2,  'trocar_peça_pesada', 100.00);
INSERT INTO MaoDeObra VALUES(2,  'trocar_peça_leve', 50.00);
INSERT INTO MaoDeObra VALUES(3,  'parte_eletrica', 90.00);

-- Tabela Pecas
INSERT INTO Pecas VALUES('pecaX', 70.00);
INSERT INTO Pecas VALUES('pecaY', 85.00);
INSERT INTO Pecas VALUES('pneu', 100.00);

-- Tabela OSEquipe
INSERT INTO OSEquipe VALUES(1, 2);
INSERT INTO OSEquipe VALUES(1, 3);
INSERT INTO OSEquipe VALUES(2, 1);
INSERT INTO OSEquipe VALUES(3, 2);
INSERT INTO OSEquipe VALUES(3, 3);
INSERT INTO OSEquipe VALUES(4, 1);


-- Tabela OSMaoDeObra
INSERT INTO OSMaoDeObra VALUES(1, 2);
INSERT INTO OSMaoDeObra VALUES(2, 1);
INSERT INTO OSMaoDeObra VALUES(3, 3);
INSERT INTO OSMaoDeObra VALUES(3, 4);
INSERT INTO OSMaoDeObra VALUES(4, 1);

-- Tabela OSPecas
INSERT INTO OSPecas VALUES(1, 1, 7);
INSERT INTO OSPecas VALUES(1, 2, 5);
INSERT INTO OSPecas VALUES(2, 3, 4);



SELECT * FROM Clientes


UPDATE Clientes
SET nome = 'José'
WHERE id = 2;


UPDATE OS SET data_emissao = GETDATE(),


SELECT * FROM Pecas
ORDER BY valor DESC 


SELECT 
  OS.numero
  OS.autorizacao
  OSEquipe.idMecanico
FROM
  OS
INNER JOIN OSEquipe ON OS.id = OSEquipe.idOS



