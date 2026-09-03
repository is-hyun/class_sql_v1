USE green_school;

SELECT * FROM tb_student;
SELECT * FROM tb_grade;

-- 1.
SELECT s.name, s.age, s.grade, g.score
FROM tb_student s
INNER JOIN tb_grade g
ON s.grade = g.grade
WHERE s.grade = 'A' OR s.grade = 'B'
ORDER BY grade DESC;

-- 2.
SELECT s.name, s.grade, g.score
FROM tb_student s
LEFT JOIN tb_grade g
ON s.grade = g.grade
WHERE s.gender = 'M';

-- 3.
SELECT s.name, s.age, s.grade, g.score
FROM tb_student s
LEFT JOIN tb_grade g
ON s.grade = g.grade
WHERE s.age <= 24;

-- 4.
SELECT s.name, g.grade, g.score
FROM tb_student s
RIGHT JOIN tb_grade g
ON s.grade = g.grade
WHERE g.score >= 60;