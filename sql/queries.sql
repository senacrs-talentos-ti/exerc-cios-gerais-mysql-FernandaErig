USE padaria;

CREATE DATABASE Padaria;

use padaria;

CREATE TABLE Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    email VARCHAR (50)
);

use padaria;


CREATE TABLE PRODUCTS (
    id int primary key auto_increment,
    name varchar(233) NOT NULL,
    PRINCE DECIMAL(10, 2) NOT NULL
);

use padaria;

CREATE TABLE ORDERS (
    id INT,
    cliente_id INT,
    ordem_date INT NOT NULL,
    total DECIMAL(10) NOT NULL
    );

use padaria;


CREATE TABLE ORDER_ITEMS (
    ordem_id INT,
    produto_id INT,
    quantidade INT NOT NULL,
    price DECIMAL(10) NOT NULL,
    PRIMARY KEY (ordem_id, produto_id),
    FOREIGN KEY (ordem_id) REFERENCES ORDERS(id),
    FOREIGN KEY (produto_id) REFERENCES PRODUCTS(id)
);


USE padaria;

INSERT INTO CLIENTES (id, nome, email) VALUES
('Ana Silva', 'ana@gmail.com'),
('Bruno', 'bruno@gmail.com'),
('Carlos', 'carlos@gmail.com');

use padaria;

INSERT INTO products (id, name, price) VALUES
('1', 'Patel', '10'),
('2', 'Pão', '2'),
('3', 'Refri', '7');

use padaria;

INSERT INTO ORDERS (id, cliente_id, ordem_date, total) VALUES
(1, 1, '2024-07-01', 10),
(2, 2, '2024-07-02',2),
(3, 3, '2024-07-03', 7);

use padaria;

INSERT INTO order_items (ordem_id, produto_id, quantidade, price) VALUES
(1, 1, '1', 10),
(2, 2, '1',2),
(3, 3, '1', 7);

use padaria;

UPDATE ORDER_ITEMS padaria 
JOIN PRODUCTS padaria ON padaria.product_id = price.product_id
SET padaria.price = padaria.price
WHERE padaria.product_id = price;

DELETE FROM clientes
WHERE id = 1;

DELETE FROM products
WHERE produtcts.id = 1;

ALTER TABLE clientes 
ADD COLUMN BRITHDATA VARCHAR(15);

SELECT 
    ORDERS.id AS order_id,
    CLIENTS.name AS client_name,
    PRODUCTS.name AS product_name
FROM ORDERS
JOIN CLIENTS ON ORDERS.client_id = CLIENTS.id
JOIN ORDER_ITEMS ON ORDERS.id = ORDER_ITEMS.order_id
JOIN PRODUCTS ON ORDER_ITEMS.product_id = PRODUCTS.id;


SELECT 
    CLIENTS.name AS client_name,
    ORDERS.id AS order_id
FROM CLIENTS
LEFT JOIN ORDERS ON CLIENTS.id = ORDERS.client_id;


SELECT 
    PRODUCTS.name AS product_name,
    ORDERS.id AS order_id
FROM PRODUCTS
RIGHT JOIN ORDER_ITEMS ON PRODUCTS.id = ORDER_ITEMS.product_id
RIGHT JOIN ORDERS ON ORDER_ITEMS.order_id = ORDERS.id;


SELECT 
    SUM(ORDER_ITEMS.quantity * ORDER_ITEMS.price) AS total_sales,
    SUM(ORDER_ITEMS.quantity) AS total_quantity
FROM ORDER_ITEMS;

