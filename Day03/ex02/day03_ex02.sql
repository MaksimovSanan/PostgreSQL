SELECT m.pizza_name, m.price, piz.name AS "pizzeria_name"
FROM menu AS m
LEFT JOIN person_order AS po ON m.id = po.menu_id
INNER JOIN pizzeria AS piz ON m.pizzeria_id = piz.id
WHERE po.order_date IS NULL
ORDER BY pizza_name, price;