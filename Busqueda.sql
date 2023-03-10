select * from tendas;

select prv_nome from provedores;

select clt_poboacion from clientes order by clt_poboacion;

select art_pv * 1/10 + art_pv from artigos;

select clt_id, clt_apelidos, clt_nome from (select * from clientes where clt_poboacion = 'Madrid') as clientesMadrid; 

select art_codigo, art_nome, art_peso from(select * from artigos where art_peso >500) as artPesados;

select * from (select * from artigos where art_pv >= (2*art_pc)) as artMargin;

select clt_apelidos, clt_nome, clt_poboacion, clt_desconto from(select * from clientes where clt_desconto not in(1,2) AND clt_poboacion = 'Valencia' OR clt_poboacion = 'Asturias') as cli_Val_At;

select * from artigos where art_peso > 5000 AND art_color = 'NEGRO';

select * from artigos where art_peso <= 5000 AND art_color  != 'NEGRO';

select * from artigos where art_peso >100 AND art_color = 'NEGRO' OR art_color = 'CYAN';

select * from artigos where art_pc BETWEEN 12 and 18;

select * from artigos where art_color ='NEGRO' or art_color = 'CYAN';

select * from clientes where clt_apelidos like 'RO%';

select * from clientes where clt_nome like 'B___A';

select * from artigos where art_color  is null;

select * from artigos order by art_peso DESC;

select art_codigo, art_nome, art_pc, art_pv, art_pv - art_pc as marxe_beneficio from artigos where art_pc >3000 order by marxe_beneficio;

select art_nome, art_provedor, art_stock, art_peso from artigos where art_peso > 1000 order by art_provedor ASC, art_stock DESC;

select clt_nome, clt_apelidos from clientes where clt_apelidos like 'F%Z';

select * from artigos where art_nome like '%LED%';

select * from artigos where UPPER(art_nome) like upper('%cabi%');

#O 23 nin idea

select * from clientes where clt_apelidos like 'F%' OR clt_apelidos like 'A%';

select * from clientes where clt_apelidos REGEXP '^[e-z]' order by clt_apelidos;

select * from artigos where art_pv like '%.00';

select * from clientes where clt_nome like '______';




