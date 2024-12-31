USE ecommerce;

-- Populando a tabela client
INSERT INTO clients (type, address, contact) VALUES
('PF', 'Rua das Flores, 123', '11987654321'),
('PJ', 'Av. Empresarial, 456', '21987654321'),
('PF', 'Praça Central, 789', '31987654321'),
('PF', 'Rua do Sol, 456', '21912345678'),
('PJ', 'Av. das Indústrias, 987', '31912345678'),
('PF', 'Rua das Palmeiras, 222', '41912345678'),
('PJ', 'Av. Comercial, 654', '51912345678'),
('PF', 'Praça da Alegria, 100', '61912345678');

-- Populando a tabela client_pf
INSERT INTO client_pf (id_client, f_name, l_name, cpf, sex) VALUES
(1, 'João', 'Silva', '12345678901', 'M'),
(3, 'Maria', 'Oliveira', '98765432109', 'F'),
(4, 'Lucas', 'Fernandes', '45678912345', 'M'),
(6, 'Ana', 'Costa', '32165498712', 'F'),
(8, 'Carlos', 'Pereira', '78945612333', 'M');

-- Populando a tabela client_pj
INSERT INTO client_pj (id_client, social_name, CNPJ) VALUES
(2, 'Tech Solutions Ltda', '123456780001'),
(5, 'Construtora Alpha Ltda', '876543210001'),
(7, 'Fábrica Beta', '6543219870001');

-- Populando a tabela product
INSERT INTO product (product_name, price, category, classification_kids, rating, description) VALUES
('Smartphone', 1500.00, 'eletronico', FALSE, 4.5, 'Smartphone com tela AMOLED'),
('Camiseta', 50.00, 'vestimenta', FALSE, 4.0, 'Camiseta de algodão'),
('Boneca', 30.00, 'brinquedos', TRUE, 5.0, 'Boneca com acessórios'),
('Notebook', 2500.00, 'eletronico', FALSE, 4.7, 'Notebook com 16GB RAM'),
('Tênis Esportivo', 200.00, 'vestimenta', FALSE, 4.5, 'Tênis leve e confortável'),
('Jogo de Tabuleiro', 80.00, 'brinquedos', TRUE, 4.9, 'Jogo educativo para crianças'),
('Biscoitos', 10.00, 'alimentos', FALSE, 4.3, 'Biscoitos sabor chocolate');

-- Populando a tabela payment
INSERT INTO payment (id_client, type_payment) VALUES
(1, 'boleto'),
(2, 'pix'),
(3, 'cartão crédito'),
(4, 'pix'),
(5, 'cartão crédito'),
(6, 'boleto'),
(7, 'pix'),
(8, 'cartão crédito');

-- Populando a tabela card
INSERT INTO card (id_payment, card_number, expiration_date, holder_name, csv) VALUES
(3, '1234567812345678', '1225', 'João Silva', '123'),
(5, '9876543210987654', '1126', 'Ana Costa', '456'),
(7, '6543210987654321', '0626', 'Lucas Fernandes', '789'),
(8, '5678901234567890', '0425', 'Carlos Pereira', '321');

-- Populando a tabela orders
INSERT INTO orders (id_client, freight, id_payment, order_description, order_status) VALUES
(1, 20.00, 1, 'Compra de 1 Smartphone', 'processando'),
(3, 15.00, 3, 'Compra de 2 Camisetas', 'enviado'),
(4, 25.00, 4, 'Compra de 1 Notebook e 1 Tênis Esportivo', 'processando'),
(6, 10.00, 6, 'Compra de 2 Jogos de Tabuleiro', 'enviado'),
(7, 5.00, 7, 'Compra de 10 Biscoitos', 'entregue');

-- Populando a tabela product_orders
INSERT INTO product_order (id_order, id_product, discount, product_quantity) VALUES
(1, 1, 0, 1),  -- 1 Smartphone no pedido 1, sem desconto
(3, 2, 5, 2),  -- 2 Camisetas no pedido 3, com 5% de desconto
(4, 4, 0, 1),  -- 1 Notebook no pedido 4, sem desconto
(4, 5, 0, 1),  -- 1 Tênis Esportivo no pedido 4, sem desconto
(2, 6, 10, 2), -- 2 Jogos de Tabuleiro no pedido 6, com 10% de desconto
(5, 7, 0, 10); -- 10 pacotes de Biscoitos no pedido 7, sem desconto

-- Populando a tabela storage_location
INSERT INTO storage_location (id_storage_location, location) VALUES
(1, 'Depósito Central'),
(2, 'Armazém Zona Norte'),
(3, 'Galpão Sul'),
(4, 'Centro de Distribuição Oeste'),
(5, 'Depósito Leste');

-- Populando a tabela product_storage
INSERT INTO product_storage (id_storage_location, id_product, product_quantity) VALUES
(1, 1, 50),
(1, 2, 100),
(2, 3, 30),
(3, 4, 20),
(4, 5, 50),
(5, 6, 100),
(1, 7, 150),
(2, 4, 200);

-- Populando a tabela supplier
INSERT INTO supplier (cnpj, social_name, address, contact) VALUES
('23456789000188', 'Fornecedor Eletronicos', 'Rua Tech, 500', '11912345678'),
('34567890000177', 'Fornecedor Vestimenta', 'Av. Moda, 200', '21912345678'),
('34567812345677', 'Fornecedor Alimentos', 'Rua das Comidas, 456', '31987654321'),
('45678909876566', 'Fornecedor Brinquedos', 'Av. Diversão, 123', '41987654321');

-- Populando a tabela product_supplier
INSERT INTO product_supplier (id_ps_supplier, id_ps_product, quantity) VALUES
(1, 1, 100),
(2, 2, 200),
(3, 6, 300),
(4, 7, 400);

-- Populando a tabela seller
INSERT INTO seller (type, address, contact, name) VALUES
('PF', 'Rua Vendedores, 321', '12987654321', 'Carlos Vendas'),
('PJ', 'Av. Empresas, 654', '22987654321', 'Loja XYZ'),
('PF', 'Rua das Vendas, 123', '61987654321', 'Marcos Sales'),
('PJ', 'Av. Comercial, 654', '71987654321', 'Mega Store Ltda');

-- Populando a tabela seller_pf
INSERT INTO seller_pf (id_seller, cpf) VALUES
(1, '12312312300'),
(3, '98712365400');

-- Populando a tabela seller_pj
INSERT INTO seller_pj (id_seller, cnpj) VALUES
(2, '34567878000166'),
(4, '87654321000199');

-- Populando a tabela product_seller
INSERT INTO product_seller (id_seller, id_product, product_quantity, product_status) VALUES
(1, 1, 10, 'disponível'),
(2, 2, 5, 'disponível'),
(3, 4, 20, 'disponível'),
(4, 5, 50, 'disponível');
