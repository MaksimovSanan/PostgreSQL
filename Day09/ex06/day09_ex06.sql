-- Создание функции pl/pgsql fnc_person_visits_and_eats_on_date

CREATE OR REPLACE FUNCTION FNC_PERSON_VISITS_AND_EATS_ON_DATE
(PPERSON VARCHAR DEFAULT 'DMITRIY', PPRICE NUMERIC 
DEFAULT 500, PDATE DATE DEFAULT '2022-01-08') RETURNS 
SETOF VARCHAR AS $$ 
	BEGIN RETURN QUERY
	SELECT DISTINCT pizzeria.name
	FROM person_order AS po
	    JOIN menu AS me ON po.menu_id = me.id
	    JOIN person_visits pv ON po.person_id = pv.person_id AND me.pizzeria_id = pv.pizzeria_id AND po.order_date = pv.visit_date
	    JOIN pizzeria ON pizzeria.id = pv.pizzeria_id
	WHERE po.person_id = (
	        SELECT id
	        FROM person
	        WHERE
	            name = pperson
	    )
	    AND me.price < pprice
	    AND po.order_date = pdate;
	END;
	$$ LANGUAGE 
PLPGSQL; 

-- Вызов функции с параметром pprice = 800

select *
from
    fnc_person_visits_and_eats_on_date(pprice := 800);

-- Вызов функции с параметрами pperson = 'Anna', pprice = 1300 и pdate = '2022-01-01'

select *
from
    fnc_person_visits_and_eats_on_date(
        pperson := 'Anna',
        pprice := 1300,
        pdate := '2022-01-01'
    );

DROP FUNCTION
    fnc_person_visits_and_eats_on_date(varchar, numeric, date);