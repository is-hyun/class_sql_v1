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

-- 수정 이상
UPDATE enrollment_bad
SET professor = '신교수'
WHERE student_id = 1 AND subject_code = 'MAT101';

SELECT subject_code, subject_name, professor, student_name
FROM enrollment_bad
WHERE subject_code = 'MAT101';

-- 되돌리기
UPDATE enrollment_bad SET professor = '김교수' WHERE subject_code = 'MAT101';


-- 삭제 이상
DELETE FROM enrollment_bad WHERE subject_code = 'MAT101';

SELECT DISTINCT subject_code, subject_name, professor FROM enrollment_bad;


-- 삽입 이상
INSERT INTO enrollment_bad (subject_code, subject_name, professor)
VALUES ('HIS101', '역사', '최교수');

INSERT INTO enrollment_bad VALUES (0, '', 'HIS101', '역사', '최교수', NULL);

SELECT * FROM enrollment_bad WHERE subject_code = 'HIS101';