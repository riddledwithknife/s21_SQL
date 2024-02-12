SELECT name, SUM(total_count) AS total_count
FROM ((SELECT pizzeria.name,
              COUNT(pizzeria_id) AS total_count
       FROM person_visits
                JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
       GROUP BY 1
       ORDER BY 2 DESC)
      UNION ALL
      (SELECT pizzeria.name,
              COUNT(pizzeria.name) AS total_count
       FROM person_order po
                JOIN menu ON po.menu_id = menu.id
                JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
       GROUP BY 1
       ORDER BY 2 DESC)) AS tot
GROUP BY name
ORDER BY 2 DESC, 1;