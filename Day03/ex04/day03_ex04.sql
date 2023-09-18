WITH FEMALE(pizzeria, fem_count) AS
(
	SELECT piz.name, COUNT(*)
	FROM pizzeria AS piz
	INNER JOIN menu AS m ON piz.id = m.pizzeria_id
	INNER JOIN person_order AS po ON m.id = po.menu_id
	INNER JOIN person AS per ON po.person_id = per.id
	WHERE per.gender = 'female'
	GROUP BY piz.name
	),
	MALE(pizzeria, male_count) AS
	(	
	SELECT piz.name, COUNT(*)
	FROM pizzeria AS piz
	INNER JOIN menu AS m ON piz.id = m.pizzeria_id
	INNER JOIN person_order AS po ON m.id = po.menu_id
	INNER JOIN person AS per ON po.person_id = per.id
	WHERE per.gender = 'male'
	GROUP BY piz.name
	)
	
(SELECT name AS pizzeria_name
FROM pizzeria
EXCEPT
SELECT pizzeria AS pizzeria_name
FROM MALE)
INTERSECT
SELECT pizzeria AS pizzeria_name
FROM FEMALE
ORDER BY pizzeria_name;