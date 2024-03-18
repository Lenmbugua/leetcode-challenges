SELECT Signups.user_id, IFNULL(ROUND(SUM(action = 'confirmed') / COUNT(*), 2), 0.00) AS confirmation_rate
FROM Signups
LEFT JOIN Confirmations ON Signups.user_id = Confirmations.user_id
GROUP BY Signups.user_id;