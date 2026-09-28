DROP DATABASE IF EXISTS group_practice;
CREATE DATABASE group_practice;
USE group_practice;
DROP TABLE IF EXISTS tb_student;

CREATE TABLE tb_student (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    class CHAR(1) NOT NULL,
    score INT NOT NULL
);

INSERT INTO tb_student (name, class, score)
VALUES	('김민수', 'A', 85),
	('이서연', 'B', 75),
	('박지훈', 'A', 65),
	('최예린', 'A', 70),
	('정하윤', 'B', 95),
	('강동현', 'C', 88),
	('오소연', 'C', 92),
	('한지민', 'B', 78),
	('윤태양', 'A', 85),
	('문채원', 'C', 90);
    

-- -----------------------------------------------
-- 클래스 별 평균
SELECT class, ROUND(AVG(score), 2) AS AverageScore
FROM tb_student
GROUP BY class;

-- HAVING 절 추가
SELECT class, ROUND(AVG(score), 2) AS AverageScore
FROM tb_student
GROUP BY class
HAVING AVG(score) >= 80;

-- 최댓값, 최솟값 출력
SELECT class, MAX(score) AS HighestScore, MIN(score) AS LowestScore
FROM tb_student
GROUP BY class;
-- -----------------------------------------------

-- 비집계 컬럼 삽입
SELECT class, name, AVG(score)
FROM tb_student
GROUP BY class;
-- >> Error Code: 1055. Expression #2 of SELECT list is not in GROUP BY
