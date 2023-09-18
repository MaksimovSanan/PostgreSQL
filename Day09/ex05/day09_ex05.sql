drop function fnc_persons_female(), fnc_persons_male();

-- Общая функция для возвращения лиц по полу

CREATE FUNCTION FNC_PERSONS(IN PGENDER VARCHAR DEFAULT 
'FEMALE') RETURNS SETOF PERSON AS $$ 
	SELECT * FROM person WHERE gender = pgender;
	$$ LANGUAGE 
SQL; 

select * from fnc_persons(pgender := 'male');

select * from fnc_persons();

DROP FUNCTION fnc_persons();

DROP FUNCTION fnc_persons(pgender varchar);