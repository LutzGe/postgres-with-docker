--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.0
-- Dumped by pg_dump version 9.5.0

-- Started on 2019-08-12 14:56:32

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 195 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2223 (class 0 OID 0)
-- Dependencies: 195
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 188 (class 1259 OID 164140)
-- Name: autor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE autor (
    codaut integer NOT NULL,
    nome character varying(100) NOT NULL,
    endereco character varying(200),
    codcid integer NOT NULL
);


ALTER TABLE autor OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 164185)
-- Name: bibliotecario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE bibliotecario (
    nummat integer NOT NULL,
    nome character varying(100) NOT NULL,
    endereco character varying(200),
    dataadm date NOT NULL,
    valorsal numeric(11,2),
    codcid integer NOT NULL
);


ALTER TABLE bibliotecario OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 164120)
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE categoria (
    codcat integer NOT NULL,
    descricao character varying(100) NOT NULL
);


ALTER TABLE categoria OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 164073)
-- Name: cidade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cidade (
    codcid integer NOT NULL,
    nome character varying(100) NOT NULL,
    codest integer NOT NULL
);


ALTER TABLE cidade OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 164094)
-- Name: editora; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE editora (
    codedit integer NOT NULL,
    nome character varying(100) NOT NULL,
    endereco character varying(200),
    codcid integer NOT NULL
);


ALTER TABLE editora OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 164063)
-- Name: estado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE estado (
    codest integer NOT NULL,
    nome character varying(100) NOT NULL,
    sigla character varying(2) NOT NULL,
    codpais integer NOT NULL
);


ALTER TABLE estado OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 164083)
-- Name: estante; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE estante (
    numest integer NOT NULL,
    descricao character varying(100) NOT NULL
);


ALTER TABLE estante OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 164165)
-- Name: exemplar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE exemplar (
    codlivro integer NOT NULL,
    sequencia integer NOT NULL,
    situacao character(1)
);


ALTER TABLE exemplar OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 164104)
-- Name: livro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE livro (
    codlivro integer NOT NULL,
    titulo character varying(150) NOT NULL,
    edicao integer,
    isbn character varying(15) NOT NULL,
    codedit integer NOT NULL,
    numest integer NOT NULL,
    CONSTRAINT chk_edicao_livro CHECK ((edicao > 0))
);


ALTER TABLE livro OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 164150)
-- Name: livroautor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE livroautor (
    codlivro integer NOT NULL,
    codaut integer NOT NULL
);


ALTER TABLE livroautor OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 164125)
-- Name: livrocategoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE livrocategoria (
    codlivro integer NOT NULL,
    codcat integer NOT NULL
);


ALTER TABLE livrocategoria OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 164058)
-- Name: pais; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pais (
    codpais integer NOT NULL,
    nome character varying(100) NOT NULL
);


ALTER TABLE pais OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 164195)
-- Name: reserva; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE reserva (
    codres integer NOT NULL,
    datares date NOT NULL,
    horares time without time zone NOT NULL,
    codlivro integer NOT NULL,
    codusu integer NOT NULL,
    nummat integer
);


ALTER TABLE reserva OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 164215)
-- Name: retirada; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE retirada (
    codret integer NOT NULL,
    dataret date NOT NULL,
    horaret time without time zone NOT NULL,
    dataentprev date NOT NULL,
    dataentreal date,
    multa numeric(11,2),
    codlivro integer NOT NULL,
    sequencia integer NOT NULL,
    codusu integer NOT NULL,
    nummat integer,
    codres integer,
    CONSTRAINT chk_dataentprev_dataret_retirada CHECK ((dataentprev >= dataret))
);


ALTER TABLE retirada OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 164175)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuario (
    codusu integer NOT NULL,
    nome character varying(100) NOT NULL,
    endereco character varying(200),
    rg integer,
    datanasc date NOT NULL,
    codcid integer NOT NULL
);


ALTER TABLE usuario OWNER TO postgres;

