-- 1.A
drop procedure if exists empDep;
delimiter $$
CREATE procedure empDep(idDep tinyint)
begin
	DECLARE existe tinyint;
	
	select count(*) INTO existe FROM DEPARTAMENTOS where IDDepartamento  = idDep;
	if existe > 0
		then 
			select * FROM EMPLEADOS WHERE IDDepartamento = idDep;
		else
			select concat('Non existe o departamento con ID ', idDeP);
	end if;
end
$$
call empDep(10);

-- 1.B

drop procedure if exists empDepNombre;
delimiter $$
CREATE procedure empDepNombre(nombreDep varchar(30))
begin
	DECLARE existe tinyint;
	
	select count(*) INTO existe FROM DEPARTAMENTOS where Nombre LIKE nombreDep;
	if existe = 1
		then 
			select * FROM EMPLEADOS as e join DEPARTAMENTOS as d 
			on e.IDDepartamento = d.IDDepartamento
			WHERE d.Nombre like nombreDep;
		else
			select concat('Non existe o departamento con nome ', nombreDep);
	end if;
end
$$
call empDepNombre('CONTABILIDAD');

-- 2.A
drop procedure if exists pro2a;
delimiter $$
create procedure pro2a(nombreDep varchar(30), out idDep tinyint, out nombreDir varchar(30))
begin
	declare existe tinyint;
	SELECT count(*) into existe from DEPARTAMENTOS WHERE Nombre LIKE nombreDep;
	if existe = 1
		then
			select e.Nombre, d.IDDepartamento into nombreDir, idDep 
			FROM DEPARTAMENTOS as d join EMPLEADOS as e 
			on d.IDDepartamento = e.IDDepartamento
			WHERE d.Nombre like nombreDep and e.Oficio = 'DIRECTOR';
		
			SELECT idDep as Departamento, nombreDir as Director;
		else
			SELECT CONCAT("O departamento non existe");
	end if;
end
$$
call pro2a('CONTABILIDAD', @id,@dire);

-- 2.B
drop procedure if exists pro2b;
delimiter $$
create procedure pro2b(nombreDep varchar(30), out idDep tinyint, out nombreDir varchar(30))
begin
	declare existe tinyint;
	SELECT count(*) into existe from DEPARTAMENTOS WHERE Nombre LIKE nombreDep;
	if existe = 1
		then
			select e.Nombre, d.IDDepartamento into nombreDir, idDep 
			FROM DEPARTAMENTOS as d join EMPLEADOS as e 
			on d.IDDepartamento = e.IDDepartamento
			WHERE d.Nombre like nombreDep and e.Oficio = 'DIRECTOR';
		
		else
			SELECT CONCAT("O departamento non existe");
	end if;
end
$$
call pro2b('CONTABILIDAD', @iddep, @director);
SELECT @iddep as Departamento, @director as Director;

-- 3
drop procedure if exists pro3;
delimiter $$
create procedure pro3(idprod int, idcli int, unid int, data_ped DATE)
begin
	declare existe_producto tinyint;
	declare existe_cliente tinyint;
	declare idped int;

	SELECT count(*) into existe_producto from PRODUCTOS WHERE IDProducto = idprod;
	if existe_producto
		then
			SELECT count(*) into existe_cliente from CLIENTES WHERE IDCliente = idcli;
			if existe_cliente
				then
					INSERT PEDIDOS(IDProducto, IDCliente, UNIDADES, Fecha_pedido) values (idprod, idcli, unid, data_ped);
					SELECT IDPedido into idped from PEDIDOS order by IDPedido desc limit 1;
					SELECT concat('Pedido con ID ',idped,' insertado con éxito');
				else
					select concat('El cliente con id ',idcli,' no existe');
			end if;
		else 
			select concat('El producto con id ',idprod,' no existe');
	end if;		
end
$$
CALL pro3(20, 103, 30, '2023-05-14');

-- 4
drop procedure if exists pro4;
delimiter $$
create procedure pro4(nombredep varchar(30), localidaddep varchar(30))
begin
	declare existe_dep tinyint;
	declare existe_local tinyint;
	declare ultimo_departamento int;

	if length(nombredep) > 0
		then
			SELECT count(*) into existe_dep from DEPARTAMENTOS WHERE Nombre = nombredep;
		if existe_dep
			then
				select count(*) into existe_local from DEPARTAMENTOS where Nombre = nombredep and Localidad = localidaddep;
				if existe_local
					then
						SELECT CONCAT('Ese departamento xa existe');
					else
						select IDDepartamento into ultimo_departamento FROM DEPARTAMENTOS order by IDDepartamento DESC limit 1; 
						set ultimo_departamento = ultimo_departamento + 10;
						insert into DEPARTAMENTOS values (ultimo_departamento, nombredep, localidaddep);
						SELET concat('O departamento insertouse correctamente co ID', ultimo_departamento);
				end if;
			else
				SELECT IDDepartamento into ultimo_departamento FROM DEPARTAMENTOS ORDER BY IDDepartamento DESC limit 1;
				set ultimo_departamento = ultimo_departamento + 10;
				INSERT INTO DEPARTAMENTOS VALUES (ultimo_departamento, nombredep, localidaddep);
				select concat('EL departamento se ha insertado correctamente con el id ',ultimo_departamento);
			end if;			
	else
		SELECT CONCAT('O nome inserido está baleiro');
	end if;
end;
$$

call pro4("Loxistica", "Vigo");

 








