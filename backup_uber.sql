--
-- PostgreSQL database dump
--

\restrict fA2blg32llyxR5upqa8fqrB2tQSs8vuN0rLk05jg6fkxUSYY4GC5am9oVwf7LDn

-- Dumped from database version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: uber; Type: SCHEMA; Schema: -; Owner: vscode
--

CREATE SCHEMA uber;


ALTER SCHEMA uber OWNER TO vscode;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: avaliacao; Type: TABLE; Schema: uber; Owner: vscode
--

CREATE TABLE uber.avaliacao (
    idavaliacao integer NOT NULL,
    tipoavaliado character varying(50) NOT NULL,
    notaavaliacao integer NOT NULL,
    descricaoavaliacao text,
    idservico integer NOT NULL
);


ALTER TABLE uber.avaliacao OWNER TO vscode;

--
-- Name: cancelamento; Type: TABLE; Schema: uber; Owner: vscode
--

CREATE TABLE uber.cancelamento (
    idcancelamento integer NOT NULL,
    motivo character varying(255) NOT NULL,
    responsavel character varying(50) NOT NULL,
    taxa numeric(10,2) NOT NULL,
    idservico integer NOT NULL
);


ALTER TABLE uber.cancelamento OWNER TO vscode;

--
-- Name: carro; Type: TABLE; Schema: uber; Owner: vscode
--

CREATE TABLE uber.carro (
    idveiculo integer NOT NULL
);


ALTER TABLE uber.carro OWNER TO vscode;

--
-- Name: categoria; Type: TABLE; Schema: uber; Owner: vscode
--

CREATE TABLE uber.categoria (
    idcategoria integer NOT NULL,
    nomecategoria character varying(50) NOT NULL,
    precobase numeric(10,2) NOT NULL,
    precokm numeric(10,2) NOT NULL,
    precominuto numeric(10,2) NOT NULL
);


ALTER TABLE uber.categoria OWNER TO vscode;

--
-- Name: cidade; Type: TABLE; Schema: uber; Owner: vscode
--

CREATE TABLE uber.cidade (
    idcidade integer NOT NULL,
    nomecidade character varying(100) NOT NULL,
    moeda character varying(3) NOT NULL,
    idestado integer NOT NULL
);


ALTER TABLE uber.cidade OWNER TO vscode;

--
-- Name: conduz; Type: TABLE; Schema: uber; Owner: vscode
--

CREATE TABLE uber.conduz (
    idmotorista integer NOT NULL,
    idveiculo integer NOT NULL
);


ALTER TABLE uber.conduz OWNER TO vscode;

--
-- Name: corrida; Type: TABLE; Schema: uber; Owner: vscode
--

CREATE TABLE uber.corrida (
    idservico integer NOT NULL,
    locinicio character varying(255) NOT NULL,
    locfinal character varying(255) NOT NULL,
    idpassageiro integer NOT NULL
);


ALTER TABLE uber.corrida OWNER TO vscode;

--
-- Name: entrega; Type: TABLE; Schema: uber; Owner: vscode
--

CREATE TABLE uber.entrega (
    idservico integer NOT NULL,
    nomedestinatario character varying(100) NOT NULL,
    loccoleta character varying(255) NOT NULL,
    locentrega character varying(255) NOT NULL,
    idusuario integer NOT NULL
);


ALTER TABLE uber.entrega OWNER TO vscode;

--
-- Name: estado; Type: TABLE; Schema: uber; Owner: vscode
--

CREATE TABLE uber.estado (
    idestado integer NOT NULL,
    nomeestado character varying(50) NOT NULL
);


ALTER TABLE uber.estado OWNER TO vscode;

--
-- Name: marca; Type: TABLE; Schema: uber; Owner: vscode
--

CREATE TABLE uber.marca (
    idmarca integer NOT NULL,
    nomemarca character varying(50) NOT NULL
);


ALTER TABLE uber.marca OWNER TO vscode;

--
-- Name: modelo; Type: TABLE; Schema: uber; Owner: vscode
--

CREATE TABLE uber.modelo (
    idmodelo integer NOT NULL,
    nomemodelo character varying(50) NOT NULL,
    idmarca integer NOT NULL
);


