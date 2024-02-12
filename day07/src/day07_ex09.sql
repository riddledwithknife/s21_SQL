SELECT person.address,
       ROUND(MAX(person.age::numeric) - (MIN(person.age::numeric) / MAX(person.age::numeric)), 2) AS formula,
       ROUND(AVG(person.age::numeric), 2)                                                         AS average,
       CASE
           WHEN MAX(person.age::numeric) - (MIN(person.age::numeric) / MAX(person.age::numeric)) >
                AVG(person.age::numeric) THEN true
           ELSE false END                                                                         AS comparison
FROM person
GROUP BY person.address
ORDER BY 1