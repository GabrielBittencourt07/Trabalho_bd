CREATE SCHEMA UBER;

SET SEARCH_PATH = UBER;

CREATE TABLE USUARIO
(
    IDUsuario INT NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Sobrenome VARCHAR(50) NOT NULL,
    DataNascimento DATE NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    NumeroTelefone VARCHAR(20) NOT NULL UNIQUE,
    PRIMARY KEY (IDUsuario)
);

CREATE TABLE MOTORISTA
(
    IDMotorista INT NOT NULL,
    NotaMotorista DECIMAL(3,2) NOT NULL DEFAULT 5.00,
    FotoPerfil VARCHAR(255) NOT NULL,
    CNH VARCHAR(20) NOT NULL UNIQUE,
    CRLV VARCHAR(20) NOT NULL,
    RankingInterno VARCHAR(30) NOT NULL, -- Opções: 'Azul', 'Ouro', 'Platina', 'Diamante'
    PRIMARY KEY (IDMotorista),
    FOREIGN KEY (IDMotorista) REFERENCES USUARIO(IDUsuario)
);

CREATE TABLE PASSAGEIRO
(
    IDPassageiro INT NOT NULL,
    NotaPassageiro DECIMAL(3,2) NOT NULL DEFAULT 5.00,
    PRIMARY KEY (IDPassageiro),
    FOREIGN KEY (IDPassageiro) REFERENCES USUARIO(IDUsuario)
);

CREATE TABLE PAGAMENTO
(
    IDPagamento INT NOT NULL,
    StatusPagamento VARCHAR(30) NOT NULL, -- Opções: 'Pendente', 'Aprovado', 'Recusado', 'Estornado', 'Cancelado'
    Valor DECIMAL(10,2) NOT NULL,
    Metodo VARCHAR(50) NOT NULL, -- Opções: 'Pix', 'Cartão de Crédito', 'Cartão de Débito', 'Dinheiro', 'Voucher', 'Uber Cash', 'Apple Pay', 'Google Pay'
    PRIMARY KEY (IDPagamento)
);

CREATE TABLE MARCA
(
    IDMarca INT NOT NULL,
    NomeMarca VARCHAR(50) NOT NULL,
    PRIMARY KEY (IDMarca)
);

CREATE TABLE MODELO
(
    IDModelo INT NOT NULL,
    NomeModelo VARCHAR(50) NOT NULL,
    IDMarca INT NOT NULL,
    PRIMARY KEY (IDModelo),
    FOREIGN KEY (IDMarca) REFERENCES MARCA(IDMarca)
);


CREATE TABLE VEICULO
(
    IDVeiculo INT NOT NULL,
    Placa VARCHAR(10) NOT NULL UNIQUE,
    Cor VARCHAR(30) NOT NULL, -- Opções: 'Branco', 'Preto', 'Prata', 'Cinza', 'Vermelho', 'Azul', 'Amarelo', 'Verde', 'Outro'
    IDModelo INT NOT NULL,
    PRIMARY KEY (IDVeiculo),
    FOREIGN KEY (IDModelo) REFERENCES MODELO(IDModelo)
);

CREATE TABLE CARRO
(
    IDVeiculo INT NOT NULL,
    PRIMARY KEY (IDVeiculo),
    FOREIGN KEY (IDVeiculo) REFERENCES VEICULO(IDVeiculo)
);

CREATE TABLE MOTO
(
    IDVeiculo INT NOT NULL,
    PRIMARY KEY (IDVeiculo),
    FOREIGN KEY (IDVeiculo) REFERENCES VEICULO(IDVeiculo)
);

CREATE TABLE ESTADO
(
    IDEstado INT NOT NULL ,
    NomeEstado VARCHAR(50) NOT NULL,
    PRIMARY KEY (IDEstado)
);

CREATE TABLE CIDADE
(
    IDCidade INT NOT NULL,
    NomeCidade VARCHAR(100) NOT NULL,
    Moeda VARCHAR(3) NOT NULL, -- Opções (Foco Brasil): 'BRL'
    IDEstado INT NOT NULL,
    PRIMARY KEY (IDCidade),
    FOREIGN KEY (IDEstado) REFERENCES ESTADO(IDEstado)
);

CREATE TABLE CATEGORIA
(
    IDCategoria INT NOT NULL,
    NomeCategoria VARCHAR(50) NOT NULL, -- Opções: 'UberX', 'Comfort', 'Black', 'Uber Moto', 'Uber Flash Moto', 'Uber Flash'
    PrecoBase DECIMAL(10,2) NOT NULL,
    PrecoKM DECIMAL(10,2) NOT NULL,
    PrecoMinuto DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (IDCategoria)
);

