use sakila;

/* 
1. ¿Qué consulta ejecutarías para obtener todos los clientes dentro de city_id = 312? 
Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.
*/

SELECT * FROM customer;
SELECT * FROM city;
SELECT * FROM address;

SELECT * FROM address WHERE city_id = 312;
SELECT * FROM customer WHERE address_id IN (256, 517);

SELECT c.first_name AS Nombre, c.last_name AS Apellido, c.email AS Correo_Electrónico, d.address AS Dirección 
FROM customer c JOIN address d ON c.address_id = d.address_id
WHERE d.city_id = 312;

/* 
2. ¿Qué consulta harías para obtener todas las películas de comedia? 
Su consulta debe devolver el título de la película, la descripción, el año de estreno,
la calificación, las características especiales y el género (categoría).
*/

SELECT * FROM film;
SELECT * FROM category;
SELECT * FROM film_category;

SELECT * FROM category WHERE name = 'Comedy';
SELECT * FROM film_category WHERE category_id = 5;

SELECT p.title AS Título, p.description AS Descripción, p.release_year AS Año_Estreno, p.rating AS Calificación, p.special_features AS Características_Especiales, c.name AS Categoría
FROM film_category pc JOIN film p ON p.film_id = pc.film_id 
JOIN category c ON c.category_id = pc.category_id
WHERE pc.category_id = 5;

/* 
3. ¿Qué consulta harías para obtener todas las películas unidas por actor_id = 5? 
Su consulta debe devolver la identificación del actor, el nombre del actor, el título de la película, 
la descripción y el año de lanzamiento.
*/

SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM film_actor;

SELECT * FROM film_actor WHERE actor_id = 5;

SELECT a.actor_id AS Identificador_Actor, CONCAT(a.first_name, " ", a.last_name) AS Nombre_Actor, p.title AS Título_Pelicula, 
p.description AS Descripción, p.release_year AS Año_Lanzamiento  
FROM film_actor pa JOIN actor a ON a.actor_id = pa.actor_id
JOIN film p ON p.film_id = pa.film_id
WHERE pa.actor_id = 5;

/* 
4. ¿Qué consulta ejecutaría para obtener todos los clientes en store_id = 1 y dentro de estas ciudades (1, 42, 312 y 459)? 
Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.
*/

SELECT * FROM customer;
SELECT * FROM city;
SELECT * FROM address;

SELECT cl.first_name AS Nombre_Cliente, cl.last_name AS Apellido_Cliente, cl.email AS Correo_Electrónico, d.address AS Dirección_Cliente
FROM address d JOIN customer cl ON cl.address_id = d.address_id 
WHERE cl.store_id = 1 AND d.city_id IN (1, 42, 312, 459);

/* 
5. ¿Qué consulta realizarías para obtener todas las películas con una "calificación = G" y "característica especial = detrás de escena", 
unidas por actor_id = 15? Su consulta debe devolver el título de la película, la descripción, el año de lanzamiento, 
la calificación y la función especial. Sugerencia: puede usar la función LIKE para obtener la parte 'detrás de escena'.
*/

SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM film_actor;

SELECT p.title AS Título_Película, p.description AS Descripción_Película, p.release_year AS Año_Lanzamiento, p.rating AS Calificación, 
p.special_features AS Función_Especial FROM film_actor pa JOIN film p ON p.film_id = pa.film_id
WHERE p.rating = 'G' AND p.special_features LIKE'%Behind the Scenes%' AND pa.actor_id = 15; 

/* 
6. ¿Qué consulta harías para obtener todos los actores que se unieron en el film_id = 369? 
Su consulta debe devolver film_id, title, actor_id y actor_name.
*/

SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM film_actor;

SELECT * FROM film_actor WHERE film_id = 369;

SELECT p.film_id AS ID_Película, p.title AS Película, a.actor_id AS ID_Actor, CONCAT(a.first_name," ", a.last_name) AS Nombre_Completo_Actor
FROM film_actor pa JOIN film p ON pa.film_id = p.film_id
JOIN actor a ON pa.actor_id = a.actor_id
WHERE pa.film_id = 369;

/* 
7. ¿Qué consulta harías para obtener todas las películas dramáticas con una tarifa de alquiler de 2.99? 
Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, 
las características especiales y el género (categoría).
*/

SELECT * FROM film;
SELECT * FROM category;
SELECT * FROM film_category;

SELECT p.title AS Título_Película, p.description AS Descripción, p.release_year AS Año_Estreno, p.rating AS Calificación,
p.special_features AS Características_Especiales, g.name AS Género
FROM film_category pg JOIN film p ON pg.film_id = p.film_id
JOIN category g ON pg.category_id = g.category_id
WHERE p.rental_rate = 2.99;

/* 
8. ¿Qué consulta harías para obtener todas las películas de acción a las que se une SANDRA KILMER? 
Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, 
las características especiales, el género (categoría) y el nombre y apellido del actor.
*/

SELECT * FROM actor WHERE CONCAT(actor.first_name," ", actor.last_name) = 'SANDRA KILMER';

SELECT p.title AS Título_Película, p.description AS Descripción, p.release_year AS Año_Estreno, p.rating AS Calificación,
p.special_features AS Características_Especiales, g.name AS Género, a.first_name AS Nombre_Actor, a.last_name AS Apellido_Actor
FROM film p JOIN film_category pg ON p.film_id = pg.film_id
JOIN film_actor pa ON p.film_id = pa.film_id
JOIN category g ON pg.category_id = g.category_id
JOIN actor a ON pa.actor_id = a.actor_id
WHERE CONCAT(a.first_name," ", a.last_name) = 'SANDRA KILMER' AND g.name = 'Action';
