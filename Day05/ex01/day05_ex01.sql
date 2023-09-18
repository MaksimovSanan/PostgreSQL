SET enable_seqscan TO OFF;
EXPLAIN
ANALYZE
SELECT m.pizza_name, piz.name
FROM menu AS m
INNER JOIN pizzeria AS piz ON m.pizzeria_id = piz.id;