ALTER TABLE uber.modelo OWNER TO vscode;

--
-- Name: moto; Type: TABLE; Schema: uber; Owner: vscode
--

CREATE TABLE uber.moto (
    idveiculo integer NOT NULL
);


ALTER TABLE uber.moto OWNER TO vscode;

--
-- Name: motorista; Type: TABLE; Schema: uber; Owner: vscode
--

CREATE TABLE uber.motorista (
    idmotorista integer NOT NULL,
    notamotorista numeric(3,2) DEFAULT 5.00 NOT NULL,
    fotoperfil character varying(255) NOT NULL,
    cnh character varying(20) NOT NULL,
    crlv character varying(20) NOT NULL,
    rankinginterno character varying(30) NOT NULL
);


ALTER TABLE uber.motorista OWNER TO vscode;

--
-- Name: pagamento; Type: TABLE; Schema: uber; Owner: vscode
--

CREATE TABLE uber.pagamento (
    idpagamento integer NOT NULL,
    statuspagamento character varying(30) NOT NULL,
    valor numeric(10,2) NOT NULL,
    metodo character varying(50) NOT NULL
);


ALTER TABLE uber.pagamento OWNER TO vscode;

--
-- Name: passageiro; Type: TABLE; Schema: uber; Owner: vscode
--

CREATE TABLE uber.passageiro (
    idpassageiro integer NOT NULL,
    notapassageiro numeric(3,2) DEFAULT 5.00 NOT NULL
);


ALTER TABLE uber.passageiro OWNER TO vscode;

--
-- Name: reservacorrida; Type: TABLE; Schema: uber; Owner: vscode
--

CREATE TABLE uber.reservacorrida (
    idreserva integer NOT NULL,
    datahorasaida timestamp without time zone NOT NULL,
    datahorachegada timestamp without time zone,
    localsaida character varying(255) NOT NULL,
    localchegada character varying(255) NOT NULL,
    statusreserva character varying(30) NOT NULL,
    idpassageiro integer NOT NULL,
    idservico integer
);


ALTER TABLE uber.reservacorrida OWNER TO vscode;

--
-- Name: servico; Type: TABLE; Schema: uber; Owner: vscode
--

CREATE TABLE uber.servico (
    idservico integer NOT NULL,
    datahora timestamp without time zone NOT NULL,
    idveiculo integer NOT NULL,
    idpagamento integer NOT NULL,
    idcidade integer NOT NULL,
    idmotorista integer NOT NULL,
    idcategoria integer NOT NULL
);


ALTER TABLE uber.servico OWNER TO vscode;

--
-- Name: usuario; Type: TABLE; Schema: uber; Owner: vscode
--

CREATE TABLE uber.usuario (
    idusuario integer NOT NULL,
    nome character varying(50) NOT NULL,
    sobrenome character varying(50) NOT NULL,
    datanascimento date NOT NULL,
    email character varying(100) NOT NULL,
    numerotelefone character varying(20) NOT NULL
);


ALTER TABLE uber.usuario OWNER TO vscode;

--
-- Name: veiculo; Type: TABLE; Schema: uber; Owner: vscode
--

CREATE TABLE uber.veiculo (
    idveiculo integer NOT NULL,
    placa character varying(10) NOT NULL,
    cor character varying(30) NOT NULL,
    idmodelo integer NOT NULL
);


ALTER TABLE uber.veiculo OWNER TO vscode;

--
-- Data for Name: avaliacao; Type: TABLE DATA; Schema: uber; Owner: vscode
--

COPY uber.avaliacao (idavaliacao, tipoavaliado, notaavaliacao, descricaoavaliacao, idservico) FROM stdin;
1	Solicitante	5	Carro impecável.	1
2	Motorista	5	Passageiro pontual.	1
3	Solicitante	5	Muito profissional, recomendo!	2
4	Motorista	4	Tudo ok.	2
5	Solicitante	4	Viagem tranquila, trânsito na Barra.	4
6	Motorista	5	Ótimo passageiro!	4
7	Solicitante	3	O motorista dirigia um pouco rápido demais.	6
8	Solicitante	5	Entrega chegou intacta!	16
9	Motorista	5	O pacote estava bem embalado.	16
10	Solicitante	4	Boa corrida, recomendo.	10
11	Motorista	5	\N	10
12	Solicitante	5	Entrega super rápida para Campo Grande.	18
13	Motorista	5	Tranquilo de encontrar o local.	18
14	Solicitante	4	Motorista simpático.	15
15	Motorista	4	\N	15
\.


