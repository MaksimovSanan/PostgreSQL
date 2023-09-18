WITH DUPLICAT(pizza, price) AS
(
	SELECT m.pizza_name AS pizza, price
	FROM pizzeria AS piz
	INNER JOIN menu AS m ON piz.id = m.pizzeria_id
	GROUP BY price, m.pizza_name
	HAVING count(*) > 1
	)
SELECT DISTINCT m1.pizza_name, piz1.name AS pizzeria_name_1, piz2.name AS pizzeria_name_2, m1.price
FROM menu AS m1
INNER JOIN menu AS m2 ON m1.pizza_name = m2.pizza_name AND m1.price = m2.price
INNER JOIN pizzeria AS piz1 ON m1.pizzeria_id = piz1.id
INNER JOIN pizzeria AS piz2 ON m2.pizzeria_id = piz2.id
LEFT JOIN DUPLICAT AS D ON m1.pizza_name = D.pizza AND m2.pizza_name = D.pizza AND m1.price = D.price AND m2.price = D.price
WHERE m1.id > m2.id
ORDER BY pizza_name;