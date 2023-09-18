SELECT date::DATE
FROM generate_series('2022-01-01', '2022-01-10', '1 day'::interval) AS date
LEFT JOIN (SELECT person_id, visit_date
		  FROM person_visits
		  WHERE  person_id = 1 OR person_id = 2) AS per ON date = per.visit_date
WHERE visit_date is NULL
ORDER BY date;