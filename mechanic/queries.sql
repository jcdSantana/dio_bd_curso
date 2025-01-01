use mechanic;

-- Mostra os clientes e o seus carros
SELECT combined_clients.Name, model 
FROM ( 
    SELECT CONCAT(first_name, ' ', last_name) AS Name, c.id_client
    FROM clients c 
    JOIN client_pf pf ON c.id_client = pf.id_client
    UNION
    SELECT corporate_name AS Name, c.id_client
    FROM clients c 
    JOIN client_pj pj ON c.id_client = pj.id_client
) AS combined_clients
JOIN car c on combined_clients.id_client = c.id_client;


-- Selecionar todos os serviços e seus preços
SELECT service_name, CONCAT(price, 'R$') FROM service;

-- Recuperar todas as ordens de serviço fechadas após 06 de janeiro de 2025.
SELECT so.id_service_order, so.closing_date
FROM service_order AS so
WHERE so.closing_date > '2025-01-06';

-- Calcular o custo total de todas as peças usadas em cada ordem de serviço.
SELECT id_service_order, round(SUM(price), 2) as preco_total_parts  
FROM service_order
JOIN order_requires_part USING(id_service_order)
JOIN part USING (id_part)
GROUP BY id_service_order;

-- Listar os mecânicos ordenados por nome e, em caso de empate, pelo sobrenome.
SELECT CONCAT(first_name, ' ', last_name) as nome, expertise
FROM mechanic
ORDER BY first_name, last_name;

-- Encontrar equipes de mecânicos que trabalharam em mais de 2 ordens de serviço.
SELECT mt.team_name, count(*) AS total_orders
FROM mechanic_team mt
JOIN service_order so using(id_mechanic_team)
GROUP BY mt.id_mechanic_team
HAVING total_orders >= 2;  

-- Listar todas as ordens de serviço, o nome da equipe responsável e os serviços realizados em cada 
SELECT so.id_service_order, mt.team_name, GROUP_CONCAT(s.service_name ORDER BY s.service_name) AS servicos
FROM service_order so
JOIN mechanic_team mt USING(id_mechanic_team)
JOIN order_requires_service ors USING(id_service_order)
JOIN service s USING(id_service)
GROUP BY so.id_service_order, mt.team_name;