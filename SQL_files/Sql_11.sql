/*Task */
select concat(first_name, '     ', Last_name) as full_name, date (last_update), actor_id from actor;

/* Task 2*/
/* 2.A*/
SElECT DISTINCT LAST_UPDATE FROM ACTOR;

/*2.B*/
select first_name, count(first_name) from actor a
where first_name in (select first_name from actor b where a.first_name = b.First_name and a.actor_id != b.actor_id)
and (select count(first_name) > 1 from actor) group by first_name;

select last_name, count(last_name) from actor a
where last_name in (select last_name from actor b where a.last_name = b.last_name and a.actor_id != b.actor_id)
and (select count(last_name) > 1 from actor) group by last_name;



/*2.C*/

select concat(first_name,'     ', last_name) as full_name from actor a
where  full_name in (select  concat(first_name,'     ', last_name) as full_name from actor b where a.full_name = b.full_name) 
and (select count( full_name) =1 from actor) group by full_name;


SELECT first_name, count(*) AS Similar_f_name FROM actor GROUP BY first_name HAVING Similar_f_name = 1;
SELECT last_name, count(*) AS Similar_l_name FROM actor GROUP BY first_name HAVING Similar_l_name = 1;

/* Task 3*/
/*3.A*/
select concat(first_name, '   ', last_name) as full_name, count(*) as Similar_name from actor group by full_name having Similar_name = 1;
/*3.B*/
select concat(first_name, '   ', last_name) as full_name, count(*) as Similar_name from actor group by full_name having Similar_name > 1;


/* Task 4*/
SELECT category.category_id,category.name AS 'Genre',actor.actor_id,concat(actor.first_name,'  ',actor.last_name) AS 'Actor Name',count(film.film_id) AS 'Number of films' FROM category
JOIN film_category USING (category_id)
JOIN film_actor USING (film_id)
JOIN actor USING (actor_id)
JOIN film USING (film_id)
GROUP BY category.category_id,film_id ORDER BY category.name,count(film.film_id) DESC ;


/* TASK 5*/
SELECT COUNT(CATEGORY_ID), NAME FROM CATEGORY A WHERE CATEGORY IN (SELECT FILM_ID B FROM FILM_CATEGORY WHERE A.category = B.film_category);

SELECT COUNT(C.CATEGORY_ID), NAME,DESCRIPTION, RATING FROM CATEGORY AS C INNER JOIN film_category AS F ON (C.CATEGORY_ID = F.category_id)
INNER JOIN FILM AS FI ON (F.FILM_ID = FI.FILM_ID) GROUP BY C.CATEGORY_ID AND RATING IN (SELECT TITLE, RATING FROM FILM WHERE RATING LIKE 'R');

/*TASK 6*/
/*6.A*/
SELECT title FROM film WHERE replacement_cost = 9;          -- THERE ARE NO FILMS WITH REPLACEMENT COST LESS THAN OR EQUAL 9 AS THE MINIMUM VALUE IN THAT SECTION IS 9.99
SELECT MIN(REPLACEMENT_COST) FROM FILM;

/*6.B*/
SELECT TITLE, REPLACEMENT_COST FROM FILM WHERE REPLACEMENT_COST between 15 AND 20;

/*6.C*/
SELECT TITLE, MAX(REPLACEMENT_COST) AS REPLACEMENT_COST, RENTAL_RATE AS REPLACEMENT_COST FROM FILM ORDER BY RENTAL_RATE ASC;
SELECT MAX(REPLACEMENT_COST) FROM FILM;
SELECT MIN(RENTAL_RATE) FROM FILM;


/* TASK 7*/
select title, count(actor_id) from film f join film_actor fa on(f.film_id = fa.film_id) group by f.film_id;


/* Task 8*/
select title from film where title like  'K%' or title like "Q%";


/* Task 9*/
select * from actor where actor_id in (select actor_id from film_actor 
where film_id in (select film_id from film where title = 'AGENT TRUMAN'));


/* task 10*/
SELECT film_id, title,
(SELECT (SELECT name FROM category AS C WHERE C.category_id = FC.category_id)
FROM film_category AS FC WHERE FC.film_id = F.film_id) AS Category
FROM film AS F
HAVING Category = "Family";

/*Task 11*/
 select title, count(rental_id) as 'No of times rented' from rental r join inventory i on (r.inventory_id = i.inventory_id) join film f on (i.film_id = f.film_id)
 group by f.title order by 'No of times rented' DESC;
 
 /* Task 12*/

select  avg(replacement_cost - rental_rate) as Avg_diff, name  from film f join film_category fc on (f.film_id = fc.film_id)
join category c on (c.category_id = fc.category_id) group by name;
