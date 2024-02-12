SELECT order_date, name || ' (age:' || age || ')' AS person_information
FROM person_order AS po(primary_id, id, menu_id, order_date)
         NATURAL JOIN person
ORDER BY order_date, person_information;