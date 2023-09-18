WITH FEMALE(pizzeria, fem_count) AS
(
	SELECT piz.name, COUNT(*)
	FROM pizzeria AS piz
	INNER JOIN person_visits AS pv ON piz.id = pv.pizzeria_id
	INNER JOIN person AS per ON pv.person_id = per.id
	WHERE per.gender = 'female'
	GROUP BY piz.name
	),
	MALE(pizzeria, male_count) AS
	(	
		SELECT piz.name, COUNT(*)
		FROM pizzeria AS piz
		INNER JOIN person_visits AS pv ON piz.id = pv.pizzeria_id
		INNER JOIN person AS per ON pv.person_id = per.id
		WHERE per.gender = 'male'
		GROUP BY piz.name
	)
	
SELECT name AS pizzeria_name
FROM pizzeria AS piz
INNER JOIN MALE ON piz.name = MALE.pizzeria
INNER JOIN FEMALE ON piz.name = FEMALE.pizzeria
WHERE MALE.male_count <> FEMALE.fem_count
ORDER BY pizzeria_name;