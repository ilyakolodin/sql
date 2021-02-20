-- Дз 4
-- задание 1

select rental_id, customer_id,rental_date,
	row_number() over (partition by customer_id order by rental_date) from rental

--задание 2
--запрос

select customer_id, count(customer_id) as num_of_bts_films from(
	select r2.customer_id , r2.inventory_id, f.film_id, f.special_features 
	from rental r2 
	left outer join inventory i2 on r2.inventory_id = i2.inventory_id
	left outer join film f on f.film_id = i2.film_id 
	where 'Behind the Scenes' = any (f.special_features)) x
group by customer_id 

--materialized view

create materialized view customers_num_of_bts_films
as
select customer_id, count(customer_id) as num_of_bts_films from(
	select r2.customer_id , r2.inventory_id, f.film_id, f.special_features 
	from rental r2 
	left outer join inventory i2 on r2.inventory_id = i2.inventory_id
	left outer join film f on f.film_id = i2.film_id 
	where 'Behind the Scenes' = any (f.special_features)) x
group by customer_id 
with data;

--проверка работоспособности

select * from customers_num_of_bts_films

--обновление

refresh materialized view customers_num_of_bts_films

--варианты поиска

select special_features from film where 'Behind the Scenes' = any (special_features)

select special_features from film where special_features && array['Behind the Scenes']

select special_features FROM
   (SELECT special_features,
           generate_subscripts(special_features, 1) AS s
      FROM film) AS foo
 WHERE special_features[s] = 'Behind the Scenes'