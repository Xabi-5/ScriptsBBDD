use A22JavierLM_pruebas;

create table if not exists profesor(
idProfesor varchar(15) not null primary key,
corpo enum('S', 'T') not null,
nrp varchar(20) not null unique,
nome varchar(30) not null,
apelidos varchar(60) not null,
horasLectivas smallint
);

create table if not exists grupo(
idGrupo varchar(15) not null primary key,
descricion varchar(100) not null,
horasTitoria smallint,
idProfesor varchar(15),
foreign key (idProfesor) references profesor(idProfesor)
);

create table if not exists modulo(
idModulo varchar(6) not null primary key,
horasSemanais tinyint,
descricion varchar(100),
corpo enum('S', 'T') not null
);

create table if not exists imparte(
foreign key idModulo references modulo(idModulo) not null,
foreign key idGrupo references grupo(idGrupo) not null,
foreign key idProfesor references profesor(idProfesor) not null
#facer primary key de tres campos
);