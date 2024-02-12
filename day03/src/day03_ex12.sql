INSERT INTO person_order
SELECT p_id + (SELECT max(id) FROM person_order),
       id,
       (SELECT id FROM menu WHERE pizza_name = 'greek pizza') AS menu_id,
       '2022-02-25'                                           AS order_date
FROM person
         JOIN generate_series(1, (SELECT count(*) FROM person)) AS p_id ON p_id = person.id