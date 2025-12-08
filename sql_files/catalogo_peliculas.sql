use sakila;

-- Consulta de los campos de las tablas propuestas (film,film_category,category,language,inventory)

SELECT * FROM film;
SELECT * FROM film_category;
SELECT * FROM category;
SELECT * FROM language;
SELECT * FROM inventory;

-- Unión de tablas

SELECT f.film_id,
	   TRIM(LOWER(f.title)) AS title,
	   f.length AS film_duration,
       -- f.release_year, Todas las peliculas se lanzaron en el 2006 por lo que no se guarda en el dataset esa columna 
       CASE
			WHEN f.length >= 120 THEN TRUE
            ELSE FALSE
       END AS is_long_film,     
       -- CONCAT(TRIM(LOWER(cat.name)),' - ',TRIM(LOWER(l.name))) AS cat_lang, No se guarda la categoría con el idioma ya que el idioma en todas las películas es el ingles
       TRIM(LOWER(cat.name)) AS category, 
       f.rental_duration,
       f.rental_rate,
       f.replacement_cost,
       f.rating,
       COUNT(i.film_id) AS available_copies
FROM   film AS f
       INNER JOIN film_category AS fcat ON f.film_id = fcat.film_id
       INNER JOIN category AS cat ON fcat.category_id = cat.category_id
       INNER JOIN language AS l ON f.language_id = l.language_id
       INNER JOIN inventory AS i ON f.film_id = i.film_id
WHERE
	   f.length > 0 
	   AND f.rating IS NOT NULL
GROUP BY f.film_id,
		 f.title,
		 f.length,
		 cat.name,
		 f.rental_duration,
		 f.rental_rate,
		 f.replacement_cost,
		 f.rating
