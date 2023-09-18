SELECT per.name
FROM person AS per
INNER JOIN person_order AS po ON per.id = po.person_id
INNER JOIN menu AS m ON po.menu_id = m.id
WHERE per.gender = 'male' AND (per.address = 'Moscow' OR per.address = 'Samara') AND 
		(m.pizza_name = 'pepperoni pizza' OR m.pizza_name = 'mushroom pizza')
ORDER BY name DESC;