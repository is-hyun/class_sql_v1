DROP DATABASE IF EXISTS type_practice;
CREATE DATABASE type_practice;
USE type_practice;

-- 학생 테이블
CREATE TABLE student (
	student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
	grade TINYINT NOT NULL,
    major VARCHAR(50) NOT NULL,
    entrance_date DATE NOT NULL,
	memos TEXT
);

-- 과목 테이블    
CREATE TABLE subject (
	subject_id INT NOT NULL PRIMARY KEY,
    subject_code CHAR(4) NOT NULL,
	subject_name VARCHAR(50) NOT NULL,
    credit TINYINT NOT NULL,
    major_code CHAR(2) NOT NULL,
    professor VARCHAR(50) NOT NULL,
    start_date DATETIME NOT NULL
);

-- 수강 테이블
CREATE TABLE enrollment (
	enroll_id INT NOT NULL PRIMARY KEY,
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    score DECIMAL(5, 2) NOT NULL,
    enroll_date DATETIME NOT NULL,
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (subject_id) REFERENCES subject(subject_id)
);

INSERT INTO student (student_id, student_name, grade, major, entrance_date, memos)
VALUES
    (1001, '김지영', 1, '컴퓨터공학', '2026-03-02', '프로그래밍에 뛰어남'),
    (1002, '이민수', 2, '수학', '2025-03-02', NULL),
    (1003, '박소연', 3, '물리학', '2024-03-02', '양자역학에 관심 많음');
SELECT * FROM student;

INSERT INTO subject (subject_id, subject_code, subject_name, credit, major_code, professor, start_date)
VALUES
    (1, 'CS01', '데이터베이스 시스템', 3, 'CS', '김영희', '2026-03-02 10:00:00'),
    (2, 'MA01', '미적분학', 4, 'MA', '이철수', '2026-03-02 09:00:00'),
    (3, 'PH01', '양자물리학', 3, 'PH', '박민준', '2026-03-02 11:00:00');
    
SELECT * FROM subject;

INSERT INTO enrollment (enroll_id, student_id, subject_id, score, enroll_date)
VALUES
    (1, 1001, 1, 85.50, '2026-03-02 12:00:00'),
    (2, 1002, 2, 92.00, '2026-03-02 12:30:00'),
    (3, 1003, 3, 78.75, '2026-03-02 13:00:00');

SELECT * FROM enrollment;    