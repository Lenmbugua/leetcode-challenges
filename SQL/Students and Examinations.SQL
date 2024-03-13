SELECT a.student_id, a.student_name, S.subject_name, COUNT(E.subject_name) 
AS attended_exams
FROM Students a
CROSS JOIN Subjects S
LEFT JOIN Examinations E
ON a.student_id = E.student_id
AND S.subject_name = E.subject_name
group by student_id, subject_name 
ORDER BY student_id, S.subject_name