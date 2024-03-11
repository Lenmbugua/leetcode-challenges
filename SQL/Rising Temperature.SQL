SELECT DISTINCT  b.id
FROM Weather a
inner JOIN weather b ON DATEDIFF(b.recordDate, a.recordDate) = 1
WHERE  b.temperature  > a.temperature
ORDER BY b.temperature