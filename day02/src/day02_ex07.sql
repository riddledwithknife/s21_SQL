SELECT pizzeria.name
FROM pizzeria
         JOIN public.person_visits pv on pizzeria.id = pv.pizzeria_id
         JOIN public.menu m on pizzeria.id = m.pizzeria_id
         JOIN public.person p on pv.person_id = p.id
WHERE price < 800
  AND visit_date = '2022-01-08'
  AND p.name = 'Dmitriy'