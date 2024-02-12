WITH orders AS (SELECT pizzeria.name, COUNT(pizzeria.name), 'order' AS action_type
                FROM person_order
                         JOIN menu on person_order.menu_id = menu.id
                         JOIN pizzeria on menu.pizzeria_id = pizzeria.id
                GROUP BY pizzeria.name
                ORDER BY 2 DESC
    LIMIT 3)
   , visits AS (
SELECT pizzeria.name, COUNT (pizzeria.name), 'visit' AS action_type
FROM person_visits
    JOIN pizzeria
on person_visits.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY 2 DESC
    LIMIT 3)
SELECT *
FROM orders
UNION ALL
SELECT *
FROM visits