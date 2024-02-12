SELECT pizza_name, piz.name AS pizzeria_name
FROM menu
         JOIN pizzeria piz on menu.pizzeria_id = piz.id
         JOIN person_order po on menu.id = po.menu_id
         JOIN person p on po.person_id = p.id
WHERE p.name = 'Denis'
   OR p.name = 'Anna'
ORDER BY pizza_name, pizzeria_name