--
-- Data for Name: cancelamento; Type: TABLE DATA; Schema: uber; Owner: vscode
--

COPY uber.cancelamento (idcancelamento, motivo, responsavel, taxa, idservico) FROM stdin;
1	Pagamento não autorizado	Passageiro	0.00	31
2	Tempo de espera excedido pelo passageiro	Motorista	5.00	32
3	Endereço de origem incorreto	Motorista	7.50	33
4	Motorista cancelou por motivo pessoal	Motorista	10.00	34
5	Passageiro solicitou cancelamento voluntário	Passageiro	7.50	35
6	Pagamento não autorizado	Passageiro	5.00	36
7	Motorista cancelou por motivo pessoal	Passageiro	0.00	37
8	Passageiro não encontrado no local combinado	Passageiro	5.00	38
\.


--
-- Data for Name: carro; Type: TABLE DATA; Schema: uber; Owner: vscode
--

COPY uber.carro (idveiculo) FROM stdin;
1
2
3
4
5
6
7
8
9
10
11
\.


--
-- Data for Name: categoria; Type: TABLE DATA; Schema: uber; Owner: vscode
--

COPY uber.categoria (idcategoria, nomecategoria, precobase, precokm, precominuto) FROM stdin;
1	UberX	5.00	1.80	0.35
2	Comfort	6.50	2.10	0.42
3	Black	9.00	2.80	0.55
4	Uber Moto	3.00	1.20	0.20
5	Uber Flash Moto	3.50	1.35	0.22
6	Uber Flash	4.00	1.50	0.28
\.


--
-- Data for Name: cidade; Type: TABLE DATA; Schema: uber; Owner: vscode
--

COPY uber.cidade (idcidade, nomecidade, moeda, idestado) FROM stdin;
1	Rio de Janeiro	BRL	1
2	Niterói	BRL	1
3	São Paulo	BRL	2
\.


--
-- Data for Name: conduz; Type: TABLE DATA; Schema: uber; Owner: vscode
--

COPY uber.conduz (idmotorista, idveiculo) FROM stdin;
1	1
4	2
6	3
10	4
12	53
14	54
16	55
17	5
20	56
22	57
\.


--
-- Data for Name: corrida; Type: TABLE DATA; Schema: uber; Owner: vscode
--

COPY uber.corrida (idservico, locinicio, locfinal, idpassageiro) FROM stdin;
1	Av. Atlântica, 1500 - Copacabana	Av. Borges de Medeiros, 1424 - Lagoa	2
2	Estrada do Portela, 500 - Madureira	Av. das Américas, 4200 - Barra da Tijuca	3
3	Rua Figueiredo Magalhães, 30 - Copacabana	Av. Delfim Moreira, 900 - Leblon	5
4	Av. Maracanã, 300 - Tijuca	Av. das Américas, 4200 - Barra da Tijuca	7
5	Rua Almirante Alexandrino, 100 - Santa Teresa	Av. Delfim Moreira, 900 - Leblon	8
6	Praça XV de Novembro, s/n - Centro	Av. das Américas, 4200 - Barra da Tijuca	9
7	Av. Borges de Medeiros, 1424 - Lagoa	Rua Visconde de Pirajá, 200 - Ipanema	11
8	Rua Voluntários da Pátria, 50 - Botafogo	Av. Atlântica, 1500 - Copacabana	13
9	Av. Niemeyer, 200 - Vidigal	Av. Delfim Moreira, 900 - Leblon	15
10	Estrada do Monteiro, 900 - Campo Grande	Rua Voluntários da Pátria, 50 - Botafogo	19
11	Rua General Urquiza, 87 - Leblon	Av. Borges de Medeiros, 1424 - Lagoa	21
12	Praça XV de Novembro, s/n - Centro	Rua Voluntários da Pátria, 50 - Botafogo	23
13	Av. Niemeyer, 200 - Vidigal	Av. Atlântica, 1500 - Copacabana	24
14	Estrada do Portela, 500 - Madureira	Rua Barata Ribeiro, 370 - Copacabana	25
15	Rua Figueiredo Magalhães, 30 - Copacabana	Rua Almirante Alexandrino, 100 - Santa Teresa	2
\.


