use ecommerce;

-- Quantos pedidos foram feitos por cada cliente?
SELECT CONCAT(c.Fname, ' ', c.Lname) nome_completo, COUNT(*) qntd_pedido
FROM clients c
INNER JOIN pedido p
ON c.idClient = p.idPedidoCliente
GROUP BY c.Fname, c.Lname;

-- Algum vendedor também é fornecedor?
SELECT v.nome_social 
FROM vendedor v
INNER JOIN fornecedor f
ON v.cnpj = f.cnpj;

-- Relação PRODUTO, FORNECEDOR E ESTOQUE
SELECT p.Pname nome_produto, f.nome_social fornecedor, e.quantidade, e.localizacao loc_estoque
	FROM produto_fornecedor pf
    INNER JOIN produto p 
    ON pf.idProduto = p.idProduto
    INNER JOIN fornecedor f 
    ON pf.idFornecedor = f.idFornecedor
    INNER JOIN estoque e 
    ON p.idProduto = e.idProduto;
    
-- Relação de nomes dos fornecedores e nomes dos produtos
	SELECT p.Pname nome_produto, f.nome_social nome_fornecedor
		FROM produto p
        INNER JOIN produto_fornecedor pf
        ON p.idProduto = pf.idProduto
        INNER JOIN fornecedor f 
        ON pf.idFornecedor = f.idFornecedor
        ORDER BY p.Pname DESC;

-- Qual tipo de pgamento é mais utilizado?
SELECT tp.nomePagamento tipo_pagamento, COUNT(DISTINCT pe.idTipoPagamento) as total_pedidos
FROM pedido pe
INNER JOIN tipopagamento tp
ON pe.idTipoPagamento = tp.idPagamento
GROUP BY tp.nomePagamento;
    
     
