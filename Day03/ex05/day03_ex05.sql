WITH VISITED(pizzeria) AS
(
	SELECT piz.name
	FROM pizzeria AS piz
	INNER JOIN person_visits AS pv ON piz.id = pv.pizzeria_id
	INNER JOIN person AS per ON pv.person_id = per.id
	WHERE per.name = 'Andrey'
	GROUP BY piz.name
	),
	ORDERED(pizzeria) AS
	(	
	SELECT piz.name
	FROM pizzeria AS piz
	INNER JOIN menu AS m ON piz.id = m.pizzeria_id
	INNER JOIN person_order AS po ON m.id = po.menu_id
	INNER JOIN person AS per ON po.person_id = per.id
	WHERE per.name = 'Andrey'
	GROUP BY piz.name
	)
	
SELECT pizzeria AS pizzeria_name
FROM VISITED
EXCEPT
SELECT pizzeria AS pizzeria_name
FROM ORDERED
ORDER BY pizzeria_name;