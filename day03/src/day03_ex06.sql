WITH pizza AS (SELECT menu.pizza_name, piz.name, piz.id, menu.price
               FROM menu
                        JOIN pizzeria piz ON piz.id = menu.pizzeria_id)

SELECT DISTINCT menu.pizza_name AS pizza_name, p1.name AS pizzeria_name_1, p2.name AS pizzeria_name_2, p1.price
FROM menu
         JOIN pizza p1 ON p1.pizza_name = menu.pizza_name
         JOIN pizza p2 ON p2.pizza_name = menu.pizza_name
WHERE p1.id > p2.id
  and p1.price = p2.price
ORDER BY menu.pizza_name