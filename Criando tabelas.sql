CREATE DATABASE ecommerce;
use ecommerce;


CREATE TABLE clients(
	idClient INT AUTO_INCREMENT PRIMARY KEY,
    pjorpf ENUM('PJ', 'PF') DEFAULT 'PF',
    Fname VARCHAR(10),
    Minit CHAR(3),
    Lname VARCHAR(20),
    CPF CHAR(11) UNIQUE,
    CNPJ CHAR(15) UNIQUE,
    Adress VARCHAR(30),
    CHECK((pjorpf = 'PF' AND CPF IS NOT NULL AND CNPJ IS NULL) OR (pjorpf = 'PJ' AND CNPJ IS NOT NULL AND CPF IS NULL))
);

ALTER TABLE clients AUTO_INCREMENT = 1 ;
ALTER TABLE produto MODIFY pName VARCHAR(50);
CREATE TABLE produto(
	idProduto INT AUTO_INCREMENT PRIMARY KEY,
    pName VARCHAR(10) NOT NULL,
    classification_kids BOOLEAN DEFAULT FALSE,
    category ENUM('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') NOT NULL ,
    avaliation FLOAT DEFAULT 0 ,
    size VARCHAR(10)
);

CREATE TABLE tipoPagamento(
idPagamento INT PRIMARY KEY NOT NULL, 
nomePagamento VARCHAR(15)
);

CREATE TABLE pagamento(
	idClient INT,
    idPedido INT,
	dataPagamento date,
    PRIMARY KEY(idClient, idPedido),
    CONSTRAINT fk_pagamento_pedido FOREIGN KEY(idPedido) REFERENCES pedido(idPedido)
);

CREATE TABLE pedido(
	idPedido INT AUTO_INCREMENT PRIMARY KEY,
    idPedidoCliente INT,
    idTipoPagamento INT,
    statusPedido ENUM('Em processamento','Cancelado', 'Confirmado', 'Em Separação', 'Enviado', 'Entregue') DEFAULT 'Em processamento',
    codigo_rastreamento CHAR(12),
    valorPedido INT NOT NULL,
    frete FLOAT DEFAULT 10, 
    CONSTRAINT fk_pedido_client FOREIGN KEY(idPedidoCliente) REFERENCES clients(idClient),
    CONSTRAINT fk_pagamento_tipoPagamento FOREIGN KEY(idTipoPagamento) REFERENCES tipoPagamento(idPagamento)
);

CREATE TABLE estoque(
	idEstoque INT AUTO_INCREMENT PRIMARY KEY,
    quantidade INT NOT NULL DEFAULT 0,
    localizacao VARCHAR(255) NOT NULL,
    idProduto INT,
    CONSTRAINT fk_produto_estoque FOREIGN KEY(idProduto) REFERENCES produto(idProduto)
);

CREATE TABLE fornecedor(
	idFornecedor INT AUTO_INCREMENT PRIMARY KEY,
    cnpj CHAR(15) UNIQUE NOT NULL,
	nome_social VARCHAR(255) NOT NULL,
    contato VARCHAR(15) NOT NULL
);

CREATE TABLE vendedor(
	idVendedor INT AUTO_INCREMENT PRIMARY KEY,
	nome_social VARCHAR(255) NOT NULL,
    localizacao VARCHAR(255) NOT NULL,
	cpf CHAR(11) UNIQUE NOT NULL,
    cnpj CHAR(15) UNIQUE NOT NULL,
	contato VARCHAR(15) NOT NULL
);

CREATE TABLE produto_vendedor(
	idProduto INT,
    idVendedor INT,
    quantidade INT NOT NULL,
    PRIMARY KEY(idProduto, idVendedor),
    CONSTRAINT fk_produto FOREIGN KEY(idProduto) REFERENCES produto(idProduto),
    CONSTRAINT fk_vendedor FOREIGN KEY(idVendedor) REFERENCES vendedor(idVendedor)
);

CREATE TABLE produto_fornecedor(
	idProduto INT,
    idFornecedor INT,
    quantidade INT NOT NULL,
    PRIMARY KEY(idProduto, idFornecedor),
    CONSTRAINT fk_produto_fornecedor FOREIGN KEY(idProduto) REFERENCES produto(idProduto),
    CONSTRAINT fk_fornecedor FOREIGN KEY(idFornecedor) REFERENCES fornecedor(idFornecedor)
);

CREATE TABLE produto_estoque(
	idProduto INT,
    idEstoque INT,
    quantidade INT NOT NULL,
	PRIMARY KEY(idProduto, idEstoque),
	CONSTRAINT fk_produto_estoque_n FOREIGN KEY(idProduto) REFERENCES produto(idProduto),
    CONSTRAINT fk_estoque FOREIGN KEY(idEstoque) REFERENCES estoque(idEstoque)
);

CREATE TABLE produto_pedido(
	idProduto INT,
    idPedido INT, 
    quantidade INT NOT NULL,
    disponibilidade ENUM('Disponível', 'Sem Estoque') DEFAULT 'Disponível',
    PRIMARY KEY(idProduto,idPedido),
    CONSTRAINT fk_produto_pedido FOREIGN KEY(idProduto) REFERENCES produto(idProduto),
    CONSTRAINT fk_pedido FOREIGN KEY(idPedido) REFERENCES pedido(idPedido)
);

