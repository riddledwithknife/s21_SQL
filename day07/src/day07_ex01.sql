SELECT name, count(person_visits.person_id) AS count_of_visits
FROM person
         JOIN public.person_visits on person.id = person_visits.person_id
GROUP BY name
ORDER BY count_of_visits DESC, name LIMIT 4