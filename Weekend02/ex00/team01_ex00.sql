SELECT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    b.type AS type,
    b.volume AS volume,
    COALESCE(c.name, 'not defined') AS currency_name,
    COALESCE(rtu.rate_to_usd, 1) AS last_rate_to_usd,
    b.volume * COALESCE(rtu.rate_to_usd, 1) AS total_volume_in_usd
FROM "user" AS u
FULL JOIN (
	SELECT user_id, currency_id, type, SUM(money) AS volume
	FROM balance
	GROUP BY user_id, currency_id, type
) AS b ON u.id = b.user_id
LEFT JOIN currency AS c ON b.currency_id = c.id
LEFT JOIN (
        SELECT id, rate_to_usd
        FROM currency
		WHERE updated = (SELECT MAX(updated) FROM currency)
    ) rtu ON b.currency_id = rtu.id
GROUP BY 
	u.id, b.type, c.name, rtu.rate_to_usd, b.volume
ORDER BY 
	1 DESC, 2 ASC, 3 ASC;
