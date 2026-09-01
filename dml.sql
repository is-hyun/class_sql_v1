-- 데이터 베이스 생성
CREATE DATABASE school;
USE school;
SELECT * FROM student;

-- DML
-- 데이터 한 건 추가 (INSERT)
INSERT INTO student (student_id, name, grade, major, phone)
	VALUES(1001, '김철수', 2, '컴퓨터공학', '010-1234-5678');
    
-- 데이터 여러 건 추가
INSERT INTO student (student_id, name, grade, major, phone)
	VALUES(1002, '이영희', 1, '경영학과', '010-2345-6789'),
		  (1003, '김일남', 3, '전자공학', '010-1234-1234'),
          (1004, '홍길동', 4, '생명공학', '010-9876-5432');
          
-- 데이터 조회 (SELECT)
SELECT name, major FROM student;
SELECT name, major FROM student WHERE grade = 3;

-- 데이터 수정 (UPDATE)
-- !주의! 수정 질의어에서 WHERE 조건절이 없으면 전체 행을 수정함.
UPDATE student SET major = '컴공'; -- WHERE 없는 UPDATE 구문은 지양
UPDATE student SET grade = 4 WHERE student_id = '1001';

-- 데이터 삭제 (DELETE)
-- !주의! 삭제 질의어에서도 WHERE절 반드시 사용
DELETE FROM student WHERE student_id = 1;
DELETE FROM student WHERE grade = 3;