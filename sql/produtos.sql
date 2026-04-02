use ecommerce;
CREATE TABLE produtos (
    produto_id INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(150) NOT NULL UNIQUE,
    marca VARCHAR(50),
    categoria VARCHAR(50),
    preco_unitario_atual DECIMAL(10,2)
);

INSERT INTO produtos (nome_produto, marca, categoria, preco_unitario_atual)
SELECT 
    produto, 
    ANY_VALUE(marca), 
    ANY_VALUE(categoria), 
    ANY_VALUE(valor_unitario)
FROM pedidos_ecommerce WHERE produto IS NOT NULL GROUP BY produto;
SELECT * FROM produtos;