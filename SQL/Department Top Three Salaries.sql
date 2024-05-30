WITH RankedSalaries AS (
    SELECT
        e.id AS emp_id,
        e.name AS emp_name,
        e.salary,
        e.departmentId,
        d.name AS department_name,
        DENSE_RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary DESC) AS salary_rank
    FROM Employee e
    JOIN Department d ON e.departmentId = d.id
)
SELECT
    department_name AS Department,
    emp_name AS Employee,
    salary AS Salary
FROM RankedSalaries
WHERE salary_rank <= 3
ORDER BY department_name, salary_rank;