
SET SEARCH_PATH = UBER;

INSERT INTO uber.estado (idestado, nomeestado) VALUES 
(1, 'Rio de Janeiro'), 
(2, 'São Paulo'), 
(3, 'Minas Gerais'), 
(4, 'Bahia'), 
(5, 'Paraná');

INSERT INTO uber.cidade (idcidade, nomecidade, moeda, idestado) VALUES 
(1, 'Rio de Janeiro', 'BRL', 1), 
(2, 'Niterói', 'BRL', 1), 
(3, 'São Paulo', 'BRL', 2);

INSERT INTO uber.marca (idmarca, nomemarca) VALUES 
(1, 'Chevrolet'), 
(2, 'Volkswagen'), 
(3, 'Fiat'), 
(4, 'Toyota'), 
(6, 'Honda'), 
(12, 'Yamaha');

INSERT INTO uber.modelo (idmodelo, nomemodelo, idmarca) VALUES 
(1, 'Onix', 1), 
(4, 'Gol', 2), 
(7, 'Uno', 3), 
(10, 'Corolla', 4), 
(15, 'Civic', 6), 
(26, 'YBR 125', 12), 
(27, 'Factor 150', 12);

INSERT INTO uber.categoria (idcategoria, nomecategoria, precobase, precokm, precominuto) VALUES 
(1, 'UberX', 5.00, 1.80, 0.35), 
(2, 'Comfort', 6.50, 2.10, 0.42),
(3, 'Black', 9.00, 2.80, 0.55),
(4, 'Uber Moto', 3.00, 1.20, 0.20), 
(5, 'Uber Flash Moto', 3.50, 1.35, 0.22), 
(6, 'Uber Flash', 4.00, 1.50, 0.28);

INSERT INTO uber.usuario (idusuario, nome, sobrenome, datanascimento, email, numerotelefone) VALUES 
(1, 'Vinicius', 'Dias', '1991-10-08', 'dda-luz@example.com', '+55 (20) 05407-8220'),
(2, 'Fernanda', 'Santos', '1970-06-14', 'maria-laura@example.org', '+55 (10) 00753-6291'),
(3, 'Sabrina', 'Guerra', '1981-01-19', 'vieiranoah@example.net', '+55 (18) 31280-6763'),
(4, 'Pietra', 'Siqueira', '1963-02-24', 'mariada-paz@example.com', '+55 (46) 71226-2429'),
(5, 'Jade', 'Sampaio', '1964-07-09', 'njesus@example.net', '+55 (45) 36301-3481'),
(6, 'Eduardo', 'Freitas', '1980-01-27', 'gdas-neves@example.org', '+55 (78) 50261-1552'),
(7, 'Guilherme', 'Silveira', '1978-12-29', 'davi-lucas@example.net', '+55 (84) 43510-8975'),
(8, 'Henry', 'Freitas', '1956-09-05', 'jose-miguel71@example.com', '+55 (38) 28588-9602'),
(9, 'Rafael', 'Oliveira', '1965-08-03', 'britomaria@example.net', '+55 (52) 41852-9132'),
(10, 'Ana Vitória', 'Caldeira', '1991-02-10', 'mda-costa@example.net', '+55 (98) 90199-8025'),
(11, 'Daniela', 'Conceição', '1979-06-04', 'nviana@example.org', '+55 (37) 02012-1048'),
(12, 'Igor', 'Siqueira', '1985-04-17', 'joao-miguel@example.org', '+55 (62) 50800-1712'),
(13, 'Enzo', 'Pimenta', '1965-02-13', 'leaoester@example.com', '+55 (03) 28067-0124'),
(14, 'Sophia', 'Siqueira', '2005-01-07', 'joao-gui@example.org', '+55 (18) 14351-3103'),
(15, 'Yan', 'Rosa', '1990-08-10', 'yagoda@example.com', '+55 (00) 18211-7599'),
(16, 'Lorena', 'Fernandes', '1994-03-07', 'das-neveslaura@example.net', '+55 (93) 76776-7307'),
(17, 'Anna Liz', 'Cassiano', '1979-01-17', 'ana-ceci@example.net', '+55 (06) 06882-0252'),
(18, 'Ayla', 'Cunha', '2001-11-15', 'oliviamarques@example.net', '+55 (44) 25967-4229'),
(19, 'Emilly', 'Carvalho', '1994-10-18', 'camila23@example.org', '+55 (73) 91673-0404'),
(20, 'Gael', 'Cunha', '1966-08-04', 'ypinto@example.net', '+55 (82) 68331-2421'),
(21, 'Levi', 'Campos', '1996-03-10', 'gcassiano@example.com', '+55 (03) 63430-3831'),
(22, 'Pietra', 'Sousa', '1972-03-07', 'wsales@example.com', '+55 (19) 68432-6943'),
(23, 'Laura', 'Moraes', '1964-05-30', 'cardosoeduarda@example.org', '+55 (27) 02677-9980'),
(24, 'Laís', 'Pereira', '1974-02-01', 'juliana08@example.com', '+55 (77) 85902-3531'),
(25, 'Laís', 'Cavalcanti', '2005-09-11', 'vcavalcante@example.org', '+55 (06) 00619-1825');

