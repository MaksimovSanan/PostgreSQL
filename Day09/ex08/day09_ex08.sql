CREATE OR REPLACE FUNCTION FNC_FIBONACCI(PSTOP INTEGER 
DEFAULT 10) RETURNS TABLE(FIB INTEGER) AS $$ 
	WITH
	    RECURSIVE fibonacci(fib1, fib2) AS (
	        VALUES (0, 1)
	        UNION ALL
	        SELECT fib2, fib1 + fib2
	        FROM fibonacci
	        WHERE fib1 + fib2 < pstop
	    )
	SELECT fib2
	FROM fibonacci;
	$$ LANGUAGE 
SQL; 

SELECT * FROM fnc_fibonacci(100);

SELECT * FROM fnc_fibonacci();

DROP FUNCTION IF EXISTS fnc_fibonacci(pstop INTEGER);