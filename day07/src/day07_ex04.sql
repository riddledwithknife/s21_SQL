SELECT name, COUNT(person_id = person.id) AS count_of_visits
FROM person
         JOIN person_visits on person.id = person_visits.person_id
GROUP BY name
HAVING COUNT(person_id = person.id) > 3