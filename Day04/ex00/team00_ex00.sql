SELECT *
FROM (SELECT point2 AS PERVAYA, cost
	FROM nodes 
	WHERE point1 = 'a'
	  ) AS qwe
RIGHT JOIN nodes ON qwe.PERVAYA = nodes.point1

CREATE TABLE nodes(
	point1 varchar(1),
	point2 varchar(1), 
	cost int
);

INSERT INTO nodes
VALUES 	('a', 'b', 10),
		('a', 'c', 15),
		('a', 'd', 20),
		('b', 'c', 35),
		('b', 'd', 25),
		('c', 'd', 30),
		('b', 'a', 10),
		('c', 'a', 15),
		('d', 'a', 20),
		('c', 'b', 35),
		('d', 'b', 25),
		('d', 'c', 30);

WITH RECURSIVE r AS (
    SELECT 
		nodes.point1, 
		nodes.point2, 
		nodes.cost,
		CONCAT('{a', ',', nodes.point2) AS path
	FROM nodes
	WHERE point1 = 'a'
    UNION 
    SELECT 
		nodes.point1, 
		nodes.point2, 
		r.cost + nodes.cost AS cost,
		CONCAT(r.path, ',', nodes.point2) AS path
	FROM nodes
	JOIN r ON (nodes.point1 = r.point2) AND strpos(r.path, nodes.point2) = 0
), updated AS (
	SELECT point1, point2, cost + 
	(SELECT cost
	FROM nodes
	WHERE nodes.point2 = 'a' AND r.point2 = nodes.point1
	) AS total_cost, CONCAT(path, ',a}') as tour
	FROM r
	WHERE ((SELECT LENGTH(path)) = 2 * (SELECT COUNT(DISTINCT point1)
									 FROM nodes))
)
	SELECT total_cost, tour 
	FROM updated
	WHERE total_cost = (SELECT MIN(total_cost) FROM updated)
ORDER BY tour;
