CREATE DATABASE IF NOT EXISTS db_sitevendas;
USE db_sitevendas; --ja deixar criado 

create table if not exists categoria (
    id_categoria INT AUTO_INCREMENT NOT NULL,
    nome_categoria VARCHAR(256) NOT NULL,

    PRIMARY KEY (id_categoria)
) engine=innodb;

create table if not exists imagens (
    id_imagem INT AUTO_INCREMENT NOT NULL,
    caminho_imagem VARCHAR(256) NOT NULL,

    PRIMARY KEY (id_imagem)
) engine=innodb;
create table if not exists usuario (
    id_usuario INT AUTO_INCREMENT NOT NULL,
    nome_user VARCHAR(256) NOT NULL,
    senha_hash VARCHAR(256) NOT NULL,
    email_user VARCHAR(256) NOT NULL UNIQUE, -- Adicionado UNIQUE aqui
    data_nascimento DATE NOT NULL,
    vendedor BOOLEAN DEFAULT 0,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id_usuario)
) engine=innodb;

create table if not exists localizacao_cliente (
    id_localizacao INT AUTO_INCREMENT NOT NULL,
    id_dono INT NOT NULL,
    cidade VARCHAR(150) NOT NULL,  -- Ajustado de TEXT para VARCHAR
    estado VARCHAR(2) NOT NULL, -- Ajustado de TEXT para VARCHAR(2)
    rua VARCHAR(150) NOT NULL,-- Ajustado de TEXT para VARCHAR
    cep VARCHAR(9) NOT NULL, -- Ajustado de INT para VARCHAR(9) para aceitar o zero inicial e o hífen
    numero VARCHAR(10) NOT NULL,-- Ajustado de INT para VARCHAR para aceitar letras ex: 100-A, S/N
    complemento VARCHAR(256) NOT NULL,-- Ajustado de TEXT para VARCHAR

    PRIMARY KEY (id_localizacao),
    FOREIGN KEY (id_dono) REFERENCES usuario(id_usuario)
) engine=innodb;

create table if not exists anuncios (
    id_anuncio INT AUTO_INCREMENT NOT NULL,
    id_dono INT NOT NULL,
    nome_anuncio VARCHAR(256) NOT NULL,
    descricao_anuncio TEXT NOT NULL,
    id_imagem INT NOT NULL,
    id_categoria INT NOT NULL,
    preco_centavos INT NOT NULL,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id_anuncio),
    FOREIGN KEY (id_dono) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_imagem) REFERENCES imagens(id_imagem),
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
) engine=innodb;

create table if not exists pedido (
    id_pedido INT AUTO_INCREMENT NOT NULL,
    id_vendedor INT NOT NULL,
    id_comprador INT NOT NULL,
    id_anuncio INT NOT NULL,
    id_localizacao INT NOT NULL,
    preco_centavos INT NOT NULL,
    status_pedido BOOLEAN,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id_pedido),
    FOREIGN KEY (id_vendedor) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_comprador) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_anuncio) REFERENCES anuncios(id_anuncio),
    FOREIGN KEY (id_localizacao) REFERENCES localizacao_cliente(id_localizacao)
) engine=innodb;

create table if not exists favoritos (
    id_favorito INT AUTO_INCREMENT NOT NULL, 
    id_dono INT NOT NULL,
    id_anuncio INT NOT NULL,

    PRIMARY KEY (id_favorito),
    FOREIGN KEY (id_dono) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_anuncio) REFERENCES anuncios(id_anuncio)
) engine=innodb;

create table if not exists historico (
    id_historico INT AUTO_INCREMENT NOT NULL,
    id_dono INT NOT NULL,
    descricao_historico TEXT NOT NULL,
    ocorrido_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id_historico),
    FOREIGN KEY (id_dono) REFERENCES usuario(id_usuario)
) engine=innodb;