INSERT INTO uber.veiculo (idveiculo, placa, cor, idmodelo) VALUES 
(1, 'UIY-4297', 'Preto', 1), (2, 'OMG-9032', 'Cinza', 4), (3, 'LRD-8432', 'Branco', 10), 
(4, 'WXQ-8405', 'Prata', 15), (5, 'OAX-2771', 'Amarelo', 7), (6, 'KQE-9995', 'Branco', 1),
(7, 'WTY-9805', 'Preto', 4), (8, 'DAE-3365', 'Cinza', 7), (9, 'RHW-3753', 'Cinza', 15), 
(10, 'KSC-9542', 'Branco', 1), (11, 'UXB-6711', 'Preto', 1),
(53, 'NTF-2498', 'Branco', 26), (54, 'GXA-2237', 'Cinza', 26), (55, 'OIL-0829', 'Preto', 26), 
(56, 'OGY-3009', 'Branco', 27), (57, 'TCM-2373', 'Prata', 27), (58, 'GOT-3788', 'Preto', 27);

INSERT INTO uber.carro (idveiculo) VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11);
INSERT INTO uber.moto (idveiculo) VALUES (53), (54), (55), (56), (57), (58);

INSERT INTO uber.motorista (idmotorista, notamotorista, fotoperfil, cnh, crlv, rankinginterno) VALUES 
(1, 4.88, 'url/1.jpg', '32483549475', '94206461183', 'Ouro'),
(4, 3.77, 'url/4.jpg', '96381048260', '64082706218', 'Azul'),
(6, 4.58, 'url/6.jpg', '25427521205', '47767270220', 'Azul'),
(10, 4.70, 'url/10.jpg', '91218312362', '73570098070', 'Azul'),
(12, 4.19, 'url/12.jpg', '09817812905', '45131021662', 'Ouro'),
(14, 4.83, 'url/14.jpg', '48092582291', '69758833713', 'Diamante'),
(16, 4.92, 'url/16.jpg', '91007412184', '59436787308', 'Diamante'),
(17, 4.32, 'url/17.jpg', '53955252242', '34416468898', 'Azul'),
(20, 4.37, 'url/20.jpg', '94365674500', '69962605973', 'Ouro'),
(22, 4.02, 'url/22.jpg', '91345778435', '82564544568', 'Ouro');

INSERT INTO uber.passageiro (idpassageiro, notapassageiro) VALUES 
(2, 4.80), 
(3, 4.50), 
(5, 4.90), 
(7, 4.89), 
(8, 4.21),
(9, 4.18), 
(11, 4.78), 
(13, 4.24), 
(15, 3.29), 
(18, 4.11), 
(19, 3.26), 
(21, 4.64), 
(23, 4.13), 
(24, 3.51), 
(25, 4.41);

INSERT INTO uber.conduz (idmotorista, idveiculo) VALUES 
(1, 1), 
(4, 2), 
(6, 3), 
(10, 4), 
(12, 53), 
(14, 54), 
(16, 55), 
(17, 5), 
(20, 56), 
(22, 57);


INSERT INTO uber.pagamento (idpagamento, statuspagamento, valor, metodo) VALUES 
(1, 'Aprovado', 27.65, 'Pix'), 
(2, 'Aprovado', 15.03, 'Cartão de Crédito'),
(3, 'Aprovado', 12.00, 'Cartão de Débito'), 
(4, 'Aprovado', 36.34, 'Uber Cash'),
(5, 'Aprovado', 55.41, 'Cartão de Débito'), 
(6, 'Aprovado', 22.33, 'Cartão de Crédito'),
(7, 'Aprovado', 51.27, 'Cartão de Crédito'), 
(8, 'Aprovado', 68.04, 'Pix'),
(9, 'Aprovado', 18.40, 'Cartão de Débito'), 
(10, 'Aprovado', 47.62, 'Cartão de Crédito'),
(11, 'Aprovado', 70.50, 'Apple Pay'), 
(12, 'Aprovado', 110.19, 'Cartão de Crédito'),
(13, 'Aprovado', 42.75, 'Pix'), 
(14, 'Aprovado', 22.68, 'Apple Pay'),
(15, 'Aprovado', 97.51, 'Pix'), 
(16, 'Aprovado', 69.29, 'Uber Cash'),
(17, 'Aprovado', 37.84, 'Cartão de Crédito'), 
(18, 'Aprovado', 25.39, 'Dinheiro'),
(19, 'Aprovado', 43.67, 'Cartão de Crédito'), 
(20, 'Aprovado', 18.00, 'Apple Pay'),

