SELECT
	  FORMAT(MIN(p.PLAN_VALUE), 2) AS faturamento_minimo,
    FORMAT(MAX(p.PLAN_VALUE), 2) AS faturamento_maximo,
    FORMAT(AVG(p.PLAN_VALUE), 2) AS faturamento_medio,
    FORMAT(SUM(p.PLAN_VALUE), 2) AS faturamento_total
FROM SpotifyClone.PLANS AS p

INNER JOIN SpotifyClone.USERS AS u
ON u.PLAN_ID = p.PLAN_ID;