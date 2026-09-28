CREATE DATABASE IF NOT EXISTS normalization;
USE normalization;

DROP TABLE IF EXISTS enrollment_bad;

-- 일부러 2NF 를 위반한 테이블
CREATE TABLE enrollment_bad (
    student_id   INT         NOT NULL,
    student_name VARCHAR(50) NOT NULL,   -- 학생ID 만으로 결정됨
    subject_code VARCHAR(10) NOT NULL,
    subject_name VARCHAR(50) NOT NULL,   -- 과목코드 만으로 결정됨
    professor    VARCHAR(30) NOT NULL,   -- 과목코드 만으로 결정됨
    grade        CHAR(1),
    PRIMARY KEY (student_id, subject_code)
);

INSERT INTO enrollment_bad VALUES
(1, '홍길동', 'MAT101', '수학', '김교수', 'A'),
(1, '홍길동', 'SCI101', '과학', '이교수', 'B'),
(2, '이순신', 'MAT101', '수학', '김교수', 'C'),
(2, '이순신', 'ENG101', '영어', '박교수', 'A'),
(3, '김유신', 'SCI101', '과학', '이교수', 'B');

SELECT * FROM enrollment_bad;

DROP TABLE IF EXISTS student_2nf;
DROP TABLE IF EXISTS subject;
DROP TABLE IF EXISTS enrollment_2nf;

CREATE TABLE student_2nf(
	student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL
);

CREATE TABLE subject(
	subject_code VARCHAR(10) PRIMARY KEY,
    subject_name VARCHAR(50) NOT NULL,
    professor VARCHAR(30) NOT NULL
);

CREATE TABLE enrollment_2nf (
	student_id INT NOT NULL,
    subject_code VARCHAR(10) NOT NULL,
    grade CHAR(1),
    PRIMARY KEY(student_id, subject_code),
    FOREIGN KEY(student_id) REFERENCES student_2nf(student_id),
    FOREIGN KEY(subject_code) REFERENCES subject(subject_code)
);

-- 데이터 입력
INSERT INTO student_2nf VALUES
(1, '홍길동'),
(2, '이순신'),
(3, '김유신');

INSERT INTO subject VALUES
('MAT101', '수학', '김교수'),
('SCI101', '과학', '이교수'),
('ENG101', '영어', '박교수');

INSERT INTO enrollment_2nf VALUES
(1, 'MAT101', 'A'),
(1, 'SCI101', 'B'),
(2, 'MAT101', 'C'),
(2, 'ENG101', 'A'),
(3, 'SCI101', 'B');

select * from student_2nf;
select * from subject;
select * from enrollment_2nf;

-- 1. 수강 정보 전체 조회 (학생이름 + 과목명 + 성적)
SELECT s.student_name, b.subject_name, e.grade
FROM enrollment_2nf e 
JOIN student_2nf s ON e.student_id = s.student_id
JOIN subject b ON e.subject_code = b.subject_code
ORDER BY s.student_name, b.subject_name;

-- 2. 수학 담당교수를 '신교수'로 수정
UPDATE subject SET professor = '신교수'
WHERE subject_code = 'MAT101';

SELECT * FROM subject;

-- 3. 과목별 수강생 수
SELECT b.subject_name, b.professor, COUNT(e.student_id)
FROM enrollment_2nf e LEFT JOIN subject b
ON e.subject_code = b.subject_code
GROUP BY e.subject_code;