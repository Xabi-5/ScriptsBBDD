use A22JavierLM_casascoloniales;

insert into Comarca (Nombre , Superficie , Habitantes) values ("Barbanza", 244.2, 66672),
("Fisterra", 336.9, 21770),("Muros", 138.9, 13785),("Santiago", 686.69,169620), ("Barbanza", 244.2, 66672),
("Betanzos", 669, 32842)
ON DUPLICATE KEY UPDATE Nombre = "Barbanza";

insert into CasaColonial (Nombre, Capacidad, IdComarca) values
("El Remanso", 30, 1), ("La casa azul", 55, 4),
("La Solana", 25, 2), ("Casa Barreiro", 60,1), ("La Solana", 50, 1) 
ON DUPLICATE KEY UPDATE IdComarca = 1, Capacidad = 60; 

insert into Monitor (DNI, Nombre, Apellidos) values ("32768594B", "Pedro", "Castro Ramos"),
("32888456A", "Carla", "Santos Lema"), ("33456782R", "Sonia", "Souto Busto"),
("32768594B", "Pedro", "Castro Ramos"), ("3276854B", "Paula", "Castro Rey"), 
("32758544B", "Paula", "Castro Rey")
ON DUPLICATE KEY UPDATE DNI = "3276854B", Nombre = "Pedro", Apellidos = "Castro Rey";

insert into Actividad (Nombre, Descripcion, IdMonitor) values ("Natación", "", 19),
("Esquí", "Necesitase roupa térmica", 21), ("Remo", "Máis de 12 anos", 19),
("Pintura", "Necesitase mandilón", 20), ("Fotografía", "Deben levar cámara", 19)
ON DUPLICATE KEY UPDATE IdMonitor = 19;

insert into Casa_Actividad (IdCasa, IdActividad, NivelCalidad) values
(45, 24, 7), (41, 23, 4), (42, 25, 8), (42, 22, 8), (45, 22, 7),
(45, 25, 10), (43, 25, 10);

insert into Niño (Nombre, Apellidos, IdComarca, IdCasa, Telefono) values
("Alberto", "Ramos Couto", 2, 42, "981606060"),
("Juanma", "Lema Rodriguez", 2, 45, "948007765"),
("Laura", "Bueno Rodriguez", 1, 42, "657898989"),
("Pedro", "Santos Rey", 4, 41, "688565758"),
("Alberto", "Ramos Couto", 2, 45, "988606060"),
("Aroa", "Ramos Couto", 2, 45, "988606060"),
("Martin", "Bello Santiso", 3, 43, "659008877");


