CREATE VIEW v_price_with_discount AS
(
SELECT person.name, pizza_name, price, round(price - price * 0.1) AS discount_price
FROM person
         JOIN public.person_order po on person.id = po.person_id
         JOIN public.menu m on po.menu_id = m.id
ORDER BY person.name, pizza_name
    )