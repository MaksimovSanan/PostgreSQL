SELECT p.id AS "person.id", p.name AS "person.name", p.age, p.gender, p.address, pizzeria.id AS "pizzeria.id", pizzeria.name AS "pizzeria.name", pizzeria.rating FROM person AS p
CROSS JOIN pizzeria
ORDER BY p.id, pizzeria.id;