--
-- TOC entry 2209 (class 0 OID 164140)
-- Dependencies: 188
-- Data for Name: autor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO autor VALUES (1, 'Silberschatz', 'Rua sem saída', 4);
INSERT INTO autor VALUES (2, 'Heuser', 'Não sei', 1);
INSERT INTO autor VALUES (3, 'Evandro Franzen', 'Centro', 1);
INSERT INTO autor VALUES (4, 'João Luis', 'Rua X, 958', 2);
INSERT INTO autor VALUES (5, 'Sócrates', 'Partenon', 3);
INSERT INTO autor VALUES (6, 'Jesus Cristo', 'Jerusalém', 5);


--
-- TOC entry 2213 (class 0 OID 164185)
-- Dependencies: 192
-- Data for Name: bibliotecario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO bibliotecario VALUES (100, 'Érico Veríssimo', 'Sua casa', '1998-05-10', 1500.00, 3);
INSERT INTO bibliotecario VALUES (101, 'Charles Manson', 'Rancho Spahn', '2007-08-05', 1300.00, 5);
INSERT INTO bibliotecario VALUES (102, 'Geromel', 'Zaga do grêmio', '2013-10-06', 1800.00, 2);
INSERT INTO bibliotecario VALUES (103, 'Moledo', 'Zaga do inter', '2014-10-10', 1800.00, 1);


--
-- TOC entry 2207 (class 0 OID 164120)
-- Dependencies: 186
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO categoria VALUES (1, 'Ficção');
INSERT INTO categoria VALUES (2, 'Banco de dados');
INSERT INTO categoria VALUES (3, 'Programação');
INSERT INTO categoria VALUES (4, 'Romance');
INSERT INTO categoria VALUES (5, 'Policial');
INSERT INTO categoria VALUES (6, 'Computação gráfica');
INSERT INTO categoria VALUES (7, 'Terror');


--
-- TOC entry 2203 (class 0 OID 164073)
-- Dependencies: 182
-- Data for Name: cidade; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cidade VALUES (1, 'Lajeado', 1);
INSERT INTO cidade VALUES (2, 'Arroio do Meio', 1);
INSERT INTO cidade VALUES (3, 'Florianópolis', 2);
INSERT INTO cidade VALUES (4, 'Berlim', 4);
INSERT INTO cidade VALUES (5, 'Nova York', 3);


--
-- TOC entry 2205 (class 0 OID 164094)
-- Dependencies: 184
-- Data for Name: editora; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO editora VALUES (11, 'Pearson', 'Fica longe, 999', 5);
INSERT INTO editora VALUES (12, 'Elsevier', 'Na América do Norte', 5);
INSERT INTO editora VALUES (10, 'Atica', 'Não sei onde fica', 2);
INSERT INTO editora VALUES (13, 'Artmed', 'Fica aqui, 123', 1);


--
-- TOC entry 2202 (class 0 OID 164063)
-- Dependencies: 181
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO estado VALUES (1, 'Rio Grande do Sul', 'RS', 1);
INSERT INTO estado VALUES (2, 'Santa Catarina', 'SC', 1);
INSERT INTO estado VALUES (3, 'Nova York', 'NY', 3);
INSERT INTO estado VALUES (5, 'São Paulo', 'SP', 1);
INSERT INTO estado VALUES (4, 'Berlim', 'BE', 5);


--
-- TOC entry 2204 (class 0 OID 164083)
-- Dependencies: 183
-- Data for Name: estante; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO estante VALUES (1, 'Entrada do corredor a direita');
INSERT INTO estante VALUES (2, 'Segunda a direita');
INSERT INTO estante VALUES (3, 'Terceira a esquerda');
INSERT INTO estante VALUES (4, 'Última antes da parede');
INSERT INTO estante VALUES (5, 'Bem no meio');