--
-- Data for Name: entrega; Type: TABLE DATA; Schema: uber; Owner: vscode
--

COPY uber.entrega (idservico, nomedestinatario, loccoleta, locentrega, idusuario) FROM stdin;
16	Ana Vitória Fonseca	Rua Barata Ribeiro, 370 - Copacabana	Av. Maracanã, 300 - Tijuca	2
17	Kaique Pinto	Estrada do Monteiro, 900 - Campo Grande	Av. Borges de Medeiros, 1424 - Lagoa	3
18	Yuri da Costa	Rua Voluntários da Pátria, 50 - Botafogo	Estrada do Monteiro, 900 - Campo Grande	5
19	Luísa Cassiano	Rua Figueiredo Magalhães, 30 - Copacabana	Av. Maracanã, 300 - Tijuca	7
20	Maysa Camargo	Av. das Américas, 4200 - Barra da Tijuca	Estrada do Portela, 500 - Madureira	8
\.


--
-- Data for Name: estado; Type: TABLE DATA; Schema: uber; Owner: vscode
--

COPY uber.estado (idestado, nomeestado) FROM stdin;
1	Rio de Janeiro
2	São Paulo
3	Minas Gerais
4	Bahia
5	Paraná
\.


--
-- Data for Name: marca; Type: TABLE DATA; Schema: uber; Owner: vscode
--

COPY uber.marca (idmarca, nomemarca) FROM stdin;
1	Chevrolet
2	Volkswagen
3	Fiat
4	Toyota
6	Honda
12	Yamaha
\.


--
-- Data for Name: modelo; Type: TABLE DATA; Schema: uber; Owner: vscode
--

COPY uber.modelo (idmodelo, nomemodelo, idmarca) FROM stdin;
1	Onix	1
4	Gol	2
7	Uno	3
10	Corolla	4
15	Civic	6
26	YBR 125	12
27	Factor 150	12
\.


--
-- Data for Name: moto; Type: TABLE DATA; Schema: uber; Owner: vscode
--

COPY uber.moto (idveiculo) FROM stdin;
53
54
55
56
57
58
\.


--
-- Data for Name: motorista; Type: TABLE DATA; Schema: uber; Owner: vscode
--

COPY uber.motorista (idmotorista, notamotorista, fotoperfil, cnh, crlv, rankinginterno) FROM stdin;
1	4.88	url/1.jpg	32483549475	94206461183	Ouro
4	3.77	url/4.jpg	96381048260	64082706218	Azul
6	4.58	url/6.jpg	25427521205	47767270220	Azul
10	4.70	url/10.jpg	91218312362	73570098070	Azul
12	4.19	url/12.jpg	09817812905	45131021662	Ouro
14	4.83	url/14.jpg	48092582291	69758833713	Diamante
16	4.92	url/16.jpg	91007412184	59436787308	Diamante
17	4.32	url/17.jpg	53955252242	34416468898	Azul
20	4.37	url/20.jpg	94365674500	69962605973	Ouro
22	4.02	url/22.jpg	91345778435	82564544568	Ouro
\.


--
-- Data for Name: pagamento; Type: TABLE DATA; Schema: uber; Owner: vscode
--

