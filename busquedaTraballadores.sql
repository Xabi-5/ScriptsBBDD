select distinct empDepartamento from empregado where empSalario/empComision >10 order by empDepartamento;

select empNome, empSalario, empComision, empFillos, empFillos * 30 as empPagaExtra, empFillos*30 + empSalario as empSalario from empregado where empFillos >2 and empComision >0 order by empNome;

select * from empregado where empNome like 'MORA%' order by empNome;

select empNome, empFillos +2 as empInv, empfillos as empRegalos from empregado where empNome  REGEXP '^[A-L]';

select empNome, empSalario from empregado where (empFillos < 1 and empSalario > 1200) or (empFillos >0 and empSalario <1800);

select empNome, empSalario from empregado where empFillos <1 order by empSalario DESC;

select empNome, empSalario from empregado where empDepartamento = 111 and empComision > empSalario * 15 /100;

select empNome, empFillos, empComision, empComision *15/100 + empComision as empNewComision from empregado where empFillos >1 order by empNome ;