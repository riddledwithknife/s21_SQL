SELECT date ::date AS missing_date
FROM generate_series('2022-01-01', '2022-01-10', INTERVAL '1 day') AS date
         LEFT JOIN (SELECT visit_date FROM person_visits WHERE person_id = 1 or person_id = 2) pv
ON date = pv.visit_date
WHERE pv.visit_date is NULL
ORDER BY missing_date