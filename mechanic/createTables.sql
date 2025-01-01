CREATE SCHEMA IF NOT EXISTS mechanic;

USE mechanic;

CREATE TABLE clients (
    id_client INT AUTO_INCREMENT,
    type ENUM('PF', 'PJ') NOT NULL,
    address VARCHAR(255),
    contact CHAR(11) NOT NULL,
    CONSTRAINT pk_client PRIMARY KEY (id_client)
);

CREATE TABLE client_pf (
    id_client INT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    cpf CHAR(11) NOT NULL,
    gender ENUM('M', 'F', 'O'),
    CONSTRAINT pk_client_pf PRIMARY KEY (id_client),
    CONSTRAINT unique_cpf UNIQUE (cpf),
    CONSTRAINT fk_client_pf FOREIGN KEY (id_client) REFERENCES clients (id_client) ON DELETE CASCADE
);

CREATE TABLE client_pj (
    id_client INT,
    corporate_name VARCHAR(255) NOT NULL,
    cnpj CHAR(14) NOT NULL,
    CONSTRAINT pk_client_pj PRIMARY KEY (id_client),
    CONSTRAINT unique_cnpj UNIQUE (cnpj),
    CONSTRAINT fk_client_pj FOREIGN KEY (id_client) REFERENCES clients (id_client) ON DELETE CASCADE
);

CREATE TABLE mechanic_team (
    id_mechanic_team INT AUTO_INCREMENT,
    team_name VARCHAR(50) NOT NULL,
    creation_date DATE NOT NULL,
    description VARCHAR(255),
    CONSTRAINT pk_mechanic_team PRIMARY KEY (id_mechanic_team)
);

CREATE TABLE car (
    id_car INT AUTO_INCREMENT,
    id_client INT,
    id_mechanic_team INT,
    model VARCHAR(40),
    vin CHAR(17),
    license_plate CHAR(7),
    CONSTRAINT unique_license_plate UNIQUE (license_plate),
    CONSTRAINT unique_vin UNIQUE (vin),
    CONSTRAINT pk_car PRIMARY KEY (id_car),
    CONSTRAINT fk_client_car FOREIGN KEY (id_client) REFERENCES clients (id_client),
    CONSTRAINT fk_mt_car FOREIGN KEY (id_mechanic_team) REFERENCES mechanic_team (id_mechanic_team)
);

CREATE TABLE mechanic (
    id_mechanic INT AUTO_INCREMENT,
    id_mechanic_team INT,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    address VARCHAR(255),
    expertise ENUM(
        'ENGINE',
        'TRANSMISSION',
        'ELECTRICAL',
        'SUSPENSION',
        'BRAKES',
        'BODYWORK',
        'DIAGNOSTICS',
        'TIRES'
    ) NOT NULL,
    CONSTRAINT pk_mechanic PRIMARY KEY (id_mechanic),
    CONSTRAINT fk_mt_mechanic FOREIGN KEY (id_mechanic_team) REFERENCES mechanic_team (id_mechanic_team)
);

CREATE TABLE service_order (
    id_service_order INT AUTO_INCREMENT,
    closing_date DATE NOT NULL,
    issue_date DATE NOT NULL,
    id_mechanic_team INT,
    CONSTRAINT pk_service_order PRIMARY KEY (id_service_order),
    CONSTRAINT fk_mt_so FOREIGN KEY (id_mechanic_team) REFERENCES mechanic_team (id_mechanic_team)
);

CREATE TABLE so_has_client (
    id_client INT,
    id_service_order INT,
    CONSTRAINT fk_client_shc FOREIGN KEY (id_client) REFERENCES clients (id_client),
    CONSTRAINT fk_so_shc FOREIGN KEY (id_service_order) REFERENCES service_order (id_service_order),
    CONSTRAINT pk_service_order_has_client PRIMARY KEY (id_client, id_service_order)
);

CREATE TABLE part (
    id_part INT AUTO_INCREMENT,
    part_name VARCHAR(40) NOT NULL,
    description VARCHAR(255),
    price FLOAT,
    CONSTRAINT pk_part PRIMARY KEY (id_part)
);

CREATE TABLE service (
    id_service INT AUTO_INCREMENT,
    service_name VARCHAR(40) NOT NULL,
    description VARCHAR(255),
    price FLOAT,
    CONSTRAINT pk_service PRIMARY KEY (id_service)
);

CREATE TABLE order_requires_part (
    id_part INT,
    id_service_order INT,
    CONSTRAINT fk_part_orp FOREIGN KEY (id_part) REFERENCES part (id_part),
    CONSTRAINT fk_so_orp FOREIGN KEY (id_service_order) REFERENCES service_order (id_service_order),
    CONSTRAINT pk_order_requires_part PRIMARY KEY (id_part, id_service_order)
);

CREATE TABLE order_requires_service (
    id_service INT,
    id_service_order INT,
    CONSTRAINT fk_service_ors FOREIGN KEY (id_service) REFERENCES service (id_service),
    CONSTRAINT fk_so_ors FOREIGN KEY (id_service_order) REFERENCES service_order (id_service_order),
    CONSTRAINT pk_order_requires_service PRIMARY KEY (id_service, id_service_order)
);