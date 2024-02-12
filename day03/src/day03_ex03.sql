SELECT piz.name
FROM pizzeria piz
         JOIN (SELECT count(person.id), pv.pizzeria_id
               FROM person
                        JOIN person_visits pv on person.id = pv.person_id
               WHERE person.gender = 'male'
               GROUP BY pizzeria_id) male ON male.pizzeria_id = piz.id
         JOIN (SELECT count(person.id), pv.pizzeria_id
               FROM person
                        JOIN person_visits pv on person.id = pv.person_id
               WHERE person.gender = 'female'
               GROUP BY pizzeria_id) female ON female.pizzeria_id = piz.id
WHERE male > female
   or female > male
ORDER BY name