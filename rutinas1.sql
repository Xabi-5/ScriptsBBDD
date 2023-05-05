-- Ex1
delimiter $$
create procedure maxprice()
begin
		SELECT Descripcion FROM PRODUCTOS WHERE PrecioActual = (SELECT MAX(PrecioActual) FROM PRODUCTOS); 
end
$$

call maxprice()

-- Ex2
drop PROCEDURE if EXISTS runningout;
delimiter $$
CREATE PROCEDURE runningout()
BEGIN 
	SELECT count(*) FROM PRODUCTOS WHERE Stock <20;
	SELECT Concat('O produto ',Descripcion,' ten pouco stock') from PRODUCTOS WHERE Stock <20;
	
END
$$

call runningout();

-- Ex3
drop function if exists descontar;
delimiter $$
create function descontar(unidades int unsigned)
returns float 
deterministic
begin
	declare resultado float;
	case
		when unidades < 10 then SET resultado = 0;
		when unidades >9 and unidades <20 then SET resultado = 0.1;
		when unidades > 19 and unidades <50 then set resultado = 0.3;
		when unidades >49 then set resultado = 0.5;
	end case;
	return resultado;
end
$$

call descontar(66);

-- Ex4
drop procedure if exists descontartabla;
delimiter $$
create procedure descontartabla()
begin
	select p.*, descontar(p.UNIDADES)
	from PEDIDOS p; 
end
$$
call descontartabla();


