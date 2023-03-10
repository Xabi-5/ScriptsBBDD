-- 1.1
INSERT into centro 	(cenNumero, cenNome, cenEnderezo) values (40, "FRANQUICIA LUGO", "C/PROGRESO, 8 - LUGO");

-- 1.2 
INSERT into empregado (empNome, empNumero, empDepartamento, empExtension, empDataNacemento, empDataIngreso, empSalario, empComision, empFillos)
values ("BARCIA, ANGELES", 750, 110, 25, '1990-02-12', curdate() , 825, 50, 1),
("MENDEZ, RICARDO", 751, 110 , 25, '1985-10-22', DATE_SUB(curdate(),INTERVAL 15 DAY) , 900, null, 0),
("BERNARDEZ, LUCIA", 752, 120, 45, '1992-05-02', null, 1200, 150, 2),
("VALIN, EVA", 753, 100, 200, '1980-11-05', curdate(), 1000, 300, 1);

-- 1.3
UPDATE empregado
SET empSalario = empSalario * 1.05,
	empComision = empComision * 1.065;

-- 1.4
UPDATE empregado 
SET empDataIngreso = DATE_ADD(LAST_DAY(CURDATE()), INTERVAL 1 DAY)
	WHERE  empNumero = 752;
	
-- 1.5
UPDATE empregado 
SET empSalario = empSalario * 1.02
	WHERE empDepartamento = 120; 
	
-- 1.6
UPDATE empregado as e, departamento as d, centro as c 
SET e.empComision = IFNULL(empComision,0) + 50
WHERE e.empDepartamento = d.depNumero and d.depCentro = c.cenNumero and c.cenNome = 'SEDE CENTRAL';

-- 1.7
UPDATE departamento 
SET depPresuposto = depPresuposto * 0.9
WHERE depPresuposto = (SELECT MAX(depPresuposto) from departamento);

-- 1.8 
UPDATE departamento
SET depPresuposto = depPresuposto - 20000
WHERE depNome ='PERSOAL';

UPDATE departamento
SET depPresuposto = depPresuposto + 20000
WHERE depNome = 'PROCESO DE DATOS';
 
UPDATE departamento
SET depPresuposto = depPresuposto - 10000
WHERE depNome = 'SECTOR INDUSTRIAL';

UPDATE departamento
SET depPresuposto = depPresuposto + 4000
WHERE depNome = 'ORGANIZACION';

UPDATE departamento
SET depPresuposto = depPresuposto + 6000
WHERE depNome = 'DIRECCION COMERCIAL' ;

-- 1.9
DELETE FROM empregado 
WHERE empNumero = 380;

-- 1.10
DELETE from em, de 
USING empregado as em straight_join departamento as de
WHERE em.empDepartamento = de.depNumero and YEAR(CURDATE()) - YEAR(em.empDataNacemento) >59;


-- 1.11
DELETE
FROM em,de 
using departamento AS de straight_join empregado AS em
WHERE de.depNumero = em.empDepartamento AND de.depNumero = 121;

-- 1.12
create temporary table empregado_120 like empregado;




