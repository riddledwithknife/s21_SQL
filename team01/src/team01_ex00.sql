WITH last_currency_rates AS (SELECT id,
                                    rate_to_usd,
                                    ROW_NUMBER() OVER (PARTITION BY id ORDER BY updated DESC) AS rn
                             FROM currency),
     b_money AS (SELECT user_id, SUM(money) AS total_money, type
                 FROM balance
                 GROUP BY user_id, type)

SELECT COALESCE(u.name, 'not defined')               AS name,
       COALESCE(u.lastname, 'not defined')           AS lastname,
       b.type,
       bm.total_money                                AS volume,
       COALESCE(c.name, 'not defined')               AS currency_name,
       COALESCE(lcr.rate_to_usd, 1)                  AS last_rate_to_usd,
       bm.total_money * COALESCE(lcr.rate_to_usd, 1) AS total_volume_in_usd
FROM balance b
         LEFT JOIN "user" u ON b.user_id = u.id
         LEFT JOIN b_money bm ON b.user_id = bm.user_id AND b.type = bm.type
         LEFT JOIN currency c ON b.currency_id = c.id
         LEFT JOIN last_currency_rates lcr ON b.currency_id = lcr.id AND lcr.rn = 1
GROUP BY COALESCE(u.name, 'not defined'), COALESCE(u.lastname, 'not defined'),
         b.type, COALESCE(c.name, 'not defined'),
         lcr.rate_to_usd, c.id,
         bm.total_money
ORDER BY COALESCE(u.name, 'not defined') DESC, COALESCE(u.lastname, 'not defined'),
         b.type, c.id;
