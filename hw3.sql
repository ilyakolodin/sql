--дз основы SQL

-- Задание 1
select store_id, count(customer_id) from customer c 
group by store_id
having count(customer_id)>300

-- Задание 2
select c.customer_id , c2.city 
from customer c 
left outer join address a2 ON c.address_id = a2.address_id
left outer join city c2 ON a2.city_id = c2.city_id 

-- Задание 3
select first_name, last_name, c2.city from staff s 
left outer join store s2 ON s.store_id = s2.store_id
left outer join address a2 ON s2.address_id = a2.address_id
left outer join city c2 ON a2.city_id = c2.city_id 
where s.store_id = (select store_id from customer c 
	group by store_id
	having count(customer_id)>300)

-- Задание 4
select count(distinct actor_id) from film_actor fa
where film_id in (
	select film_id from film
	where rental_rate = 2.99)












