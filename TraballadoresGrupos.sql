-- 1.4 e 1.6 --
select  empFillos, count(empFillos) from empregado group by empFillos;

select depNumero, empFillos, count(empFillos) from departamento join empregado group by depNumero, empFillos;

select depNumero, depPresuposto - SUM(empSalario + IFNULL(empComision, 0))  from departamento join empregado group by depNumero;

-- 2.3 e 2.4 --

select depNumero, depNome  
from departamento join empregado  
on depNumero = empDepartamento 
group by depNumero
having count(depNumero) = 5;

select empExtension, COUNT(empExtension)  
from empregado
group by empExtension 
having count(empExtension) >1;