CREATE TABLE SERVICO
(
    IDServico INT NOT NULL,
    DataHora TIMESTAMP NOT NULL,
    IDVeiculo INT NOT NULL,
    IDPagamento INT NOT NULL,
    IDCidade INT NOT NULL,
    IDMotorista INT NOT NULL,
    IDCategoria INT NOT NULL, 
    PRIMARY KEY (IDServico),
    FOREIGN KEY (IDVeiculo) REFERENCES VEICULO(IDVeiculo),
    FOREIGN KEY (IDPagamento) REFERENCES PAGAMENTO(IDPagamento),
    FOREIGN KEY (IDCidade) REFERENCES CIDADE(IDCidade),
    FOREIGN KEY (IDMotorista) REFERENCES MOTORISTA(IDMotorista),
    FOREIGN KEY (IDCategoria) REFERENCES CATEGORIA(IDCategoria)
);

CREATE TABLE CORRIDA
(
    IDServico INT NOT NULL,
    LocInicio VARCHAR(255) NOT NULL,
    LocFinal VARCHAR(255) NOT NULL,
    IDPassageiro INT NOT NULL,
    PRIMARY KEY (IDServico),
    FOREIGN KEY (IDPassageiro) REFERENCES PASSAGEIRO(IDPassageiro),
    FOREIGN KEY (IDServico) REFERENCES SERVICO(IDServico)
);

CREATE TABLE ENTREGA
(
    IDServico INT NOT NULL,
    NomeDestinatario VARCHAR(100) NOT NULL,
    LocColeta VARCHAR(255) NOT NULL,
    LocEntrega VARCHAR(255) NOT NULL,
    IDUsuario INT NOT NULL,
    PRIMARY KEY (IDServico),
    FOREIGN KEY (IDUsuario) REFERENCES USUARIO(IDUsuario),
    FOREIGN KEY (IDServico) REFERENCES SERVICO(IDServico)
);

CREATE TABLE RESERVACORRIDA
(
    IDReserva INT NOT NULL,
    DataHoraSaida TIMESTAMP NOT NULL,
    DataHoraChegada TIMESTAMP,
    LocalSaida VARCHAR(255) NOT NULL,
    LocalChegada VARCHAR(255) NOT NULL,
    StatusReserva VARCHAR(30) NOT NULL, -- Opções: 'Agendada', 'Em Andamento', 'Concluída', 'Cancelada'
    IDPassageiro INT NOT NULL,
    IDServico INT,
    PRIMARY KEY (IDReserva),
    FOREIGN KEY (IDServico) REFERENCES CORRIDA(IDServico),
    FOREIGN KEY (IDPassageiro) REFERENCES PASSAGEIRO(IDPassageiro)
);

CREATE TABLE CANCELAMENTO
(
    IDCancelamento INT NOT NULL,
    Motivo VARCHAR(255) NOT NULL,
    Responsavel VARCHAR(50) NOT NULL, -- Opções: 'Motorista', 'Passageiro', 'Sistema'
    Taxa DECIMAL(10,2) NOT NULL,
    IDServico INT NOT NULL,
    PRIMARY KEY (IDCancelamento),
    FOREIGN KEY (IDServico) REFERENCES SERVICO(IDServico)
);

CREATE TABLE AVALIACAO
(
    IDAvaliacao INT NOT NULL,
    TipoAvaliado VARCHAR(50) NOT NULL, -- Opções lógicas: 'Solicitante' (Passageiro/Remetente da entrega) ou 'Motorista' (Motorista/Entregador)
    NotaAvaliacao INT NOT NULL, -- Valores esperados: 1, 2, 3, 4, 5
    DescricaoAvaliacao TEXT,
    IDServico INT NOT NULL,
    PRIMARY KEY (IDAvaliacao),
    FOREIGN KEY (IDServico) REFERENCES SERVICO(IDServico)
);

CREATE TABLE CONDUZ
(
    IDMotorista INT NOT NULL,
    IDVeiculo INT NOT NULL,
    PRIMARY KEY (IDMotorista, IDVeiculo),
    FOREIGN KEY (IDMotorista) REFERENCES MOTORISTA(IDMotorista),
    FOREIGN KEY (IDVeiculo) REFERENCES VEICULO(IDVeiculo)
);