-- 1.1
select art_codigo, art_nome, art_peso, prv_nome
from artigos join provedores
on (art_provedor = prv_id)
where art_color = 'NEGRO';

-- 1.2
select clt_apelidos, clt_nome, clt_poboacion, pro_nome
from clientes join provincias
on (LEFT(clt_cp, 2) = pro_id)
order by pro_nome, clt_apelidos, clt_nome;

-- 1.3 
SELECT c.clt_nome, c.clt_apelidos,DATE_FORMAT(v.ven_data,('%d')) as dia, DATE_FORMAT(v.ven_data,('%m')) as mes, DATE_FORMAT(v.ven_data,('%Y')) as ano
FROM vendas as v JOIN clientes as c
on v.ven_cliente = c.clt_id;

-- 1.4
SELECT a.art_nome, a.art_nome, a.art_peso, p.peso_nome 
FROM artigos as a JOIN pesos as p 
where a.art_peso BETWEEN p.peso_min AND p.peso_max
order by a.art_peso ASC;

-- 1.5
SELECT c.clt_nome, c.clt_apelidos , DATE_FORMAT(v.ven_data,('%d/%m/%y')) as Fecha, DATEDIFF(CURDATE(), v.ven_data) as dias
FROM vendas as v JOIN clientes as c
ON v.ven_cliente = c.clt_id
ORDER BY dias;

-- 1.6
SELECT v.ven_id, v.ven_data, CONCAT(c.clt_nome, ', ', c.clt_apelidos), CONCAT(e.emp_nome, ', ', e.emp_apelidos)  
FROM vendas as v
JOIN clientes as c on v.ven_cliente = c.clt_id 
JOIN empregados as e on v.ven_empregado = e.emp_id; 

-- 2.1
SELECT c.clt_id, clt_nome, c.clt_apelidos, IFNULL(v.ven_data, 'SEN COMPRAS')  
FROM clientes as c JOIN vendas as v
ON c.clt_id = v.ven_cliente
WHERE c.clt_id < 11;

-- 2.2
SELECT DISTINCT  e.emp_id, e.emp_apelidos, e.emp_nome, if (v.ven_empregado is null, 'no', 'si')
FROM empregados as e LEFT JOIN vendas as v
on e.emp_id = v.ven_empregado
order by emp_id 

-- 3.1
SELECT art_codigo, art_nome 
FROM artigos
where art_pc > (SELECT art_pc from artigos where art_codigo = "0713242");

-- 4.1
SELECT * 
FROM artigos 
WHERE art_color = 'NEGRO'
UNION 
SELECT *
FROM artigos
WHERE art_peso >5000
order by art_peso 

-- 4.2
SELECT emp_apelidos as apelidos, emp_nome as nome, emp_cp as cp, emp_poboacion as poboacion,CONCAT('Empregado') as tipo
FROM empregados
UNION
SELECT clt_apelidos as apelidos, clt_nome as nome, clt_cp as cp, clt_poboacion as poboacion, CONCAT('Cliente') as tipo 
FROM clientes
order by apelidos, nome;



