-- 데이터 베이스 생성
CREATE DATABASE school;
USE school;
-- 테이블 생성
CREATE TABLE student(
	student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    grade INT NOT NULL,
    major VARCHAR(50) NOT NULL,
    phone VARCHAR(20)
);

-- 테이블 구조 확인
DESC student;
SELECT * FROM student;

-- DDL
-- 컬럼 추가 (ADD)
ALTER TABLE student ADD COLUMN email VARCHAR(100);
-- 컬럼 수정 - 타입과 길이 변경 (MODIFY)
ALTER TABLE student MODIFY COLUMN phone VARCHAR(30);
-- 컬럼 수정 - 컬럼명/타입/길이 변경 (CHANGE)
ALTER TABLE student CHANGE COLUMN email email_address VARCHAR(150) NOT NULL;
-- 컬럼 수정 - 컬럼명 변경 (RENAME)
ALTER TABLE student RENAME COLUMN email_address TO email;
-- 컬럼 삭제 (DROP)
ALTER TABLE student DROP COLUMN email;
-- 테이블 삭제 (DROP)
DROP TABLE student;
-- 데이터베이스 삭제 (DROP)
DROP DATABASE school;
DROP DATABASE db_tenco_market;