SELECT name, rating
FROM pizzeria
         LEFT JOIN public.person_visits pv on pizzeria.id = pv.pizzeria_id
WHERE pv.pizzeria_id is NULL