--
-- TOC entry 2211 (class 0 OID 164165)
-- Dependencies: 190
-- Data for Name: exemplar; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO exemplar VALUES (1, 1, 'D');
INSERT INTO exemplar VALUES (1, 2, 'R');
INSERT INTO exemplar VALUES (1, 3, 'D');
INSERT INTO exemplar VALUES (2, 1, 'R');
INSERT INTO exemplar VALUES (2, 2, 'D');
INSERT INTO exemplar VALUES (3, 1, 'D');
INSERT INTO exemplar VALUES (3, 2, 'B');
INSERT INTO exemplar VALUES (4, 2, 'D');
INSERT INTO exemplar VALUES (4, 1, 'D');
INSERT INTO exemplar VALUES (4, 3, 'D');
INSERT INTO exemplar VALUES (5, 1, 'D');
INSERT INTO exemplar VALUES (6, 1, 'R');
INSERT INTO exemplar VALUES (6, 2, 'R');
INSERT INTO exemplar VALUES (6, 3, 'R');
INSERT INTO exemplar VALUES (7, 1, 'D');
INSERT INTO exemplar VALUES (7, 2, 'D');
INSERT INTO exemplar VALUES (7, 3, 'R');
INSERT INTO exemplar VALUES (8, 1, 'D');
INSERT INTO exemplar VALUES (8, 2, 'B');
INSERT INTO exemplar VALUES (8, 3, 'R');
INSERT INTO exemplar VALUES (8, 4, 'D');


--
-- TOC entry 2206 (class 0 OID 164104)
-- Dependencies: 185
-- Data for Name: livro; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO livro VALUES (2, 'Projeto de banco de dados', 1, 'A125C', 11, 3);
INSERT INTO livro VALUES (3, 'O exorcista', 1, 'T125Y', 12, 1);
INSERT INTO livro VALUES (1, 'Sistemas de bancos de dados', 1, 'A123B', 13, 4);
INSERT INTO livro VALUES (4, 'Serial killers', 2, 'S127Z', 10, 1);
INSERT INTO livro VALUES (5, 'Introdução a computação gráfica', 3, 'I127N', 11, 5);
INSERT INTO livro VALUES (6, 'Introdução a SGBD', 1, 'I128I', 13, 3);
INSERT INTO livro VALUES (7, 'American crime history', 1, 'AM128I', 10, 2);
INSERT INTO livro VALUES (8, 'American crime history - parte 2', 2, 'SEM', 10, 2);


--
-- TOC entry 2210 (class 0 OID 164150)
-- Dependencies: 189
-- Data for Name: livroautor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO livroautor VALUES (1, 1);
INSERT INTO livroautor VALUES (2, 5);
INSERT INTO livroautor VALUES (3, 1);
INSERT INTO livroautor VALUES (2, 2);
INSERT INTO livroautor VALUES (3, 5);
INSERT INTO livroautor VALUES (4, 6);
INSERT INTO livroautor VALUES (5, 1);
INSERT INTO livroautor VALUES (5, 3);
INSERT INTO livroautor VALUES (6, 1);
INSERT INTO livroautor VALUES (6, 5);
INSERT INTO livroautor VALUES (7, 6);
INSERT INTO livroautor VALUES (8, 4);
INSERT INTO livroautor VALUES (8, 2);


--
-- TOC entry 2208 (class 0 OID 164125)
-- Dependencies: 187
-- Data for Name: livrocategoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO livrocategoria VALUES (1, 2);
INSERT INTO livrocategoria VALUES (1, 4);
INSERT INTO livrocategoria VALUES (2, 2);
INSERT INTO livrocategoria VALUES (2, 3);
INSERT INTO livrocategoria VALUES (3, 5);
INSERT INTO livrocategoria VALUES (3, 7);
INSERT INTO livrocategoria VALUES (6, 2);
INSERT INTO livrocategoria VALUES (7, 5);
INSERT INTO livrocategoria VALUES (4, 5);
INSERT INTO livrocategoria VALUES (4, 7);
INSERT INTO livrocategoria VALUES (3, 1);


--
-- TOC entry 2201 (class 0 OID 164058)
-- Dependencies: 180
-- Data for Name: pais; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pais VALUES (1, 'Brasil');
INSERT INTO pais VALUES (2, 'Argentina');
INSERT INTO pais VALUES (3, 'Estados Unidos');
INSERT INTO pais VALUES (4, 'Alemanha');
INSERT INTO pais VALUES (5, 'Inglaterra');


