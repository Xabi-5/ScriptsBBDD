select CONCAT(clt_apelidos, ', ', clt_nome) as clt_ApNom, LENGTH(clt_nome) as clt_lon from clientes;

select lower(clt_apelidos), lower(clt_nome) from clientes;

select TIMESTAMPDIFF(YEAR, '2003-08-05', CURDATE());

select * from vendas where DATE_FORMAT(ven_data, '%m') = 1;
select * from vendas where DATE_FORMAT(ven_data, '%m') = 1 AND DATE_FORMAT(ven_data, '%Y') = 2023;

select art_codigo, art_nome, art_color, round(art_pv) from artigos where art_color  ='NEGRO';

select AVG(art_peso) from artigos; 

select AVG(art_peso), MAX(art_pv) - MAX(art_pc) , MAX(art_pv) - MIN(art_pc) from artigos where art_color is null;

select COUNT(DISTINCT art_color) from artigos; 

select art_nome, IFNULL(art_color, 'DESCOÑECIDO')  from artigos;

