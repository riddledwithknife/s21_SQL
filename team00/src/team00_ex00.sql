CREATE TABLE nodes
(
    point1 varchar,
    point2 varchar,
    cost   integer
);

INSERT INTO nodes
VALUES ('A', 'B', 10),
       ('A', 'C', 15),
       ('A', 'D', 20),
       ('B', 'A', 10),
       ('B', 'D', 25),
       ('B', 'C', 35),
       ('C', 'A', 15),
       ('C', 'B', 35),
       ('C', 'D', 30),
       ('D', 'A', 20),
       ('D', 'B', 25),
       ('D', 'C', 30);

WITH all_tours AS (SELECT SUM(n1.cost + n2.cost + n3.cost + n4.cost) AS total_cost,
                          ARRAY['A',
                          n1.point2,
                          n2.point2,
                          n3.point2,
                          'A'] AS tour
FROM nodes n1
    JOIN nodes n2
ON n1.point2 = n2.point1 AND n1.point2 != 'A'
    JOIN nodes n3 ON n2.point2 = n3.point1 AND n2.point2 != n1.point1
    JOIN nodes n4 ON n3.point2 = n4.point1 AND n3.point2 != n2.point1
WHERE n1.point1 = 'A'
  AND n4.point2 = 'A'
  AND n4.point1 != 'A'
GROUP BY n1.point2, n2.point2, n3.point2)
SELECT total_cost, tour
FROM all_tours
WHERE total_cost = (SELECT MIN(total_cost) FROM all_tours)
ORDER BY tour;