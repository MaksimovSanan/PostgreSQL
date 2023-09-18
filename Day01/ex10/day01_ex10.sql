SELECT per.name AS person_name, m.pizza_name AS pizza_name, piz.name AS pizzeria_name
FROM person AS per
INNER JOIN person_order AS po ON per.id = po.person_id
INNER JOIN menu AS m ON po.menu_id = m.id
INNER JOIN pizzeria AS piz ON m.pizzeria_id = piz.id
ORDER BY person_name, pizza_name, pizzeria_name;