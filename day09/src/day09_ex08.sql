CREATE FUNCTION fnc_fibonacci(IN pstop INTEGER DEFAULT 10)
    RETURNS SETOF INTEGER
    LANGUAGE SQL
AS
$$
WITH RECURSIVE cte(Num1, Num2) AS
                   (VALUES (0, 1)
                    UNION ALL
                    SELECT GREATEST(Num1, Num2),
                           Num1 + Num2 AS FibonacciSeries
                    FROM cte
                    WHERE Num2 < pstop)
SELECT Num1
FROM cte;
$$;

SELECT *
FROM fnc_fibonacci();

SELECT *
FROM fnc_fibonacci(100);