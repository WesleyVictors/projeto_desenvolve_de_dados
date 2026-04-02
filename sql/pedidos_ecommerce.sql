USE ecommerce;
CREATE TABLE pedidos_ecommerce (
    pedido_id INT,
    cliente_id INT,
    cliente VARCHAR(100),
    cpf VARCHAR(11),
    produto_id INT,
    produto VARCHAR(150),
    marca VARCHAR(100),
    categoria VARCHAR(100),
    quantidade INT,
    valor_unitario DECIMAL(10,2),
    frete DECIMAL(10,2),
    cupom_desconto INT,
    canal_marketing VARCHAR(50),
    cidade VARCHAR(100),
    estado VARCHAR(2),
    rua VARCHAR(150),
    numero INT,
    bairro VARCHAR(100),
    data_compra VARCHAR(20),
    hora_compra VARCHAR(20),
    metodo_pagamento VARCHAR(50),
    status_pedido VARCHAR(50),
    valor_total DECIMAL(10,2),
    lucro DECIMAL(10,2),
    data_compra_limpa DATETIME,
    hora_compra_limpa TIME
);
ALTER TABLE pedidos_ecommerce MODIFY cpf CHAR(11);
ALTER TABLE pedidos_ecommerce MODIFY estado VARCHAR(10);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ecommerce_data.csv'
INTO TABLE pedidos_ecommerce
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
pedido_id,
cliente_id,
cliente,
cpf,
produto_id,
produto,
marca,
categoria,
quantidade,
valor_unitario,
frete,
cupom_desconto,
canal_marketing,
cidade,
estado,
rua,
numero,
bairro,
metodo_pagamento,
status_pedido,
valor_total,
lucro,
data_compra,
hora_compra
);
SHOW VARIABLES LIKE 'local_infile';
SHOW VARIABLES LIKE 'secure_file_priv';
SELECT * FROM pedidos_ecommerce;
ALTER TABLE pedidos_ecommerce DROP COLUMN data_compra_limpa, DROP COLUMN hora_compra_limpa;
SELECT * FROM pedidos_ecommerce;

SELECT *  FROM pedidos_ecommerce WHERE produto_id = 517;

SELECT produto_id, MIN(produto) AS produto FROM pedidos_ecommerce GROUP BY produto_id ORDER BY produto_id;
SELECT DISTINCT produto FROM pedidos_ecommerce WHERE produto NOT IN 
('Monitor LG UltraWide 34','Teclado Logitech MX','Samsung Galaxy Tab S9','Dell XPS 13','MacBook Air M2','iPhone 15 Pro')
ORDER BY produto ASC;  

UPDATE pedidos_ecommerce SET produto_id = NULL;
SET SQL_SAFE_UPDATES = 0;
UPDATE pedidos_ecommerce 
SET produto_id = NULL
WHERE produto_id IS NOT NULL;
SELECT produto_id, produto FROM pedidos_ecommerce;

CREATE TEMPORARY TABLE id_produtos AS SELECT ROW_NUMBER() OVER (ORDER BY produto) AS novo_id, produto
FROM (
    SELECT 'Monitor LG UltraWide 34' AS produto
    UNION ALL SELECT 'Teclado Logitech MX'
    UNION ALL SELECT 'Samsung Galaxy Tab S9'
    UNION ALL SELECT 'Dell XPS 13'
    UNION ALL SELECT 'MacBook Air M2'
    UNION ALL SELECT 'iPhone 15 Pro'
) AS lista; 

UPDATE pedidos_ecommerce t JOIN id_produtos m ON t.produto = m.produto SET t.produto_id = m.novo_id;
SELECT produto_id, produto FROM pedidos_ecommerce;
SET SQL_SAFE_UPDATES = 1;
SELECT * FROM pedidos_ecommerce;	



CREATE USER 'django_user'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON ecommerce.* TO 'django_user'@'localhost';
CREATE USER 'powerbi_user'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON ecommerce.* TO 'powerbi_user'@'localhost';
FLUSH PRIVILEGES;

