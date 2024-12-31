CREATE SCHEMA IF NOT EXISTS ecommerce_project;

USE ecommerce_project;

CREATE TABLE client (
    id_client INT AUTO_INCREMENT,
    type ENUM('PF', 'PJ') NOT NULL,
    address VARCHAR(255),
    contact CHAR(11) NOT NULL,
    CONSTRAINT pk_client PRIMARY KEY (id_client)
);

CREATE TABLE client_pf (
    id_client INT,
    f_name VARCHAR(50) NOT NULL, 
    l_name VARCHAR(50) NOT NULL, 
    cpf CHAR(11) NOT NULL, 
    sex ENUM('M', 'F', 'O'),
    CONSTRAINT pk_client_pf PRIMARY KEY (id_client),
    CONSTRAINT unique_cpf UNIQUE (cpf),
    CONSTRAINT fk_client_pf FOREIGN KEY (id_client) REFERENCES client (id_client) ON DELETE CASCADE
);

CREATE TABLE client_pj (
    id_client INT,
    social_name VARCHAR(255) NOT NULL, 
    cnpj CHAR(14) NOT NULL,
    CONSTRAINT pk_client_pj PRIMARY KEY (id_client),
    CONSTRAINT unique_cnpj UNIQUE (cnpj),
    CONSTRAINT fk_client_pj FOREIGN KEY (id_client) REFERENCES client (id_client) ON DELETE CASCADE
);

CREATE TABLE product (
    id_product INT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    price FLOAT NOT NULL, 
    category ENUM('Eletronico', 'Vestimenta', 'Brinquedos', 'Alimentos') NOT NULL,
    classification_kids BOOL DEFAULT FALSE,
    rating FLOAT DEFAULT 0,
    description VARCHAR(255),
    CONSTRAINT pk_product PRIMARY KEY (id_product)
);

CREATE TABLE payment (
    id_payment INT AUTO_INCREMENT,
    id_client INT,
    type_payment ENUM('Boleto', 'PIX', 'Cartão crédito') NOT NULL,
    CONSTRAINT fk_payment_client FOREIGN KEY (id_client) REFERENCES client (id_client),
    CONSTRAINT pk_payment PRIMARY KEY (id_payment)
);

CREATE TABLE card (
    id_card INT AUTO_INCREMENT,
    id_payment INT,
    card_number CHAR(16) NOT NULL,
    expiration_date CHAR(4) NOT NULL,
    holder_name VARCHAR(120),
    csv VARCHAR(3),
    CONSTRAINT fk_card_payment FOREIGN KEY (id_payment) REFERENCES payment (id_payment),
    CONSTRAINT pk_card PRIMARY KEY (id_card)
);

CREATE TABLE orders (
    id_order INT AUTO_INCREMENT,
    id_client INT,
    freight FLOAT NOT NULL DEFAULT 0,
    id_payment INT,
    order_description VARCHAR(255),
    order_status ENUM('Processando', 'Enviado', 'Entregue') NOT NULL DEFAULT 'Processando',
    CONSTRAINT fk_orders_client FOREIGN KEY (id_client) REFERENCES client (id_client), 
    CONSTRAINT fk_orders_payment FOREIGN KEY (id_payment) REFERENCES payment (id_payment), 
    CONSTRAINT pk_orders PRIMARY KEY (id_order)
);


CREATE TABLE storage_location (
    id_storage_location INT AUTO_INCREMENT,
    location varchar(255),
    CONSTRAINT pk_storage_location PRIMARY KEY (id_storage_location)
);
CREATE TABLE product_storage (
    id_storage_location INT,
    id_product INT,
    quantity INT DEFAULT 0,
    CONSTRAINT fk_product_storage_product FOREIGN KEY (id_product) REFERENCES product (id_product),
    CONSTRAINT fk_product_storage_location FOREIGN KEY (id_storage_location) REFERENCES storage_location (id_storage_location),
    CONSTRAINT pk_product_storage PRIMARY KEY (id_product, id_storage_location)
);

CREATE TABLE product_order (
    id_order INT,
    id_product INT,
    discount FLOAT DEFAULT 0,
    po_quantity INT DEFAULT 1, 
    CONSTRAINT fk_product_order_order FOREIGN KEY (id_order) REFERENCES orders (id_order), 
    CONSTRAINT fk_product_order_product FOREIGN KEY (id_product) REFERENCES product (id_product), 
    CONSTRAINT pk_product_order PRIMARY KEY (id_order, id_product)
);

CREATE TABLE supplier (
    id_supplier INT AUTO_INCREMENT,
    cnpj CHAR(14) NOT NULL,
    social_name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    contact CHAR(11) NOT NULL,
    CONSTRAINT unique_supplier_cnpj UNIQUE (cnpj),
    CONSTRAINT pk_supplier PRIMARY KEY (id_supplier)
);

CREATE TABLE product_supplier (
    id_ps_supplier INT,
    id_ps_product INT,
    quantity INT NOT NULL,
    CONSTRAINT fk_ps_product FOREIGN KEY (id_ps_product) REFERENCES product (id_product), 
    CONSTRAINT fk_ps_supplier FOREIGN KEY (id_ps_supplier) REFERENCES supplier (id_supplier), 
    CONSTRAINT pk_product_supplier PRIMARY KEY (id_ps_supplier, id_ps_product)
);

CREATE TABLE seller (
    id_seller INT AUTO_INCREMENT,
    type ENUM('PF', 'PJ') NOT NULL,
    address VARCHAR(255),
    contact CHAR(11) NOT NULL,
    name VARCHAR(255) NOT NULL,
    CONSTRAINT pk_seller PRIMARY KEY (id_seller)
);

CREATE TABLE seller_pf (
    id_seller INT,
    cpf CHAR(11) NOT NULL,
    CONSTRAINT pk_seller_pf PRIMARY KEY (id_seller),
    CONSTRAINT unique_seller_cpf UNIQUE (cpf),
    CONSTRAINT fk_seller_pf FOREIGN KEY (id_seller) REFERENCES seller (id_seller) ON DELETE CASCADE
);

CREATE TABLE seller_pj (
    id_seller INT,
    cnpj CHAR(14) NOT NULL,
    CONSTRAINT pk_seller_pj PRIMARY KEY (id_seller),
    CONSTRAINT unique_seller_cnpj UNIQUE (cnpj),
    CONSTRAINT fk_seller_pj FOREIGN KEY (id_seller) REFERENCES seller (id_seller) ON DELETE CASCADE
);

CREATE TABLE product_seller (
    id_seller INT,
    id_product INT,
    pro_quantity INT DEFAULT 1,
    pro_status ENUM('Disponível', 'Sem Estoque') DEFAULT 'Disponível',
    CONSTRAINT fk_product_seller_seller FOREIGN KEY (id_seller) REFERENCES seller (id_seller) ON DELETE CASCADE,
    CONSTRAINT fk_product_seller_product FOREIGN KEY (id_product) REFERENCES product (id_product) ON DELETE CASCADE,
    CONSTRAINT pk_product_seller PRIMARY KEY (id_seller, id_product)
);
SHOW TABLES;