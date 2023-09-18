SELECT m.pizza_name, p.name AS pizzeria_name, m.price
FROM pizzeria p
INNER JOIN menu AS m ON p.id = m.pizzeria_id
WHERE m.pizza_name = 'mushroom pizza' OR m.pizza_name = 'pepperoni pizza'
ORDER BY m.pizza_name, pizzeria_name;