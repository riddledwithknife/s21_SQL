SELECT person.name
FROM person
         JOIN person_order po on person.id = po.person_id
         JOIN menu m on m.id = po.menu_id
WHERE gender = 'female'
  AND pizza_name = 'pepperoni pizza'
  AND person.id IN (SELECT person_id
                    FROM person_order
                             JOIN menu on menu.id = person_order.menu_id
                    WHERE menu.pizza_name = 'cheese pizza')
ORDER BY person.name