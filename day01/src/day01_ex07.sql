SELECT order_date, (SELECT name || ' (age:' || age || ')' FROM person WHERE person_id = id) AS person_information
FROM person_order
ORDER BY order_date, person_information