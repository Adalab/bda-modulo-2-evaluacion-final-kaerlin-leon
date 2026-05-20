-- PARTE DOS BBDD SAKILA
USE sakila;

-- Selecciona todos los nombres de las películas sin que aparezcan duplicados.
select distinct title from film;

--  Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".
select title 
from film
where rating = 'PG-13';

-- Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción.
select title, description
from film
where description like '%amazing%';

--  Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.

select title 
from film  
where length > 120;  -- duracion = length

-- Recupera los nombres de todos los actores.

select first_name, last_name
from actor;

-- Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.

select first_name, last_name
from actor
where last_name like '%Gibson%';

--  Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.
-- entre = BETWEEN
select first_name, last_name, actor_id
from actor
where actor_id between 10 and 20;

-- Encuentra el título de las películas en la tabla  film que no sean ni "R" ni "PG-13" en cuanto a su clasificación.
-- en vez de in es un NOT IN
select title 
from film 
where rating not in ('R', 'PG-13');

-- Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con el recuento.
-- CLASIFICACION = RATING
select rating, count(*)
from film
group by rating;

--  Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.
-- count(*), rental, customers, unidas por customer_id, inner join?, customer.customer_id= c.customer_id
select c.customer_id, c.first_name, c.last_name
from customer c
inner join rental r on c.customer_id = r.customer_id
group by c.customer_id;

--   Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres.
-- categoria = category NO rating, count(*), rental, no estan unidas, hayq ue unir varias tablas,

select count(*), c.name 
from category c
inner join film_category fc ON c.category_id= fc.category_id
inner join film f on fc.film_id= f.film_id
inner join inventory i on f.film_id= i.film_id
inner join rental r on i.inventory_id= r.inventory_id
group by c.name;

-- Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.
-- clasificacion = rating, avg(), duracion= length, 

select avg(length), rating
from film
group by rating;

-- Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".
-- Join para unir, son tres, unidas por actor_id y film_id
select a.first_name, a.last_name
from actor a
inner join film_actor fa on a.actor_id= fa.actor_id
inner join film f on fa.film_id = f.film_id
where f.title = 'Indian Love';

--  Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.
-- repetir la comsulta no se puede solo or
select title
from film
where description like '%dog%' 
or description like '%cat%';

--  Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.
-- lanzadas = release_year
select title from film
where release_year between 2005 and 2010;