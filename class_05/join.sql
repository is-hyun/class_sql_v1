DROP DATABASE IF EXISTS green_school;
CREATE DATABASE green_school;
USE green_school;

CREATE TABLE tb_grade (
    grade CHAR(1) PRIMARY KEY,
    score INT
);

CREATE TABLE tb_student (
    no INT NOT NULL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    gender ENUM('F', 'M') NOT NULL,
    age INT,
    grade CHAR(1),
    FOREIGN KEY (grade) REFERENCES tb_grade(grade)
);

INSERT INTO tb_grade (grade, score) VALUES
    ('A', 100),
    ('B', 80),
    ('C', 60),
    ('D', 40),
    ('E', 20),
    ('F', 0);

INSERT INTO tb_student (no, name, gender, age, grade) VALUES
    (20170001, '조이',   'F', 25, 'B'),
    (20170020, '앤드류', 'M', 26, 'B'),
    (20180800, '데이지', 'F', 24, 'A'),
    (20190123, '다나',   'F', 23, 'A'),
    (20201000, '스카이', 'M', 22, 'D'),
    (20210001, '제임스', 'M', 21, NULL);
    
SELECT * FROM tb_grade;
SELECT * FROM tb_student;

-- 1. CROSS JOIN
SELECT COUNT(*)
FROM tb_student
JOIN tb_grade;

SELECT * 
FROM tb_student
JOIN tb_grade;


-- 2. INNER JOIN
SELECT s.no, s.name, s.gender, s.age, s.grade, g.score
FROM tb_student s
INNER JOIN tb_grade g
ON s.grade = g.grade;


SELECT s.name, g.score FROM tb_student s LEFT JOIN tb_grade g ON s.grade = g.grade;
SELECT g.score, s.name FROM tb_student s LEFT JOIN tb_grade g ON s.grade = g.grade;


CREATE TABLE tb_club (
    club_id   INT PRIMARY KEY,
    club_name VARCHAR(20)
);

INSERT INTO tb_club VALUES (1, '축구부'), (2, '밴드부');

ALTER TABLE tb_student ADD COLUMN club_id INT;
ALTER TABLE tb_student ADD FOREIGN KEY (club_id) REFERENCES tb_club(club_id);

UPDATE tb_student SET club_id = 1 WHERE no = 20170001;  -- 조이
UPDATE tb_student SET club_id = 2 WHERE no = 20170020;  -- 앤드류
UPDATE tb_student SET club_id = 1 WHERE no = 20180800;  -- 데이지
-- 다나, 스카이, 제임스는 동아리 없음 (club_id 가 NULL)

SELECT * FROM tb_student s
LEFT JOIN tb_grade g ON s.grade = g.grade
LEFT JOIN tb_club  c ON s.club_id = c.club_id;

-- left join
SELECT *
FROM tb_student s
LEFT JOIN tb_grade g
ON s.grade = g.grade;

-- right join
SELECT *
FROM tb_student s
RIGHT JOIN tb_grade g
ON s.grade = g.grade;