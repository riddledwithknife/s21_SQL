INSERT INTO person_discounts
    (SELECT row_number() over () AS id, person_id,
            pizzeria_id,
            CASE
                WHEN count(person_order) = 1 THEN 10.5
                WHEN count(person_order) = 2 THEN 22
                ELSE 30
                END
     FROM person_order
              JOIN public.menu m on m.id = person_order.menu_id
     GROUP BY person_id, pizzeria_id)