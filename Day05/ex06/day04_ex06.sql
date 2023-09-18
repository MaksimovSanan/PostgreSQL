CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats
AS SELECT *
FROM (SELECT piz.name, pv.visit_date
FROM person AS per
INNER JOIN person_visits AS pv ON per.id = pv.person_id
INNER JOIN pizzeria AS piz ON pv.pizzeria_id = piz.id
INNER JOIN menu AS m ON piz.id = m.pizzeria_id
WHERE per.name = 'Dmitriy' AND pv.visit_date = '2022-01-08' AND m.price < 800
) AS qwe;