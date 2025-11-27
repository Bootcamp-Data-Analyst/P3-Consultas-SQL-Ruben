use sakila;

-- Consulta de los campos de las tablas propuestas (film,film_actor,actor)

SELECT * FROM film;
SELECT * FROM actor;
SELECT * FROM film_actor;

-- En este caso se exportarán 2 archivos csv ya que lo pedido no se podría exportar solo en una archivo.Para ello primero se obtendrán una tabla donde veamos el número de actores por peliculas
-- y otra con el número de películas por actor

-- Primer dataframe
-- Se filtra para que aparezcan todas las peículas en las que contengan actores o no con la clausula LEFT
SELECT f.film_id,
       TRIM(LOWER(f.title)) AS title,
       COUNT(a.actor_id) AS num_actors
FROM   film AS f
	   LEFT JOIN film_actor AS fa ON f.film_id = fa.film_id
       LEFT JOIN actor AS a ON fa.actor_id = a.actor_id
GROUP BY f.film_id,
		 f.title
ORDER BY f.title ASC;

-- Segundo dataframe
-- Se usa la clausula LEFT por si hay actores que no aparezcan en las películas
SELECT a.actor_id,
       TRIM(LOWER(CONCAT(a.first_name,' ',a.last_name))) AS full_name,
       COUNT(f.film_id) AS num_films 
FROM   actor AS a
	   LEFT	JOIN film_actor AS fa ON a.actor_id = fa.actor_id
       LEFT JOIN film AS f ON fa.film_id = f.film_id
GROUP BY a.actor_id
ORDER BY full_name ASC
			
      
		
       
       
       
       
	   
