SELECT person.name
FROM person
         JOIN public.person_order po on person.id = po.person_id
         JOIN public.menu m on po.menu_id = m.id
WHERE gender = 'male'
  AND (address = 'Moscow' OR address = 'Samara')
  AND (pizza_name = 'pepperoni pizza' OR pizza_name = 'mushroom pizza')
ORDER BY name DESC