--
-- TOC entry 2214 (class 0 OID 164195)
-- Dependencies: 193
-- Data for Name: reserva; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO reserva VALUES (1, '2019-07-10', '10:00:00', 2, 3, NULL);
INSERT INTO reserva VALUES (2, '2019-06-20', '11:00:00', 3, 5, 101);
INSERT INTO reserva VALUES (3, '2018-12-31', '14:00:00', 4, 5, 102);
INSERT INTO reserva VALUES (4, '2018-09-20', '16:00:00', 3, 5, NULL);
INSERT INTO reserva VALUES (5, '2017-06-15', '21:00:00', 1, 3, 103);
INSERT INTO reserva VALUES (6, '2017-02-01', '22:03:08', 6, 3, 101);
INSERT INTO reserva VALUES (7, '2017-03-03', '19:10:00', 2, 1, NULL);
INSERT INTO reserva VALUES (8, '2019-08-20', '16:15:00', 1, 6, NULL);
INSERT INTO reserva VALUES (9, '2018-08-04', '20:40:00', 3, 2, NULL);
INSERT INTO reserva VALUES (10, '2017-07-10', '17:04:00', 7, 5, NULL);
INSERT INTO reserva VALUES (11, '2019-05-06', '14:01:00', 7, 5, 101);
INSERT INTO reserva VALUES (12, '2019-06-10', '16:00:00', 7, 5, NULL);
INSERT INTO reserva VALUES (13, '2018-02-15', '19:25:00', 3, 5, NULL);


--
-- TOC entry 2215 (class 0 OID 164215)
-- Dependencies: 194
-- Data for Name: retirada; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO retirada VALUES (1, '2016-04-20', '16:00:00', '2016-04-27', '2016-04-28', 1.00, 5, 1, 1, 102, NULL);
INSERT INTO retirada VALUES (2, '2019-06-21', '20:03:00', '2019-06-28', '2019-06-30', 2.00, 3, 1, 5, 103, 2);
INSERT INTO retirada VALUES (33, '2017-02-01', '22:08:00', '2017-02-15', '2017-02-15', 0.00, 6, 2, 3, 103, 6);
INSERT INTO retirada VALUES (50, '2019-06-15', '16:12:00', '2019-06-23', '2019-06-23', 0.00, 4, 1, 6, 101, NULL);
INSERT INTO retirada VALUES (51, '2019-09-14', '14:12:00', '2019-09-30', '2019-10-06', 10.00, 3, 2, 2, 101, NULL);
INSERT INTO retirada VALUES (102, '2018-11-27', '08:00:00', '2048-12-04', '2018-12-04', 0.00, 2, 2, 3, 101, NULL);
INSERT INTO retirada VALUES (103, '2018-11-30', '11:10:00', '2018-12-07', '2018-12-07', 0.00, 1, 1, 3, 102, NULL);
INSERT INTO retirada VALUES (201, '2019-04-06', '15:03:00', '2019-04-11', '2019-04-15', 4.00, 1, 2, 1, 103, NULL);
INSERT INTO retirada VALUES (202, '2019-08-07', '13:30:00', '2019-08-15', '2019-08-15', 0.00, 3, 2, 5, 101, NULL);
INSERT INTO retirada VALUES (35, '2017-08-03', '17:25:00', '2017-08-10', '2017-09-07', 25.00, 4, 2, 3, 101, NULL);
INSERT INTO retirada VALUES (36, '2017-07-14', '20:00:00', '2017-07-21', '2017-07-21', 0.00, 5, 1, 3, 102, 10);
INSERT INTO retirada VALUES (203, '2019-10-14', '10:15:00', '2019-10-20', '2019-12-01', 45.00, 2, 2, 1, 103, NULL);
INSERT INTO retirada VALUES (3, '2016-09-30', '09:01:00', '2019-10-06', '2019-10-15', 8.00, 6, 1, 3, 101, NULL);


--
-- TOC entry 2212 (class 0 OID 164175)
-- Dependencies: 191
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usuario VALUES (1, 'Benjamin Franklin', 'Já faleceu', 8556322, '1900-02-01', 5);
INSERT INTO usuario VALUES (2, 'Freud', 'Rua dos sonhos, 6564', 9696969, '1971-05-10', 2);
INSERT INTO usuario VALUES (3, 'Alan Turing', 'Rua das máquinas, 748', NULL, '1958-11-04', 3);
INSERT INTO usuario VALUES (4, 'Presidente Vargas', 'Palácio do planalto, 1', NULL, '2001-09-07', 4);
INSERT INTO usuario VALUES (5, 'Renato Russo', 'Avenida do tempo, 16', 7745218, '2002-07-21', 1);
INSERT INTO usuario VALUES (6, 'Cazuza', 'Avenida Atlântica', 445566, '1996-04-03', 5);


