CREATE FUNCTION func_minimum(arr VARIADIC numeric[]) RETURNS numeric AS
    $$
SELECT MIN(arg)
FROM UNNEST(arr) G(arg) $$ LANGUAGE sql;

SELECT func_minimum(VARIADIC arr => ARRAY [10.0, -1.0, 5.0, 4.4]);