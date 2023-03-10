use A22JavierLM_pinacoteca;

create table if not exists pinacoteca(
nombrePinacoteca varchar(50) primary key,
ciudadPinacoteca varchar(20),
superficiePinacoteca int
);

create table if not exists cuadros(
codCuadro int primary key,
nombreCuadro varchar(50),
medidasCuadro varchar(10),
fechaCuadro date,
tecnicaCuadro varchar(30),
NomPintor varchar(50),
NomPinacoteca varchar(50),
foreign key (NomPintor) references pintor (nombrePintor),
foreign key (NomPinacoteca) references pinacoteca(nombrePinacoteca)
);

create table if not exists pintor(
nombrePintor varchar(50) primary key,
paisPintor varchar(20),
ciudadPintor varchar(20),
fechaNacimientoPintor date,
fechaFallecimientoPintor date,
pintorMaestro varchar(50),
nomEscuela varchar(20),
nomMaestro varchar(50),
foreign key (nomEscuela) references escuela(nombreEscuela),
foreign key (nomMaestro) references pintor(nombrePintor)
);

create table if not exists escuela(
nombreEscuela varchar(20) primary key,
paisEscuela varchar(20),
fechaEscuela date
);

create table if not exists mecenas(
nombreMecenas varchar(50) primary key,
paisMecenas varchar(20),
ciudadMecenas varchar(20),
fechaNacimientoMecenas date
);

create table if not exists protege_a(
nomMecenas varchar(50),
nomPintor varchar(50),
inicio date,
fin date,
primary key(nomMecenas, nomPintor, inicio),
foreign key (nomMecenas) references mecenas(nombreMecenas),
foreign key (nomPintor) references pintor(nombrePintor)
);


show tables;
