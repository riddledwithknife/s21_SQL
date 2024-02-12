COMMENT
ON TABLE person_discounts
    IS 'Таблица скидок покупателей';
COMMENT
ON COLUMN person_discounts.id
    IS 'Основной ключ';
COMMENT
ON COLUMN person_discounts.person_id
    IS 'Побочный ключ на клиента';
COMMENT
ON COLUMN person_discounts.pizzeria_id
    IS 'Побочный ключ на пиццерию';
COMMENT
ON COLUMN person_discounts.discount
    IS 'Размер скидки в процентах'