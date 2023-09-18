CREATE INDEX idx_person_name
ON person (UPPER(name));

SET enable_seqscan TO OFF;
EXPLAIN ANALYZE SELECT pv.visit_date, per.name
FROM person_visits AS pv
INNER JOIN person AS per ON pv.id = per.id
WHERE UPPER(per.name) = 'anna';