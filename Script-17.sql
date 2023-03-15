-- Mostrar os que teñen máis de 25 anos
SELECT count(dorsal)
FROM ciclistas 
WHERE edad >25;

-- Obter os portos coa maior e menor altura
SELECT MAX(altura) as maxaltura, MIN(altura) as minaltura
FROM puertos;

-- Nombre dos ciclistas que pertenzan ao mesmo equipo que alberto contador
SELECT nombre 
FROM ciclistas
WHERE nombreq = (SELECT nombreq FROM ciclistas WHERE nombre = 'Alberto Contador');

-- Mostrar nome ciclistas que teñen ganado unha etapa
SELECT DISTINCT  c.nombre 
FROM ciclistas as c join etapas as e 
WHERE e.dorsal = c.dorsal
ORDER BY c.nombre;

-- Obter o número de ciclistas por equipo, para equipos cuxo nome teña len entre 8 e 10 char
SELECT nombreq, count(nombreq)
FROM ciclistas
WHERE LENGTH(nombreq) >= 8 AND LENGTH(nombreq) <=10
GROUP by nombreq;

-- Obter o nome dos ciclistas máis xoves
SELECT nombre
FROM ciclistas
WHERE edad = (SELECT MIN(edad) from ciclistas);

-- Nome dos ciclistas que ganaron as etapas onde as poboacions de chegada e saida empezan pola mesma char
SELECT c.nombre
from ciclistas as c join etapas as e
ON e.dorsal = c.dorsal 
WHERE LEFT(e.llegada,1) = LEFT(e.salida, 1);

-- Nome dos ciclistas que levaron o maillot general
SELECT DISTINCT  c.nombre
from ciclistas as c join llevar as l
on c.dorsal = l.dorsal
WHERE l.codigo = (SELECT codigo FROM maillots WHERE tipo ='General' );

-- Ciclistas que teñen gañando máis de un porto de montaña
SELECT c.nombre, count(p.dorsal)
FROM ciclistas as c join puertos as p 
on c.dorsal = p.dorsal 
GROUP BY p.dorsal
HAVING COUNT(*) >1;

-- Nome dos ciclistas que teñen levado os mesmos maillots que Igor Antón
-- O in é = pero para multiples queries
SELECT DISTINCT  c.nombre
from ciclistas as c join llevar as l 
on c.dorsal = l.dorsal
WHERE l.codigo IN (SELECT codigo FROM llevar WHERE dorsal = (SELECT dorsal from ciclistas where nombre='Igor Antón'))

-- Obter o numero de etapa e nome de ciclista donde o ciclista teña gañadoa vestindo o maillot vermello
SELECT l.netapa, c.nombre 
FROM llevar as l join ciclistas as c
ON l.dorsal = c.dorsal 
WHERE l.netapa in (SELECT netapa from etapas WHERE dorsal = l.dorsal) && l.codigo = (SELECT codigo from maillots WHERE color='Rojo')

SELECT DISTINCT  e.nombreq 
FROM equipos as e join ciclistas as c 
on e.nombreq = c.nombreq 
 c.dorsal in (SELECT dorsal from puertos) or c.dorsal in (SELECT dorsal from maillots)



