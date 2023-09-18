INSERT INTO person_visits
VALUES (
	(SELECT COUNT(*) + 1
	FROM person_visits),
	(SELECT per.id
	FROM person AS per
	WHERE per.name = 'Dmitriy'),
	(SELECT MIN(m.pizzeria_id)
	FROM menu AS m
	WHERE price < 800),
	'2022-01-08'
);

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;