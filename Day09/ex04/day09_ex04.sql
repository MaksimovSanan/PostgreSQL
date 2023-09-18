-- Функция для возвращения лиц мужского пола

CREATE FUNCTION FNC_PERSONS_MALE() RETURNS SETOF PERSON 
AS $$ 
	SELECT * FROM person WHERE gender = 'male';
	$$ LANGUAGE 
SQL; 

-- Функция для возвращения лиц женского пола

CREATE FUNCTION FNC_PERSONS_FEMALE() RETURNS SETOF 
PERSON AS $$ 
	SELECT * FROM person WHERE gender = 'female';
	$$ LANGUAGE 
SQL; 

-- Вызов функции для возвращения лиц мужского пола

SELECT * FROM fnc_persons_male();

-- Вызов функции для возвращения лиц женского пола

SELECT * FROM fnc_persons_female();

DROP FUNCTION FNC_PERSONS_MALE();

DROP FUNCTION fnc_persons_female();