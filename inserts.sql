-- Persistindo Dados

INSERT INTO clients (pjorpf, Fname, Minit, Lname, CPF, CNPJ, Adress)
VALUES 
('PF', 'Lucas', 'A.', 'Silva', '12345678901', NULL, 'Rua das Flores, 100'),
('PF', 'Mariana', 'B.', 'Oliveira', '23456789012', NULL, 'Av. Brasil, 500'),
('PF', 'Carlos', 'C.', 'Santos', '34567890123', NULL, 'Rua das Acácias, 120'),
('PJ', 'Tech', 'LT', 'DA', NULL, '11122233000100', 'Av. Paulista, 1500'),
('PJ', 'Market', 'MX', 'BR', NULL, '44455566000199', 'Rua Comercial, 200');

INSERT INTO produto (pName, classification_kids, category, avaliation, size)
VALUES 
('Fone Bluetooth', FALSE, 'Eletrônico', 4.5, 'Único'),
('Smart TV 50', FALSE, 'Eletrônico', 4.8, '50pol'),
('Tênis Esportivo', FALSE, 'Vestimenta', 4.6, '42'),
('Jaqueta Couro', FALSE, 'Vestimenta', 4.7, 'M'),
('Quebra-Cabeça 1000pçs', TRUE, 'Brinquedos', 4.3, 'Único'),
('Carrinho Controle', TRUE, 'Brinquedos', 4.4, 'Pequeno'),
('Caixa de Bombom', FALSE, 'Alimentos', 4.5, '300g'),
('Leite Integral', FALSE, 'Alimentos', 4.2, '1L'),
('Mesa Escritório', FALSE, 'Móveis', 4.6, '1.20m'),
('Cama Solteiro', FALSE, 'Móveis', 4.1, '1.90m');

INSERT INTO tipoPagamento (idPagamento, nomePagamento)
VALUES 
(1, 'Cartão Crédito'),
(2, 'Boleto'),
(3, 'Pix'),
(4, 'Cartão Débito'),
(5, 'Transferência');

INSERT INTO estoque (quantidade, localizacao, idProduto)
VALUES 
(10, 'Depósito SP', 1),
(20, 'Depósito RJ', 2),
(15, 'Depósito MG', 3),
(8, 'Depósito BA', 4),
(12, 'Depósito PR', 5);

INSERT INTO fornecedor (cnpj, nome_social, contato)
VALUES 
('11111111000199', 'Fornecedor Eletrônicos XYZ', '11999999999'),
('22222222000188', 'Moda & Estilo Ltda', '21988888888'),
('33333333000177', 'Brinquedos Mundo Feliz', '31977777777'),
('44444444000166', 'Alimentos Pura Vida', '41966666666'),
('55555555000155', 'Móveis Décor', '51955555555');

INSERT INTO vendedor (nome_social, localizacao, cpf, cnpj, contato)
VALUES 
('José Silva', 'São Paulo', '98765432100', '10101010000199', '11988888888'),
('Ana Costa', 'Rio de Janeiro', '87654321000', '20202020000188', '21977777777'),
('Carlos Pereira', 'Belo Horizonte', '76543210900', '30303030000177', '31966666666'),
('Fernanda Lima', 'Salvador', '65432109800', '40404040000166', '71955555555'),
('Ricardo Martins', 'Curitiba', '54321098700', '50505050000155', '41944444444');

INSERT INTO pedido (idPedidoCliente, idTipoPagamento, statusPedido, codigo_rastreamento, valorPedido, frete)
VALUES 
(1, 1, 'Em processamento', 'R123456789SP', 3200, 20),
(2, 2, 'Confirmado', 'R987654321RJ', 60, 10),
(3, 3, 'Enviado', 'R456789123MG', 200, 15),
(4, 4, 'Cancelado', 'R321654987BA', 5000, 30),
(5, 5, 'Entregue', 'R654987321PR', 100, 5);


INSERT INTO pagamento (idClient, idPedido, dataPagamento)
VALUES 
(1, 1, '2025-04-17'),
(2, 2, '2025-04-17'),
(3, 3, '2025-04-16'),
(4, 4, '2025-04-15'),
(5, 5, '2025-04-14');

INSERT INTO produto_pedido (idProduto, idPedido, quantidade, disponibilidade)
VALUES 
(1, 1, 1, 'Disponível'),
(2, 2, 2, 'Disponível'),
(3, 3, 3, 'Sem Estoque'),
(4, 4, 1, 'Disponível'),
(5, 5, 1, 'Disponível');

INSERT INTO produto_estoque (idProduto, idEstoque, quantidade)
VALUES 
(1, 1, 10),
(2, 2, 20),
(3, 3, 15),
(4, 4, 8),
(5, 5, 12);

INSERT INTO produto_fornecedor (idProduto, idFornecedor, quantidade)
VALUES 
(1, 1, 5),
(2, 2, 10),
(3, 3, 8),
(4, 4, 3),
(5, 5, 6);

INSERT INTO produto_vendedor (idProduto, idVendedor, quantidade)
VALUES 
(1, 1, 3),
(2, 2, 5),
(3, 3, 7),
(4, 4, 2),
(5, 5, 4);