--
-- TOC entry 2054 (class 2606 OID 164144)
-- Name: pk_autor; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY autor
    ADD CONSTRAINT pk_autor PRIMARY KEY (codaut);


--
-- TOC entry 2062 (class 2606 OID 164189)
-- Name: pk_bibliotecario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bibliotecario
    ADD CONSTRAINT pk_bibliotecario PRIMARY KEY (nummat);


--
-- TOC entry 2050 (class 2606 OID 164124)
-- Name: pk_categoria; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT pk_categoria PRIMARY KEY (codcat);


--
-- TOC entry 2042 (class 2606 OID 164077)
-- Name: pk_cidade; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cidade
    ADD CONSTRAINT pk_cidade PRIMARY KEY (codcid);


--
-- TOC entry 2046 (class 2606 OID 164098)
-- Name: pk_editora; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY editora
    ADD CONSTRAINT pk_editora PRIMARY KEY (codedit);


--
-- TOC entry 2040 (class 2606 OID 164067)
-- Name: pk_estado; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estado
    ADD CONSTRAINT pk_estado PRIMARY KEY (codest);


--
-- TOC entry 2044 (class 2606 OID 164087)
-- Name: pk_estante; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estante
    ADD CONSTRAINT pk_estante PRIMARY KEY (numest);


--
-- TOC entry 2058 (class 2606 OID 164169)
-- Name: pk_exemplar; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY exemplar
    ADD CONSTRAINT pk_exemplar PRIMARY KEY (codlivro, sequencia);


--
-- TOC entry 2048 (class 2606 OID 164109)
-- Name: pk_livro; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY livro
    ADD CONSTRAINT pk_livro PRIMARY KEY (codlivro);


--
-- TOC entry 2056 (class 2606 OID 164154)
-- Name: pk_livroautor; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY livroautor
    ADD CONSTRAINT pk_livroautor PRIMARY KEY (codlivro, codaut);


--
-- TOC entry 2052 (class 2606 OID 164129)
-- Name: pk_livrocategoria; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY livrocategoria
    ADD CONSTRAINT pk_livrocategoria PRIMARY KEY (codlivro, codcat);


--
-- TOC entry 2038 (class 2606 OID 164062)
-- Name: pk_pais; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pais
    ADD CONSTRAINT pk_pais PRIMARY KEY (codpais);


--
-- TOC entry 2064 (class 2606 OID 164199)
-- Name: pk_reserva; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reserva
    ADD CONSTRAINT pk_reserva PRIMARY KEY (codres);


--
-- TOC entry 2066 (class 2606 OID 164220)
-- Name: pk_retirada; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY retirada
    ADD CONSTRAINT pk_retirada PRIMARY KEY (codret);


--
-- TOC entry 2060 (class 2606 OID 164179)
-- Name: pk_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_usuario PRIMARY KEY (codusu);


--
-- TOC entry 2076 (class 2606 OID 164160)
-- Name: fk_codaut_livroautor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY livroautor
    ADD CONSTRAINT fk_codaut_livroautor FOREIGN KEY (codaut) REFERENCES autor(codaut);


--
-- TOC entry 2073 (class 2606 OID 164135)
-- Name: fk_codcat_livrocategoria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY livrocategoria
    ADD CONSTRAINT fk_codcat_livrocategoria FOREIGN KEY (codcat) REFERENCES categoria(codcat);


--
-- TOC entry 2074 (class 2606 OID 164145)
-- Name: fk_codcid_autor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY autor
    ADD CONSTRAINT fk_codcid_autor FOREIGN KEY (codcid) REFERENCES cidade(codcid);


--
-- TOC entry 2079 (class 2606 OID 164190)
-- Name: fk_codcid_bibliotecario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bibliotecario
    ADD CONSTRAINT fk_codcid_bibliotecario FOREIGN KEY (codcid) REFERENCES cidade(codcid);


