insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29'); 
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH currency_data AS (SELECT 
            bal.user_id AS bui, bal.money AS bal_money, bal.updated AS bal_upd,
                        curr.name AS currency_name, curr.rate_to_usd AS cur_rate, curr.updated AS cur_upd
                 FROM balance AS bal
                          INNER JOIN currency AS curr
                               ON (bal.currency_id = curr.id)
), final_data AS (SELECT in_feaut_upd.id, in_feaut_upd.currency_name, in_feaut_upd.bal_money, in_feaut_upd.bal_upd, COALESCE(in_past_upd.diff, in_feaut_upd.diff) new_diff
                   FROM (
            SELECT cur.bui AS id, currency_name, bal_money, bal_upd, MIN(bal_upd - cur_upd) AS diff
                        FROM currency_data AS cur
                        WHERE (bal_upd - cur_upd > INTERVAL '0 days')
                        GROUP BY 
              id, currency_name, bal_money, bal_upd
             ) AS in_past_upd
                           FULL JOIN (
                 SELECT cur.bui AS id, currency_name, bal_money, bal_upd, MAX(bal_upd - cur_upd) AS diff
                               FROM currency_data AS cur
                               WHERE (bal_upd - cur_upd < INTERVAL '0 days')
                               GROUP BY 
                   id, currency_name, bal_money, bal_upd
                 ) AS in_feaut_upd
                                     ON (in_past_upd.id = in_feaut_upd.id) 
                                        AND (in_past_upd.currency_name = in_feaut_upd.currency_name) 
                                        AND (in_past_upd.bal_money = in_feaut_upd.bal_money) 
                                        AND in_past_upd.bal_upd = in_feaut_upd.bal_upd)

SELECT COALESCE(us.name, 'not defined') AS name, COALESCE(us.lastname, 'not defined') AS lastname, fd.currency_name, (fd.bal_money * cur.rate_to_usd) AS currency_in_usd
FROM final_data AS fd
         LEFT JOIN "user" AS us 
            ON fd.id = us.id
         LEFT JOIN currency AS cur 
            ON (fd.new_diff = (fd.bal_upd - cur.updated)) AND (fd.currency_name = cur.name)
ORDER BY 
  "name" DESC, lastname ASC, 3 ASC;
