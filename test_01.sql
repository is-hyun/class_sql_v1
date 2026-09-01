-- 데이터 베이스 생성(이름)
CREATE DATABASE db_test_01;
-- 사용 명령어
USE db_test_01;

-- 테이블 생성, 컬럼 수정, 데이터 조회, 삽입 실습
CREATE TABLE student (
	studentName VARCHAR(3) NOT NULL,
    studentId INT NOT NULL PRIMARY KEY,
    studentDepart VARCHAR(4) NOT NULL
);
SHOW TABLES;
DESC student;

CREATE TABLE class_01 (
	studentName VARCHAR(3) NOT NULL,
    studentId INT NOT NULL,
    studentScoreAvg DOUBLE,
    studentScore CHAR(2),
    FOREIGN KEY (studentId) REFERENCES student(studentId)
);
SHOW TABLES;
DESC class_01;

INSERT INTO student VALUES ('홍길동', 2026123456, '경영학과');
INSERT INTO student VALUES ('김일남', 2025234567, '컴퓨터학과');

ALTER TABLE student MODIFY COLUMN studentDepart VARCHAR(10) NOT NULL;
INSERT INTO student VALUES ('김일남', 2025234567, '컴퓨터학과');

SELECT * FROM student;

INSERT INTO class_01 VALUES ('홍길동', 2026123456, 84, 'B');
INSERT INTO class_01 VALUES ('김일남', 2025234567, 92.5, 'A');

SELECT * FROM class_01;