USE ecommerce;
-- Quais são os nomes e preços de todos os produtos disponíveis?
SELECT product_name AS ProductName, price 
	FROM product;

-- Todos os clientes com seus respectivos contatos.
SELECT concat(f_name, ' ', l_name) AS name, contact 
	FROM clients c, client_pf pf WHERE c.id_client = pf.id_client
UNION
SELECT social_name AS name, contact  
	FROM clients c, client_pj AS pj WHERE c.id_client = pj.id_client;

-- Quais clientes residem em um endereço que contém a palavra "Avenida"?
SELECT Name, address 
FROM ( 
    SELECT CONCAT(f_name, ' ', l_name) AS Name, address 
    FROM clients c 
    JOIN client_pf pf ON c.id_client = pf.id_client
    UNION
    SELECT social_name AS Name, address 
    FROM clients c 
    JOIN client_pj pj ON c.id_client = pj.id_client
) AS combined_clients
WHERE address LIKE '%Av%';

-- Quantos pedidos foram feitos por cada cliente?
SELECT c.id_client AS id, count(*) AS numero_pedidos
	FROM clients c
	JOIN orders o ON c.id_client = o.id_client
    GROUP BY c.id_client;	

-- Algum vendedor também é fornecedor
SELECT se.cnpj AS CNPJ
	FROM seller_pj se
    JOIN supplier su ON se.cnpj = su.cnpj; 
    
-- Relação de produtos fornecedores e estoques;
SELECT p.product_name AS nome_do_produto, sto.product_quantity AS quantidade_do_produto, su.social_name AS nome_fornecedor
FROM product p
JOIN product_storage sto ON p.id_product = sto.id_product
JOIN product_supplier ps ON p.id_product = ps.id_ps_product
JOIN supplier su ON su.id_supplier = ps.id_ps_supplier;

-- Quais categorias de produtos têm mais de 100 itens em estoque no total?
SELECT p.category, SUM(st.product_quantity) as quantidade_total
FROM product p
JOIN product_storage st ON p.id_product = st.id_product
GROUP BY p.id_product
HAVING quantidade_total >= 100
ORDER BY p.category DESC;

-- Total pago em cada pedido, incluindo o frete (frete + soma dos preços dos produtos no pedido).

SELECT o.id_order, sum(p.price*((100-po.discount)/100)) + o.freight AS preco_total
FROM orders o
JOIN product_order po ON po.id_order = o.id_order
JOIN product p ON po.id_product = p.id_product
GROUP BY o.id_order;