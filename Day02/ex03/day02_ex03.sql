WITH CTE (date)
AS (SELECT visit_date
		  FROM person_visits
		  WHERE  person_id = 1 OR person_id = 2),
		  CTE_DATE (missing_date) 
		  AS (SELECT missing_date::DATE
FROM generate_series('2022-01-01', '2022-01-10', '1 day'::interval) AS missing_date
			 )
SELECT missing_date
FROM CTE_DATE
LEFT JOIN CTE ON CTE.date = CTE_DATE.missing_date
WHERE date is NULL;