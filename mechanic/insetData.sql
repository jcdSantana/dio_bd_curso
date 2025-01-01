USE mechanic;Z
-- Populando a tabela `clients`
INSERT INTO clients (type, address, contact) 
VALUES 
('PF', '123 Main St, City A', '12345678901'),
('PJ', '456 Elm St, City B', '98765432109'),
('PF', '789 Willow Ave, City D', '11223344556'),
('PJ', '101 Birch Blvd, City E', '99887766554'),
('PF', '345 Spruce Lane, City F', '22334455667');

-- Populando a tabela `client_pf`
INSERT INTO client_pf (id_client, first_name, last_name, cpf, gender)
VALUES 
(1, 'John', 'Doe', '12345678900', 'M'),
(3, 'Jane', 'Smith', '98765432100', 'F'),
(5, 'Bob', 'Williams', '45678901234', 'M');

-- Populando a tabela `client_pj`
INSERT INTO client_pj (id_client, corporate_name, cnpj)
VALUES 
(2, 'Tech Solutions Ltd.', '12345678000199'), 
(4, 'Green Solutions Inc.', '23456789000188');

-- Populando a tabela `mechanic_team`
INSERT INTO mechanic_team (team_name, creation_date, description)
VALUES 
('Engine Experts', '2023-05-15', 'Specialists in engine diagnostics and repairs'),
('Transmission Masters', '2022-11-01', 'Focus on transmission systems and maintenance'),
('Suspension Wizards', '2024-03-10', 'Experts in suspension and alignment services');

-- Populando a tabela `car`
INSERT INTO car (id_client, id_mechanic_team, model, vin, license_plate)
VALUES 
(1, 1, 'Toyota Corolla', '1HGCM82633A123456', 'ABC1234'),
(2, 2, 'Ford Focus', '2HGES16585H543210', 'XYZ5678'),
(3, 3, 'Honda Civic', '1HGCM82633A654321', 'DEF5678'),
(4, 1, 'Chevrolet Cruze', '2HGES16585H876543', 'GHI1234'),
(1, 3, 'Fiat UNO', '3HGES29555H123876', 'JIL8901'),
(1, 2, 'Nissan Altima', '9LNBS16585H984076', 'IKL6701'),
(3, 2, 'Nissan Altima', '4KGFS60585I533876', 'NJL8984');


-- Populando a tabela `mechanic`
INSERT INTO mechanic (id_mechanic_team, first_name, last_name, address, expertise)
VALUES 
(1, 'Mike', 'Brown', '789 Oak St, City A', 'ENGINE'),
(1, 'Sarah', 'Connor', '321 Pine St, City A', 'BRAKES'),
(2, 'Tom', 'Holland', '654 Maple St, City B', 'DIAGNOSTICS'),
(3, 'Anna', 'Taylor', '987 Cedar St, City C', 'ELECTRICAL'),
(2, 'James', 'Brown', '567 Cherry Rd, City G', 'TRANSMISSION'),
(3, 'Emily', 'Clark', '432 Fir St, City H', 'SUSPENSION'),
(1, 'Sophia', 'Davis', '876 Maple Rd, City A', 'BODYWORK'),
(2, 'Daniel', 'Wilson', '543 Cedar Ave, City B', 'TIRES');

-- Populando a tabela `service_order`
INSERT INTO service_order (closing_date, issue_date, id_mechanic_team)
VALUES 
('2025-01-05', '2025-01-01', 1),
('2025-01-06', '2025-01-02', 2),
('2025-01-07', '2025-01-03', 3),
('2025-01-08', '2025-01-04', 2);

-- Populando a tabela `so_has_client`
INSERT INTO so_has_client (id_client, id_service_order)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(5, 4);

-- Populando a tabela `part`
INSERT INTO part (part_name, description, price)
VALUES 
('Oil Filter', 'High-performance oil filter', 20.50),
('Brake Pads', 'Front and rear brake pads', 120.00),
('Tire', 'All-season tire', 75.99),
('Spark Plug', 'High-performance spark plug', 15.99),
('Air Filter', 'Premium air filter', 25.50),
('Battery', '12V car battery', 150.00);

-- Populando a tabela `service`
INSERT INTO service (service_name, description, price)
VALUES 
('Oil Change', 'Complete oil and filter change', 50.00),
('Brake Replacement', 'Replacement of front and rear brake pads', 200.00),
('Tire Rotation', 'Rotating tires for even wear', 40.00),
('Battery Replacement', 'Replacing the car battery', 100.00),
('Wheel Alignment', 'Aligning wheels for optimal performance', 80.00),
('Engine Diagnostic', 'Complete engine health check', 120.00);


-- Populando a tabela `order_requires_part`
INSERT INTO order_requires_part (id_part, id_service_order)
VALUES 
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 3),
(6, 4);

-- Populando a tabela `order_requires_service`
INSERT INTO order_requires_service (id_service, id_service_order)
VALUES 
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 4),
(6, 4);