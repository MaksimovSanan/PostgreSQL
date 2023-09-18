WITH cte AS (
SELECT po.person_id, m.pizzeria_id, count(*)
FROM person_order AS po
        INNER JOIN menu AS m ON po.menu_id = m.id
GROUP BY po.person_id, m.pizzeria_id
ORDER BY person_id)

INSERT INTO person_discounts(id, person_id, pizzeria_id, discount)
(SELECT ROW_NUMBER() OVER() AS
    id,
    person_id,
    pizzeria_id,
 	 (
       CASE
        WHEN
            count = 1 THEN 10.5
        WHEN
            count = 2 THEN 22
        ELSE
           30
        END
    )
    FROM cte
);
 