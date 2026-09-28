DROP DATABASE IF EXISTS alias_practice;
CREATE DATABASE alias_practice;
USE alias_practice;

CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    score INT
);

INSERT INTO students VALUES (1, '홍길동', 75), (2, '김철수', 55);

SELECT * FROM students;

SELECT 100, '반장';

-- 컬럼에 별칭 지정
SELECT 100 AS student_id, 'captain' AS title;

-- 테이블에 별칭 지정
SELECT s.name FROM students AS s;