COPY uber.pagamento (idpagamento, statuspagamento, valor, metodo) FROM stdin;
1	Aprovado	27.65	Pix
2	Aprovado	15.03	Cartão de Crédito
3	Aprovado	12.00	Cartão de Débito
4	Aprovado	36.34	Uber Cash
5	Aprovado	55.41	Cartão de Débito
6	Aprovado	22.33	Cartão de Crédito
7	Aprovado	51.27	Cartão de Crédito
8	Aprovado	68.04	Pix
9	Aprovado	18.40	Cartão de Débito
10	Aprovado	47.62	Cartão de Crédito
11	Aprovado	70.50	Apple Pay
12	Aprovado	110.19	Cartão de Crédito
13	Aprovado	42.75	Pix
14	Aprovado	22.68	Apple Pay
15	Aprovado	97.51	Pix
16	Aprovado	69.29	Uber Cash
17	Aprovado	37.84	Cartão de Crédito
18	Aprovado	25.39	Dinheiro
19	Aprovado	43.67	Cartão de Crédito
20	Aprovado	18.00	Apple Pay
31	Recusado	66.33	Cartão de Crédito
32	Pendente	0.00	Apple Pay
33	Recusado	25.39	Dinheiro
34	Pendente	0.00	Pix
35	Cancelado	0.00	Cartão de Débito
36	Cancelado	0.00	Uber Cash
37	Recusado	58.99	Cartão de Crédito
38	Pendente	35.50	Pix
\.


--
-- Data for Name: passageiro; Type: TABLE DATA; Schema: uber; Owner: vscode
--

COPY uber.passageiro (idpassageiro, notapassageiro) FROM stdin;
2	4.80
3	4.50
5	4.90
7	4.89
8	4.21
9	4.18
11	4.78
13	4.24
15	3.29
18	4.11
19	3.26
21	4.64
23	4.13
24	3.51
25	4.41
\.


--
-- Data for Name: reservacorrida; Type: TABLE DATA; Schema: uber; Owner: vscode
--

COPY uber.reservacorrida (idreserva, datahorasaida, datahorachegada, localsaida, localchegada, statusreserva, idpassageiro, idservico) FROM stdin;
1	2026-01-10 08:30:00	2026-01-10 09:16:00	Av. Atlântica, 1500 - Copacabana	Av. Borges de Medeiros, 1424 - Lagoa	Concluída	2	1
2	2026-01-15 07:30:00	2026-01-15 08:25:00	Praça XV de Novembro, s/n - Centro	Av. das Américas, 4200 - Barra da Tijuca	Concluída	9	6
3	2026-01-18 10:28:00	2026-01-18 11:15:00	Av. Niemeyer, 200 - Vidigal	Av. Delfim Moreira, 900 - Leblon	Concluída	15	9
\.


--
-- Data for Name: servico; Type: TABLE DATA; Schema: uber; Owner: vscode
--

COPY uber.servico (idservico, datahora, idveiculo, idpagamento, idcidade, idmotorista, idcategoria) FROM stdin;
1	2026-01-10 08:30:00	1	1	1	1	1
2	2026-01-11 09:15:00	2	2	1	4	1
3	2026-01-12 14:20:00	3	3	1	6	3
4	2026-01-13 18:45:00	53	4	1	12	4
5	2026-01-14 20:10:00	54	5	1	14	4
6	2026-01-15 07:30:00	4	6	1	10	2
7	2026-01-16 23:28:00	5	7	1	17	1
8	2026-01-17 05:34:00	55	8	1	16	4
9	2026-01-18 10:28:00	1	9	1	1	1
10	2026-01-19 12:19:00	2	10	1	4	1
11	2026-01-20 16:40:00	3	11	1	6	3
12	2026-01-21 21:05:00	56	12	1	20	4
13	2026-01-22 08:50:00	4	13	1	10	2
14	2026-01-23 11:22:00	5	14	1	17	1
15	2026-01-24 14:00:00	57	15	1	22	4
16	2026-02-01 10:05:00	54	16	1	14	5
17	2026-02-02 10:31:00	55	17	1	16	5
18	2026-02-03 14:37:00	3	18	1	6	6
19	2026-02-04 16:12:00	56	19	1	20	5
20	2026-02-05 09:08:00	4	20	1	10	6
31	2026-03-01 02:26:00	3	31	1	6	3
32	2026-03-02 19:09:00	56	32	1	20	4
33	2026-03-03 10:05:00	4	33	1	10	2
34	2026-03-04 04:32:00	5	34	1	17	1
35	2026-03-05 06:00:00	57	35	1	22	4
36	2026-03-06 17:12:00	1	36	1	1	1
37	2026-03-07 04:42:00	53	37	1	12	4
38	2026-03-08 01:00:00	2	38	1	4	1
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: uber; Owner: vscode
--

