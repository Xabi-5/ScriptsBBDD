select empNome,empDataNacemento, empSalario, YEAR(CURDATE()) - YEAR (empDataIngreso) as AnosTraballados,(YEAR(CURDATE()) - YEAR (empDataIngreso)) * empSalario as liquidacion from empregado where YEAR(CURDATE()) - YEAR(empDataNacemento) >59;

select empNome, DAY(empDataNacemento), MONTH(empDataNacemento) from empregado where empDepartamento BETWEEN 110 and 111;

select COUNT(DISTINCT empNumero), AVG(empSalario) from empregado where (YEAR(CURDATE()) - YEAR(empDataIngreso)) >=20; 

select empSalario * 14 + IFNULL(empComision,0)  as importeAnual, empNome  from empregado;  

select COUNT(DISTINCT depNumero), SUM(depPresuposto)  from departamento;

select SUM(empComision) from empregado where empComision is not null;

select DATE_FORMAT(empDataNacemento,'%d-%m-%Y'), YEAR(CURDATE()) - YEAR(empDataNacemento) from empregado where (YEAR(CURDATE()) - YEAR(empDataNacemento)) > 50 order by YEAR(empDataNacemento) ASC;

select empNome, DATE_FORMAT(empDataIngreso, '%d/%m/%Y'), YEAR(CURDATE()) - YEAR(empDataIngreso), FLOOR((YEAR(CURDATE()) - YEAR(empDataIngreso))/3) as Trienios from empregado where 2023 - YEAR(empDataNacemento) = 63 order by Trienios DESC;

select AVG(YEAR(empDataIngreso) - YEAR(empDataNacemento)) from empregado;

select empNome, DATE_FORMAT(empDataIngreso, '%d/%m/%Y'), FLOOR(YEAR(CURDATE()) - YEAR(empDataIngreso))  from empregado where MONTH(empDataNacemento) = 2;

select DATEDIFF(MAX(empDataIngreso), MIN(empDataIngreso)), MAX(empDataIngreso), MIN(empDataIngreso)  from empregado;

select empNumero, empNome, empSalario, IFNULL(empComision,0) from empregado where empSalario >1800 order by empNumero;

select empNumero, empNome, empSalario, empComision, empSalario + IFNULL(empComision,0)  as empST from empregado where  empSalario + IFNULL(empComision,0) >1800 order by empNumero;
