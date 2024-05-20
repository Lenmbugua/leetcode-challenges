SELECT e.name, COALESCE(b.bonus, null) AS bonus
FROM Employee e
LEFT JOIN Bonus b ON e.empId = b.empId
WHERE COALESCE(b.bonus, null) < 1000 OR b.bonus IS NULL;