COPY uber.usuario (idusuario, nome, sobrenome, datanascimento, email, numerotelefone) FROM stdin;
1	Vinicius	Dias	1991-10-08	dda-luz@example.com	+55 (20) 05407-8220
2	Fernanda	Santos	1970-06-14	maria-laura@example.org	+55 (10) 00753-6291
3	Sabrina	Guerra	1981-01-19	vieiranoah@example.net	+55 (18) 31280-6763
4	Pietra	Siqueira	1963-02-24	mariada-paz@example.com	+55 (46) 71226-2429
5	Jade	Sampaio	1964-07-09	njesus@example.net	+55 (45) 36301-3481
6	Eduardo	Freitas	1980-01-27	gdas-neves@example.org	+55 (78) 50261-1552
7	Guilherme	Silveira	1978-12-29	davi-lucas@example.net	+55 (84) 43510-8975
8	Henry	Freitas	1956-09-05	jose-miguel71@example.com	+55 (38) 28588-9602
9	Rafael	Oliveira	1965-08-03	britomaria@example.net	+55 (52) 41852-9132
10	Ana Vitória	Caldeira	1991-02-10	mda-costa@example.net	+55 (98) 90199-8025
11	Daniela	Conceição	1979-06-04	nviana@example.org	+55 (37) 02012-1048
12	Igor	Siqueira	1985-04-17	joao-miguel@example.org	+55 (62) 50800-1712
13	Enzo	Pimenta	1965-02-13	leaoester@example.com	+55 (03) 28067-0124
14	Sophia	Siqueira	2005-01-07	joao-gui@example.org	+55 (18) 14351-3103
15	Yan	Rosa	1990-08-10	yagoda@example.com	+55 (00) 18211-7599
16	Lorena	Fernandes	1994-03-07	das-neveslaura@example.net	+55 (93) 76776-7307
17	Anna Liz	Cassiano	1979-01-17	ana-ceci@example.net	+55 (06) 06882-0252
18	Ayla	Cunha	2001-11-15	oliviamarques@example.net	+55 (44) 25967-4229
19	Emilly	Carvalho	1994-10-18	camila23@example.org	+55 (73) 91673-0404
20	Gael	Cunha	1966-08-04	ypinto@example.net	+55 (82) 68331-2421
21	Levi	Campos	1996-03-10	gcassiano@example.com	+55 (03) 63430-3831
22	Pietra	Sousa	1972-03-07	wsales@example.com	+55 (19) 68432-6943
23	Laura	Moraes	1964-05-30	cardosoeduarda@example.org	+55 (27) 02677-9980
24	Laís	Pereira	1974-02-01	juliana08@example.com	+55 (77) 85902-3531
25	Laís	Cavalcanti	2005-09-11	vcavalcante@example.org	+55 (06) 00619-1825
\.


--
-- Data for Name: veiculo; Type: TABLE DATA; Schema: uber; Owner: vscode
--

COPY uber.veiculo (idveiculo, placa, cor, idmodelo) FROM stdin;
1	UIY-4297	Preto	1
2	OMG-9032	Cinza	4
3	LRD-8432	Branco	10
4	WXQ-8405	Prata	15
5	OAX-2771	Amarelo	7
6	KQE-9995	Branco	1
7	WTY-9805	Preto	4
8	DAE-3365	Cinza	7
9	RHW-3753	Cinza	15
10	KSC-9542	Branco	1
11	UXB-6711	Preto	1
53	NTF-2498	Branco	26
54	GXA-2237	Cinza	26
55	OIL-0829	Preto	26
56	OGY-3009	Branco	27
57	TCM-2373	Prata	27
58	GOT-3788	Preto	27
\.


--
-- Name: avaliacao avaliacao_pkey; Type: CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.avaliacao
    ADD CONSTRAINT avaliacao_pkey PRIMARY KEY (idavaliacao);


--
-- Name: cancelamento cancelamento_pkey; Type: CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.cancelamento
    ADD CONSTRAINT cancelamento_pkey PRIMARY KEY (idcancelamento);


--
-- Name: carro carro_pkey; Type: CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.carro
    ADD CONSTRAINT carro_pkey PRIMARY KEY (idveiculo);


--
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (idcategoria);