(31, 'Recusado', 66.33, 'Cartão de Crédito'), (32, 'Pendente', 0.00, 'Apple Pay'),
(33, 'Recusado', 25.39, 'Dinheiro'), (34, 'Pendente', 0.00, 'Pix'), 
(35, 'Cancelado', 0.00, 'Cartão de Débito'), (36, 'Cancelado', 0.00, 'Uber Cash'),
(37, 'Recusado', 58.99, 'Cartão de Crédito'), (38, 'Pendente', 35.50, 'Pix');

INSERT INTO uber.servico (idservico, datahora, idveiculo, idpagamento, idcidade, idmotorista, idcategoria) VALUES 
(1, '2026-01-10 08:30:00', 1, 1, 1, 1, 1),
(2, '2026-01-11 09:15:00', 2, 2, 1, 4, 1),
(3, '2026-01-12 14:20:00', 3, 3, 1, 6, 3),
(4, '2026-01-13 18:45:00', 53, 4, 1, 12, 4),
(5, '2026-01-14 20:10:00', 54, 5, 1, 14, 4),
(6, '2026-01-15 07:30:00', 4, 6, 1, 10, 2),
(7, '2026-01-16 23:28:00', 5, 7, 1, 17, 1),
(8, '2026-01-17 05:34:00', 55, 8, 1, 16, 4),
(9, '2026-01-18 10:28:00', 1, 9, 1, 1, 1),
(10, '2026-01-19 12:19:00', 2, 10, 1, 4, 1),
(11, '2026-01-20 16:40:00', 3, 11, 1, 6, 3),
(12, '2026-01-21 21:05:00', 56, 12, 1, 20, 4),
(13, '2026-01-22 08:50:00', 4, 13, 1, 10, 2),
(14, '2026-01-23 11:22:00', 5, 14, 1, 17, 1),
(15, '2026-01-24 14:00:00', 57, 15, 1, 22, 4),

(16, '2026-02-01 10:05:00', 54, 16, 1, 14, 5),
(17, '2026-02-02 10:31:00', 55, 17, 1, 16, 5),
(18, '2026-02-03 14:37:00', 3, 18, 1, 6, 6),
(19, '2026-02-04 16:12:00', 56, 19, 1, 20, 5),
(20, '2026-02-05 09:08:00', 4, 20, 1, 10, 6),

(31, '2026-03-01 02:26:00', 3, 31, 1, 6, 3),
(32, '2026-03-02 19:09:00', 56, 32, 1, 20, 4),
(33, '2026-03-03 10:05:00', 4, 33, 1, 10, 2),
(34, '2026-03-04 04:32:00', 5, 34, 1, 17, 1),
(35, '2026-03-05 06:00:00', 57, 35, 1, 22, 4),
(36, '2026-03-06 17:12:00', 1, 36, 1, 1, 1),
(37, '2026-03-07 04:42:00', 53, 37, 1, 12, 4),
(38, '2026-03-08 01:00:00', 2, 38, 1, 4, 1);


INSERT INTO uber.corrida (idservico, locinicio, locfinal, idpassageiro) VALUES 
(1, 'Av. Atlântica, 1500 - Copacabana', 'Av. Borges de Medeiros, 1424 - Lagoa', 2),
(2, 'Estrada do Portela, 500 - Madureira', 'Av. das Américas, 4200 - Barra da Tijuca', 3),
(3, 'Rua Figueiredo Magalhães, 30 - Copacabana', 'Av. Delfim Moreira, 900 - Leblon', 5),
(4, 'Av. Maracanã, 300 - Tijuca', 'Av. das Américas, 4200 - Barra da Tijuca', 7),
(5, 'Rua Almirante Alexandrino, 100 - Santa Teresa', 'Av. Delfim Moreira, 900 - Leblon', 8),
(6, 'Praça XV de Novembro, s/n - Centro', 'Av. das Américas, 4200 - Barra da Tijuca', 9),
(7, 'Av. Borges de Medeiros, 1424 - Lagoa', 'Rua Visconde de Pirajá, 200 - Ipanema', 11),
(8, 'Rua Voluntários da Pátria, 50 - Botafogo', 'Av. Atlântica, 1500 - Copacabana', 13),
(9, 'Av. Niemeyer, 200 - Vidigal', 'Av. Delfim Moreira, 900 - Leblon', 15),
(10, 'Estrada do Monteiro, 900 - Campo Grande', 'Rua Voluntários da Pátria, 50 - Botafogo', 19),
(11, 'Rua General Urquiza, 87 - Leblon', 'Av. Borges de Medeiros, 1424 - Lagoa', 21),
(12, 'Praça XV de Novembro, s/n - Centro', 'Rua Voluntários da Pátria, 50 - Botafogo', 23),
(13, 'Av. Niemeyer, 200 - Vidigal', 'Av. Atlântica, 1500 - Copacabana', 24),
(14, 'Estrada do Portela, 500 - Madureira', 'Rua Barata Ribeiro, 370 - Copacabana', 25),
(15, 'Rua Figueiredo Magalhães, 30 - Copacabana', 'Rua Almirante Alexandrino, 100 - Santa Teresa', 2);

