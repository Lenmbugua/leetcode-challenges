SELECT a.name 
FROM Employee a
JOIN Employee b
WHERE a.id = b.managerId
GROUP BY b.managerId
having count(b.managerId)>=5