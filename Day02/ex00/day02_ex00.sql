SELECT name, rating
FROM pizzeria p
LEFT JOIN (SELECT DISTINCT pizzeria_id 
		   FROM person_visits) AS pv 
		   ON pv.pizzeria_id = p.id
		   WHERE pizzeria_id is NULL;
