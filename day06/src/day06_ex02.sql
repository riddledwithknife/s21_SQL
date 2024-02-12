SELECT person.name,
       pizza_name,
       price,
       price * (1 - (person_discounts.discount / 100)) AS person_discount,
       pizzeria.name                                   AS pizzeria_name
FROM person_order
         JOIN person ON person_order.person_id = person.id
         JOIN menu ON person_order.menu_id = menu.id
         JOIN person_discounts ON person.id = person_discounts.person_id
         JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY person.name, pizza_name