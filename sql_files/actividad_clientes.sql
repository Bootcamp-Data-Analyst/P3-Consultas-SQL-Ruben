-- Referenciar la BDD
USE sakila;

-- Consultas de los campos de las tablas propuestas (customer,address,city,country,rental,payment)

SELECT * FROM customer;
SELECT * FROM address;
SELECT * FROM city;
SELECT * FROM country;
SELECT * FROM rental;
SELECT * FROM payment;

-- Unión de tablas.

SELECT c.customer_id,
	   TRIM(LOWER(CONCAT(c.first_name,' ',c.last_name))) AS customer_name,
       -- TRIM(LOWER(a.address)) AS address, No se incluye debido a que no se realizará un análisis con esta columna 
       -- TRIM(LOWER(a.district)) AS district, No se incluye debido a que no se realizará un análisis con esta columna 
       TRIM(LOWER(ci.city)) AS city,
       TRIM(LOWER(co.country)) AS country,
       r.rental_date,
       r.return_date,
       DATEDIFF(r.return_date,r.rental_date) AS rental_duration ,
       p.amount
       -- No se incluye la fecha de pago ya que se realiza a la vez que se alquila
       -- p.payment_date,
       -- DATEDIFF(r.rental_date,p.payment_date) AS diff_rental_between_payment
FROM customer AS c
       INNER JOIN address AS a ON c.address_id = a.address_id
       INNER JOIN city AS ci ON a.city_id = ci.city_id
       INNER JOIN country AS co ON ci.country_id = co.country_id
       INNER JOIN rental AS r ON c.customer_id = r.customer_id
       INNER JOIN payment AS p ON r.rental_id = p.rental_id
WHERE  r.rental_id IS NOT NULL
       AND r.return_date IS NOT NULL
       AND p.amount > 0
       AND r.rental_date < r.return_date;
       
       
       
       
       
       
		




