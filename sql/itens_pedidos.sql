USE ecommerce;
CREATE TABLE itens_pedido (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    produto_id INT,
    quantidade INT,
    valor_unitario_na_epoca DECIMAL(10,2), 
    FOREIGN KEY (pedido_id) REFERENCES pedidos(pedido_id),
    FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, valor_unitario_na_epoca)
SELECT 
    f.pedido_id, 
    p.produto_id, 
    f.quantidade, 
    f.valor_unitario
FROM pedidos_ecommerce f
JOIN produtos p ON f.produto = p.nome_produto;
SELECT * FROM itens_pedido;