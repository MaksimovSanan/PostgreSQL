SELECT order_date AS action_date, per.name AS person_name
FROM person_order AS po
INNER JOIN person AS per ON po.person_id = per.id
INTERSECT
SELECT visit_date AS action_date, per.name AS person_name
FROM person_visits AS pv
INNER JOIN person AS per ON pv.person_id = per.id
ORDER BY action_date, person_name DESC;