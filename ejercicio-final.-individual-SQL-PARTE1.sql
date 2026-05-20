-- orden: select, from gruop by, order by

-- ¿Cuántas películas tienen una duración superior a 120 minutos?

select count(*) from peliculas_api    
where duracion > 120;

-- ¿Cuántas películas incluyen subtítulos en español?

select count(*) from peliculas_api
where subtitulos like "%es%";

-- ¿Cuántas películas tienen contenido adulto?
select count(*) from peliculas_api
where adultos like '1';

-- ¿Cuál es la película más antigua registrada en la base de datos?
select min(anio)
from peliculas_api;

-- Muestra el promedio de duración de las películas agrupado por género.
-- usar avg
select genero, avg(duracion) from peliculas_api
group by genero;

-- ¿Cuántas películas por año se han registrado en la base de datos? Ordena de mayor a menor.
-- crear columna donde guardar el total de las peliculas ya que esta columna no existe
select anio, count(*) as total_pelis  
from peliculas_api
group by anio
order by total_pelis desc;

-- ¿Cuál es el año con más películas en la base de datos?
select anio, count(*) as total_pelis
from peliculas_api
group by anio
order by total_pelis desc  -- sin el desc no sale porque ordena por el que menos
limit 1;

-- Obtén un listado de todos los géneros y cuántas películas corresponden a cada uno.

select genero, count(*) total_pelis
from peliculas_api
group by genero
order by total_pelis desc;

-- Muestra todas las películas cuyo título contenga la palabra "Godfather"
-- like
select * from peliculas_api
where titulo like '%Godfather%';




