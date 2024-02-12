SELECT days AS missing_date
FROM v_generated_dates
WHERE days NOT IN (SELECT visit_date FROM person_visits)
ORDER BY missing_date