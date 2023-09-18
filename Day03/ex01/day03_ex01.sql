SELECT id
FROM menu
WHERE NOT EXISTS (SELECT *
				 FROM person_order
				 WHERE person_order.menu_id = menu.id);