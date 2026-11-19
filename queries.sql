-- SQLite queries for the submitted university dataset.
-- 1. All students
SELECT * FROM Students;
-- 2. Student identifiers and names
SELECT student_id, first_name, last_name FROM Students;
-- 3. Groups
SELECT * FROM Groups;
-- 4. Subject names
SELECT subject_name FROM Subjects;
-- 5. Students in the selected group
SELECT * FROM Students WHERE group_id = 1;
-- 6. Students alphabetically
SELECT * FROM Students ORDER BY last_name, first_name, student_id;
-- 7. Total students
SELECT COUNT(*) AS student_count FROM Students;
-- 8. Students per group, including empty groups
SELECT g.group_id, g.group_name, COUNT(s.student_id) AS student_count
FROM Groups AS g LEFT JOIN Students AS s ON s.group_id = g.group_id
GROUP BY g.group_id, g.group_name ORDER BY g.group_id;
-- 9-11. Grade aggregates
SELECT MAX(grade) AS maximum_grade FROM Grades;
SELECT MIN(grade) AS minimum_grade FROM Grades;
SELECT AVG(grade) AS average_grade FROM Grades;
-- 12. Student and group
SELECT s.student_id, s.first_name, s.last_name, g.group_name
FROM Students AS s JOIN Groups AS g ON g.group_id = s.group_id
ORDER BY s.student_id;
-- 13. Student and grades
SELECT s.student_id, s.first_name, s.last_name, gr.grade
FROM Students AS s JOIN Grades AS gr ON gr.student_id = s.student_id
ORDER BY s.student_id, gr.grade_id;
-- 14. Student, subject, and grade through the exam
SELECT s.student_id, s.first_name, s.last_name, sub.subject_name, gr.grade
FROM Students AS s
JOIN Grades AS gr ON gr.student_id = s.student_id
JOIN Exams AS e ON e.exam_id = gr.exam_id
JOIN Subjects AS sub ON sub.subject_id = e.subject_id
ORDER BY s.student_id, gr.grade_id;
