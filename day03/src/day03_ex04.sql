WITH all_genders AS (SELECT p.gender, piz.name
                     FROM person p
                              JOIN person_order po on p.id = po.person_id
                              JOIN menu m ON po.menu_id = m.id
                              JOIN pizzeria piz on m.pizzeria_id = piz.id),
     only_male AS (SELECT name
                   FROM all_genders
                   WHERE gender = 'male'),
     only_female AS (SELECT name
                     FROM all_genders
                     WHERE gender = 'female')
SELECT name AS pizzeria_name
FROM only_female
EXCEPT
SELECT name AS pizzeria_name
FROM only_male;
