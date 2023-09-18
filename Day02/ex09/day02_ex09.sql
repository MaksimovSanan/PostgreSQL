WITH CTE_PEPE (name)
AS (SELECT name
   FROM person AS per
INNER JOIN person_order AS po ON per.id = po.person_id
INNER JOIN menu AS m ON po.menu_id = m.id
WHERE per.gender = 'female' AND
		m.pizza_name = 'pepperoni pizza'),
		CTE_CHESSE (c)
AS (SELECT name
   FROM person AS per
INNER JOIN person_order AS po ON per.id = po.person_id
INNER JOIN menu AS m ON po.menu_id = m.id
WHERE per.gender = 'female' AND
		m.pizza_name = 'cheese pizza')
		
SELECT name
FROM CTE_PEPE AS pepe
JOIN CTE_CHESSE AS ch ON pepe.name = ch.c
ORDER BY name;