INSERT INTO uber.reservacorrida (idreserva, datahorasaida, datahorachegada, localsaida, localchegada, statusreserva, idpassageiro, idservico) VALUES 
(1, '2026-01-10 08:30:00', '2026-01-10 09:16:00', 'Av. Atlântica, 1500 - Copacabana', 'Av. Borges de Medeiros, 1424 - Lagoa', 'Concluída', 2, 1),
(2, '2026-01-15 07:30:00', '2026-01-15 08:25:00', 'Praça XV de Novembro, s/n - Centro', 'Av. das Américas, 4200 - Barra da Tijuca', 'Concluída', 9, 6),
(3, '2026-01-18 10:28:00', '2026-01-18 11:15:00', 'Av. Niemeyer, 200 - Vidigal', 'Av. Delfim Moreira, 900 - Leblon', 'Concluída', 15, 9);

INSERT INTO uber.entrega (idservico, nomedestinatario, loccoleta, locentrega, idusuario) VALUES 
(16, 'Ana Vitória Fonseca', 'Rua Barata Ribeiro, 370 - Copacabana', 'Av. Maracanã, 300 - Tijuca', 2),
(17, 'Kaique Pinto', 'Estrada do Monteiro, 900 - Campo Grande', 'Av. Borges de Medeiros, 1424 - Lagoa', 3),
(18, 'Yuri da Costa', 'Rua Voluntários da Pátria, 50 - Botafogo', 'Estrada do Monteiro, 900 - Campo Grande', 5),
(19, 'Luísa Cassiano', 'Rua Figueiredo Magalhães, 30 - Copacabana', 'Av. Maracanã, 300 - Tijuca', 7),
(20, 'Maysa Camargo', 'Av. das Américas, 4200 - Barra da Tijuca', 'Estrada do Portela, 500 - Madureira', 8);

INSERT INTO uber.cancelamento (idcancelamento, motivo, responsavel, taxa, idservico) VALUES 
(1, 'Pagamento não autorizado', 'Passageiro', 0.00, 31),
(2, 'Tempo de espera excedido pelo passageiro', 'Motorista', 5.00, 32),
(3, 'Endereço de origem incorreto', 'Motorista', 7.50, 33),
(4, 'Motorista cancelou por motivo pessoal', 'Motorista', 10.00, 34),
(5, 'Passageiro solicitou cancelamento voluntário', 'Passageiro', 7.50, 35),
(6, 'Pagamento não autorizado', 'Passageiro', 5.00, 36),
(7, 'Motorista cancelou por motivo pessoal', 'Passageiro', 0.00, 37),
(8, 'Passageiro não encontrado no local combinado', 'Passageiro', 5.00, 38);

-- 7. Avaliações (Fechando o ciclo dos serviços concluídos)
INSERT INTO uber.avaliacao (idavaliacao, tipoavaliado, notaavaliacao, descricaoavaliacao, idservico) VALUES 
(1, 'Solicitante', 5, 'Carro impecável.', 1),
(2, 'Motorista', 5, 'Passageiro pontual.', 1),
(3, 'Solicitante', 5, 'Muito profissional, recomendo!', 2),
(4, 'Motorista', 4, 'Tudo ok.', 2),
(5, 'Solicitante', 4, 'Viagem tranquila, trânsito na Barra.', 4),
(6, 'Motorista', 5, 'Ótimo passageiro!', 4),
(7, 'Solicitante', 3, 'O motorista dirigia um pouco rápido demais.', 6),
(8, 'Solicitante', 5, 'Entrega chegou intacta!', 16),
(9, 'Motorista', 5, 'O pacote estava bem embalado.', 16),
(10, 'Solicitante', 4, 'Boa corrida, recomendo.', 10),
(11, 'Motorista', 5, NULL, 10),
(12, 'Solicitante', 5, 'Entrega super rápida para Campo Grande.', 18),
(13, 'Motorista', 5, 'Tranquilo de encontrar o local.', 18),
(14, 'Solicitante', 4, 'Motorista simpático.', 15),
(15, 'Motorista', 4, NULL, 15);