--
-- Name: cidade cidade_pkey; Type: CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.cidade
    ADD CONSTRAINT cidade_pkey PRIMARY KEY (idcidade);


--
-- Name: conduz conduz_pkey; Type: CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.conduz
    ADD CONSTRAINT conduz_pkey PRIMARY KEY (idmotorista, idveiculo);


--
-- Name: corrida corrida_pkey; Type: CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.corrida
    ADD CONSTRAINT corrida_pkey PRIMARY KEY (idservico);


--
-- Name: entrega entrega_pkey; Type: CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.entrega
    ADD CONSTRAINT entrega_pkey PRIMARY KEY (idservico);


--
-- Name: estado estado_pkey; Type: CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (idestado);


--
-- Name: marca marca_pkey; Type: CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.marca
    ADD CONSTRAINT marca_pkey PRIMARY KEY (idmarca);


--
-- Name: modelo modelo_pkey; Type: CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.modelo
    ADD CONSTRAINT modelo_pkey PRIMARY KEY (idmodelo);


--
-- Name: moto moto_pkey; Type: CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.moto
    ADD CONSTRAINT moto_pkey PRIMARY KEY (idveiculo);


--
-- Name: motorista motorista_cnh_key; Type: CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.motorista
    ADD CONSTRAINT motorista_cnh_key UNIQUE (cnh);


--
-- Name: motorista motorista_pkey; Type: CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.motorista
    ADD CONSTRAINT motorista_pkey PRIMARY KEY (idmotorista);


--
-- Name: pagamento pagamento_pkey; Type: CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.pagamento
    ADD CONSTRAINT pagamento_pkey PRIMARY KEY (idpagamento);


--
-- Name: passageiro passageiro_pkey; Type: CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.passageiro
    ADD CONSTRAINT passageiro_pkey PRIMARY KEY (idpassageiro);


--
-- Name: reservacorrida reservacorrida_pkey; Type: CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.reservacorrida
    ADD CONSTRAINT reservacorrida_pkey PRIMARY KEY (idreserva);


--
-- Name: servico servico_pkey; Type: CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.servico
    ADD CONSTRAINT servico_pkey PRIMARY KEY (idservico);


--
-- Name: usuario usuario_email_key; Type: CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.usuario
    ADD CONSTRAINT usuario_email_key UNIQUE (email);


--
-- Name: usuario usuario_numerotelefone_key; Type: CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.usuario
    ADD CONSTRAINT usuario_numerotelefone_key UNIQUE (numerotelefone);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (idusuario);


--
-- Name: veiculo veiculo_pkey; Type: CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.veiculo
    ADD CONSTRAINT veiculo_pkey PRIMARY KEY (idveiculo);


--
-- Name: veiculo veiculo_placa_key; Type: CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.veiculo
    ADD CONSTRAINT veiculo_placa_key UNIQUE (placa);


--
-- Name: avaliacao avaliacao_idservico_fkey; Type: FK CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.avaliacao
    ADD CONSTRAINT avaliacao_idservico_fkey FOREIGN KEY (idservico) REFERENCES uber.servico(idservico);


--
-- Name: cancelamento cancelamento_idservico_fkey; Type: FK CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.cancelamento
    ADD CONSTRAINT cancelamento_idservico_fkey FOREIGN KEY (idservico) REFERENCES uber.servico(idservico);


--
-- Name: carro carro_idveiculo_fkey; Type: FK CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.carro
    ADD CONSTRAINT carro_idveiculo_fkey FOREIGN KEY (idveiculo) REFERENCES uber.veiculo(idveiculo);


--
-- Name: cidade cidade_idestado_fkey; Type: FK CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.cidade
    ADD CONSTRAINT cidade_idestado_fkey FOREIGN KEY (idestado) REFERENCES uber.estado(idestado);


--
-- Name: conduz conduz_idmotorista_fkey; Type: FK CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.conduz
    ADD CONSTRAINT conduz_idmotorista_fkey FOREIGN KEY (idmotorista) REFERENCES uber.motorista(idmotorista);


--
-- Name: conduz conduz_idveiculo_fkey; Type: FK CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.conduz
    ADD CONSTRAINT conduz_idveiculo_fkey FOREIGN KEY (idveiculo) REFERENCES uber.veiculo(idveiculo);


