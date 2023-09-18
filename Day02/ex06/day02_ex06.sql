SELECT m.pizza_name, piz.name AS pizzeria_name
FROM menu m
INNER JOIN pizzeria AS piz ON m.pizzeria_id = piz.id
INNER JOIN person_order AS po ON m.id = po.menu_id
INNER JOIN person AS per ON po.person_id = per.id
WHERE per.name = 'Denis' OR per.name = 'Anna'
ORDER BY pizza_name, pizzeria_name;
