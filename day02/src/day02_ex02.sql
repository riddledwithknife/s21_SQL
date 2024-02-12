SELECT (CASE WHEN p.name IS NULL THEN '-' ELSE p.name END)   AS person_name,
       date ::date                                           AS visit_date,
       (CASE WHEN pz.name IS NULL THEN '-' ELSE pz.name END) AS pizzeria_name
FROM generate_series('2022-01-01', '2022-01-03', INTERVAL '1 day') AS date
         LEFT JOIN person_visits pv
ON pv.visit_date = date
    FULL JOIN person p ON p.id = pv.person_id
    FULL JOIN pizzeria pz ON pz.id = pv.pizzeria_id
ORDER BY person_name, visit_date, pizzeria_name