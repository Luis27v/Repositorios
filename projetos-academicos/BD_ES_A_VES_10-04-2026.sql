CREATE TABLE atendimento (
  id_atendimento INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  data_hora DATETIME NULL,
  observacoes CHAR(99) NULL,
  PRIMARY KEY(id_atendimento)
);

CREATE TABLE cliente (
  id_cliente INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  registro_entrada_saida_id_registro INT NOT NULL,
  veiculo_id_veiculo INTEGER UNSIGNED NOT NULL,
  nome CHAR(99) NULL,
  cpf CHAR(11) NULL,
  telefone CHAR(11) NULL,
  email CHAR(99) NULL,
  endereco CHAR(99) NULL,
  PRIMARY KEY(id_cliente),
  INDEX cliente_FKIndex1(veiculo_id_veiculo),
  INDEX cliente_FKIndex2(registro_entrada_saida_id_registro)
);

CREATE TABLE estacionamento (
  id_estacionamento INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome CHAR(99) NULL,
  endereco CHAR(99) NULL,
  telefone CHAR(11) NULL,
  total_vagas INT NULL,
  PRIMARY KEY(id_estacionamento)
);

CREATE TABLE funcionario (
  id_funcionario INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  atendimento_id_atendimento INTEGER UNSIGNED NOT NULL,
  nome CHAR(99) NULL,
  cargo INTEGER UNSIGNED NULL,
  telefone CHAR(11) NULL,
  email CHAR(99) NULL,
  login CHAR(99) NULL,
  senha CHAR(99) NULL,
  PRIMARY KEY(id_funcionario),
  INDEX funcionario_FKIndex1(atendimento_id_atendimento)
);

CREATE TABLE pagamento (
  id_pagamento INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  registro_entrada_saida_id_registro INT NOT NULL,
  data_pagamento DATETIME NULL,
  valor INTEGER UNSIGNED NULL,
  forma_pagamento INTEGER UNSIGNED NULL,
  status_2 INTEGER UNSIGNED NULL,
  PRIMARY KEY(id_pagamento),
  INDEX pagamento_FKIndex1(registro_entrada_saida_id_registro)
);

CREATE TABLE registro_entrada_saida (
  id_registro INT NOT NULL AUTO_INCREMENT,
  veiculo_id_veiculo INTEGER UNSIGNED NOT NULL,
  atendimento_id_atendimento INTEGER UNSIGNED NOT NULL,
  datahr_entrada DATETIME NULL,
  datahr_saida DATETIME NULL,
  valor_total INTEGER UNSIGNED NULL,
  status_2 INT NULL,
  PRIMARY KEY(id_registro),
  INDEX registro_entrada_saida_FKIndex1(atendimento_id_atendimento),
  INDEX registro_entrada_saida_FKIndex2(veiculo_id_veiculo)
);

CREATE TABLE vaga (
  id_vaga INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  estacionamento_id_estacionamento INTEGER UNSIGNED NOT NULL,
  registro_entrada_saida_id_registro INT NOT NULL,
  numero INT NULL,
  tipo INTEGER UNSIGNED NULL,
  status_2 INTEGER UNSIGNED NULL,
  PRIMARY KEY(id_vaga),
  INDEX vaga_FKIndex1(registro_entrada_saida_id_registro),
  INDEX vaga_FKIndex2(estacionamento_id_estacionamento)
);

CREATE TABLE veiculo (
  id_veiculo INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  placa CHAR(7) NULL,
  modelo CHAR(99) NULL,
  cor CHAR NULL,
  PRIMARY KEY(id_veiculo)
);


