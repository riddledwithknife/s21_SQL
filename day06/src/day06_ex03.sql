CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts (person_id, pizzeria_id);

SET
enable_seqscan = OFF;
EXPLAIN
ANALYSE
SELECT *
FROM person_discounts
WHERE person_id > 1