-- 1.4
select empFillos as NumFillos, COUNT(empNumero) as ocurrencia 
FROM empregado 
GROUP BY empFillos;

-- 1.5
select empDepartamento as Departamento,empFillos as NumFillos, COUNT(empNumero) as Ocurrencia 
FROM empregado 
GROUP BY empDepartamento,empFillos;

-- 1.6
SELECT d.depNumero, d.depPresuposto - (SUM(e.empSalario) + SUM(IFNULL(e.empComision,0))) as Balance  
FROM empregado as e
join departamento as d
group by d.depNumero 

-- 2.3
SELECT empDepartamento, depNome 
FROM empregado as e 
join departamento as d
ON (e.empDepartamento = d.depNumero)
GROUP BY empDepartamento
HAVING COUNT(e.empDepartamento) = 5

-- 2.4
SELECT empExtension, COUNT(empNumero) as veces
FROM empregado
group by empExtension 
HAVING COUNT(empNumero)  >1
order by veces
