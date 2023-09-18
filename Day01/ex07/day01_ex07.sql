SELECT po.order_date, CONCAT(per.name,' (age:', per.age, ')') AS person_information
FROM person_order AS po
INNER JOIN person AS per ON po.person_id = per.id
ORDER BY order_date, person_information;