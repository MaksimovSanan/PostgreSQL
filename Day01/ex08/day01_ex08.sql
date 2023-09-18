SELECT per.order_date, CONCAT(per.name,' (age:', per.age, ')') AS person_information
FROM (person NATURAL JOIN (SELECT *
			 FROM person_order as hui(asd, id, menu_id, order_date)) as pers) as per
ORDER BY order_date, person_information;