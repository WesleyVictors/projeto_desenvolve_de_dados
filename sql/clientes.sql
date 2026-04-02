USE ecommerce;
CREATE TABLE clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE, 
    cidade VARCHAR(100),
    estado CHAR(2),
    rua VARCHAR(150),
    numero INT,
    bairro VARCHAR(100),
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO clientes (nome, cpf, cidade, estado, rua, numero, bairro) 
SELECT 
    ANY_VALUE(cliente), 
    cpf,                
    ANY_VALUE(cidade), 
    ANY_VALUE(estado), 
    ANY_VALUE(rua), 
    ANY_VALUE(numero), 
    ANY_VALUE(bairro)
FROM pedidos_ecommerce WHERE cpf IS NOT NULL AND cpf != '' GROUP BY cpf;
SELECT * FROM clientes;

   