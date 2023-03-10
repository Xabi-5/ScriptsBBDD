use A22JavierLM_pruebas;

create table if not exists Departamento(
codigoDepartamento int primary key,
nome varchar(20),
localizacion varchar(20)
);

create table if not exists Empregado(
dni varchar(9) primary key,
nss int,
nome varchar(20),
dataNacemento date,
sexo varchar(1),
salario int
);

alter table Empregado
	add column departamento int not null;

alter table Empregado 
	add foreign key (departamento)
	references Departamento(codigoDepartamento); 
	
SET FOREIGN_KEY_CHECKS=0;