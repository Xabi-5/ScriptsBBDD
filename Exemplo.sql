use A22JavierLM_pruebas;
CREATE table if not exists  empregados(
 Nome varchar(30)
 );
CREATE table if not exists  alumnos(
id_alumno int auto_increment primary key,
nome varchar(20),
apelidos varchar(30),
idCurso int,
dataMatricula varchar(30)
);

show tables;
describe alumnos;
show create table empregados;