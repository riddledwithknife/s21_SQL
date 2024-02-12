WITH ids_and_currencys as (SELECT DISTINCT currency.id, currency.name
                           FROM currency)

SELECT COALESCE("user".name, 'not defined')     AS name,
       COALESCE("user".lastname, 'not defined') AS lastname,
       ids_and_currencys.name                   AS currency_name,
       COALESCE(
               (SELECT rate_to_usd
                FROM currency
                WHERE balance.currency_id = currency.id
                  AND currency.updated < balance.updated
                ORDER BY currency.updated DESC
               LIMIT 1),
               (SELECT rate_to_usd
                FROM currency
                WHERE balance.currency_id = currency.id
                  AND currency.updated > balance.updated
                ORDER BY currency.updated
                LIMIT 1)
       ) * money          AS currency_to_usd
FROM balance
         JOIN ids_and_currencys ON ids_and_currencys.id = balance.currency_id
         LEFT JOIN "user" ON "user".id = balance.user_id
ORDER BY 1 DESC, 2, 3;
