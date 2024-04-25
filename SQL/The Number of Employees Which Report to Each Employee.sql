SELECT
    e.employee_id,
    e.name,
    COUNT(DISTINCT r.employee_id) AS reports_count,
    ROUND(AVG(r.age)) AS average_age
FROM Employees e
LEFT JOIN Employees r ON e.employee_id = r.reports_to
GROUP BY e.employee_id, e.name
HAVING COUNT(DISTINCT r.employee_id) >= 1
ORDER BY e.employee_id;