--
-- TOC entry 2069 (class 2606 OID 164099)
-- Name: fk_codcid_editora; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY editora
    ADD CONSTRAINT fk_codcid_editora FOREIGN KEY (codcid) REFERENCES cidade(codcid);


--
-- TOC entry 2078 (class 2606 OID 164180)
-- Name: fk_codcid_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_codcid_usuario FOREIGN KEY (codcid) REFERENCES cidade(codcid);


--
-- TOC entry 2070 (class 2606 OID 164110)
-- Name: fk_codedit_livro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY livro
    ADD CONSTRAINT fk_codedit_livro FOREIGN KEY (codedit) REFERENCES editora(codedit);


--
-- TOC entry 2068 (class 2606 OID 164078)
-- Name: fk_codest_cidade; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cidade
    ADD CONSTRAINT fk_codest_cidade FOREIGN KEY (codest) REFERENCES estado(codest);


--
-- TOC entry 2077 (class 2606 OID 164170)
-- Name: fk_codlivro_exemplar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY exemplar
    ADD CONSTRAINT fk_codlivro_exemplar FOREIGN KEY (codlivro) REFERENCES livro(codlivro);


--
-- TOC entry 2075 (class 2606 OID 164155)
-- Name: fk_codlivro_livroautor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY livroautor
    ADD CONSTRAINT fk_codlivro_livroautor FOREIGN KEY (codlivro) REFERENCES livro(codlivro);


--
-- TOC entry 2072 (class 2606 OID 164130)
-- Name: fk_codlivro_livrocategoria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY livrocategoria
    ADD CONSTRAINT fk_codlivro_livrocategoria FOREIGN KEY (codlivro) REFERENCES livro(codlivro);


--
-- TOC entry 2080 (class 2606 OID 164200)
-- Name: fk_codlivro_reserva; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reserva
    ADD CONSTRAINT fk_codlivro_reserva FOREIGN KEY (codlivro) REFERENCES livro(codlivro);


--
-- TOC entry 2083 (class 2606 OID 164221)
-- Name: fk_codlivrosequencia_retirada; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY retirada
    ADD CONSTRAINT fk_codlivrosequencia_retirada FOREIGN KEY (codlivro, sequencia) REFERENCES exemplar(codlivro, sequencia);


--
-- TOC entry 2067 (class 2606 OID 164068)
-- Name: fk_codpais_estado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estado
    ADD CONSTRAINT fk_codpais_estado FOREIGN KEY (codpais) REFERENCES pais(codpais);


--
-- TOC entry 2086 (class 2606 OID 164236)
-- Name: fk_codres_retirada; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY retirada
    ADD CONSTRAINT fk_codres_retirada FOREIGN KEY (codres) REFERENCES reserva(codres);


--
-- TOC entry 2081 (class 2606 OID 164205)
-- Name: fk_codusu_reserva; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reserva
    ADD CONSTRAINT fk_codusu_reserva FOREIGN KEY (codusu) REFERENCES usuario(codusu);


--
-- TOC entry 2084 (class 2606 OID 164226)
-- Name: fk_codusu_retirada; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY retirada
    ADD CONSTRAINT fk_codusu_retirada FOREIGN KEY (codusu) REFERENCES usuario(codusu);


--
-- TOC entry 2071 (class 2606 OID 164115)
-- Name: fk_numest_livro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY livro
    ADD CONSTRAINT fk_numest_livro FOREIGN KEY (numest) REFERENCES estante(numest);


--
-- TOC entry 2082 (class 2606 OID 164210)
-- Name: fk_nummat_reserva; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reserva
    ADD CONSTRAINT fk_nummat_reserva FOREIGN KEY (nummat) REFERENCES bibliotecario(nummat);


--
-- TOC entry 2085 (class 2606 OID 164231)
-- Name: fk_nummat_retirada; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY retirada
    ADD CONSTRAINT fk_nummat_retirada FOREIGN KEY (nummat) REFERENCES bibliotecario(nummat);


--
-- TOC entry 2222 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-08-12 14:56:33

--
-- PostgreSQL database dump complete
--

