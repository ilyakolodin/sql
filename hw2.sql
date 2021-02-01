select customer_id, first_name from customer
where activebool = false;

select film_id, title from film
where release_year = 2006;

select customer_id, payment_date from payment
order by payment_date desc
LIMIT 10;

SELECT * from information_schema.table_constraints

SELECT * from information_schema.columns