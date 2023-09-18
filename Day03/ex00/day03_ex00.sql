SELECT m.pizza_name, m.price, piz.name AS "pizzeria_name", pv.visit_date
FROM person AS per
INNER JOIN person_visits AS pv ON per.id = pv.person_id
INNER JOIN pizzeria AS piz ON pv.pizzeria_id = piz.id
INNER JOIN menu AS m ON piz.id = m.pizzeria_id
WHERE per.name = 'Kate' AND m.price BETWEEN 800 AND 1000
ORDER BY pizza_name, price, pizzeria_name;