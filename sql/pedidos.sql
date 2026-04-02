use ecommerce;

CREATE TABLE pedidos (
    pedido_id INT PRIMARY KEY,
    cliente_id INT,
    data_compra DATE,
    valor_total DECIMAL(10,2),
    status_pedido VARCHAR(50),
    metodo_pagamento VARCHAR(50),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);
INSERT INTO pedidos (pedido_id, cliente_id, data_compra, valor_total, status_pedido, metodo_pagamento)
SELECT 
    f.pedido_id, 
    ANY_VALUE(c.cliente_id), 
    ANY_VALUE(f.data_compra), 
    ANY_VALUE(f.valor_total), 
    ANY_VALUE(f.status_pedido),
    ANY_VALUE(metodo_pagamento)
FROM pedidos_ecommerce f
JOIN clientes c ON f.cpf = c.cpf
GROUP BY f.pedido_id; 

UPDATE pedidos p JOIN pedidos_ecommerce f ON p.pedido_id = f.pedido_id SET p.metodo_pagamento = f.metodo_pagamento;
SELECT * FROM pedidos;