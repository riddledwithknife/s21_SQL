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
GROUP BY n1.point2, n2.point2, n3.point2),
    tour_costs AS (
SELECT MIN (total_cost) AS min_cost, MAX (total_cost) AS max_cost
FROM all_tours)
SELECT a.total_cost, a.tour
FROM all_tours a,
     tour_costs tc
WHERE a.total_cost = tc.min_cost
   OR a.total_cost = tc.max_cost
ORDER BY a.total_cost, a.tour;