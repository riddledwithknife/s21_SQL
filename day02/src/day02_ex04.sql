SELECT pizza_name, p.name AS pizzeria_name, price
FROM menu
         JOIN public.pizzeria p on menu.pizzeria_id = p.id
WHERE pizza_name = 'mushroom pizza'
   OR pizza_name = 'pepperoni pizza'
ORDER BY pizza_name, p.name