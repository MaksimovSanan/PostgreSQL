CREATE VIEW v_price_with_discount
AS SELECT *
FROM (
SELECT per.name, m.pizza_name, m.price, ROUND((m.price - m.price * 0.1),0) AS discount_price
FROM person AS per
INNER JOIN person_order AS po ON per.id = po.person_id
INNER JOIN menu AS m ON po.menu_id = m.id
ORDER BY per.name, m.pizza_name) AS qwe;