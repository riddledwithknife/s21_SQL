SELECT pizza_name, price, piz.name AS pizzeria_name, visit_date
FROM menu
         JOIN public.pizzeria piz on piz.id = menu.pizzeria_id
         JOIN public.person_visits pv on piz.id = pv.pizzeria_id
         JOIN public.person p on pv.person_id = p.id
WHERE p.name = 'Kate'
  AND price BETWEEN 800 AND 1000
ORDER BY pizza_name, price, pizzeria_name