--
-- Name: corrida corrida_idpassageiro_fkey; Type: FK CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.corrida
    ADD CONSTRAINT corrida_idpassageiro_fkey FOREIGN KEY (idpassageiro) REFERENCES uber.passageiro(idpassageiro);


--
-- Name: corrida corrida_idservico_fkey; Type: FK CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.corrida
    ADD CONSTRAINT corrida_idservico_fkey FOREIGN KEY (idservico) REFERENCES uber.servico(idservico);


--
-- Name: entrega entrega_idservico_fkey; Type: FK CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.entrega
    ADD CONSTRAINT entrega_idservico_fkey FOREIGN KEY (idservico) REFERENCES uber.servico(idservico);


--
-- Name: entrega entrega_idusuario_fkey; Type: FK CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.entrega
    ADD CONSTRAINT entrega_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES uber.usuario(idusuario);


--
-- Name: modelo modelo_idmarca_fkey; Type: FK CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.modelo
    ADD CONSTRAINT modelo_idmarca_fkey FOREIGN KEY (idmarca) REFERENCES uber.marca(idmarca);


--
-- Name: moto moto_idveiculo_fkey; Type: FK CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.moto
    ADD CONSTRAINT moto_idveiculo_fkey FOREIGN KEY (idveiculo) REFERENCES uber.veiculo(idveiculo);


--
-- Name: motorista motorista_idmotorista_fkey; Type: FK CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.motorista
    ADD CONSTRAINT motorista_idmotorista_fkey FOREIGN KEY (idmotorista) REFERENCES uber.usuario(idusuario);


--
-- Name: passageiro passageiro_idpassageiro_fkey; Type: FK CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.passageiro
    ADD CONSTRAINT passageiro_idpassageiro_fkey FOREIGN KEY (idpassageiro) REFERENCES uber.usuario(idusuario);


--
-- Name: reservacorrida reservacorrida_idpassageiro_fkey; Type: FK CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.reservacorrida
    ADD CONSTRAINT reservacorrida_idpassageiro_fkey FOREIGN KEY (idpassageiro) REFERENCES uber.passageiro(idpassageiro);


--
-- Name: reservacorrida reservacorrida_idservico_fkey; Type: FK CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.reservacorrida
    ADD CONSTRAINT reservacorrida_idservico_fkey FOREIGN KEY (idservico) REFERENCES uber.corrida(idservico);


--
-- Name: servico servico_idcategoria_fkey; Type: FK CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.servico
    ADD CONSTRAINT servico_idcategoria_fkey FOREIGN KEY (idcategoria) REFERENCES uber.categoria(idcategoria);


--
-- Name: servico servico_idcidade_fkey; Type: FK CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.servico
    ADD CONSTRAINT servico_idcidade_fkey FOREIGN KEY (idcidade) REFERENCES uber.cidade(idcidade);


--
-- Name: servico servico_idmotorista_fkey; Type: FK CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.servico
    ADD CONSTRAINT servico_idmotorista_fkey FOREIGN KEY (idmotorista) REFERENCES uber.motorista(idmotorista);


--
-- Name: servico servico_idpagamento_fkey; Type: FK CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.servico
    ADD CONSTRAINT servico_idpagamento_fkey FOREIGN KEY (idpagamento) REFERENCES uber.pagamento(idpagamento);


--
-- Name: servico servico_idveiculo_fkey; Type: FK CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.servico
    ADD CONSTRAINT servico_idveiculo_fkey FOREIGN KEY (idveiculo) REFERENCES uber.veiculo(idveiculo);


--
-- Name: veiculo veiculo_idmodelo_fkey; Type: FK CONSTRAINT; Schema: uber; Owner: vscode
--

ALTER TABLE ONLY uber.veiculo
    ADD CONSTRAINT veiculo_idmodelo_fkey FOREIGN KEY (idmodelo) REFERENCES uber.modelo(idmodelo);


--
-- PostgreSQL database dump complete
--

\unrestrict fA2blg32llyxR5upqa8fqrB2tQSs8vuN0rLk05jg6fkxUSYY4GC5am9oVwf7LDn

