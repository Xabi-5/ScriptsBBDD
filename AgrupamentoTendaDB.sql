-- 1.1
SELECT art_color, ROUND(AVG(art_pv), 2)  
FROM artigos
GROUP BY art_color 
order by art_color 

-- 1.2
SELECT art_color, ROUND(AVG(art_pv), 2)  
FROM artigos
WHERE art_pv > 50
GROUP BY art_color 
order by art_color

-- 1.3
SELECT  dev_numero, COUNT(DISTINCT dev_venda), COUNT(DISTINCT dev_artigo), SUM(dev_cantidade)  , AVG(dev_prezo_unitario)  
FROM detalle_vendas 
GROUP BY dev_numero

-- 2.1
SELECT art_color, round(AVG(art_pv), 2)
FROM artigos 
WHERE art_pv >100
GROUP BY art_color 

-- 2.2
SELECT CONCAT(clt_id, ', ', clt_apelidos, ', ', clt_nome) as client, clt_ultima_venda
FROM clientes
WHERE clt_vendas = 1
GROUP BY clt_id;
