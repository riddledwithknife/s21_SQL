SELECT piz.name AS pizzeria_name
FROM pizzeria piz
         JOIN person_visits pv ON piz.id = pv.pizzeria_id
         JOIN person p ON pv.person_id = p.id
WHERE p.name = 'Andrey'
  AND pv.pizzeria_id NOT IN (SELECT m.pizzeria_id
                             FROM menu m
                                      JOIN person_order po ON m.id = po.menu_id
                                      JOIN person p ON po.person_id = p.id
                             WHERE p.name = 'Andrey');