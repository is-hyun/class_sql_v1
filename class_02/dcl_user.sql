USE school;

-- 조회 권한 확인
SELECT * FROM student;

-- INSERT 구문 실행 시도
INSERT INTO student VALUES (1005, '박이남', 3, '스포츠학과', '010-0000-0000');

UPDATE student SET name = '박이나' WHERE student_id = 1005;
DELETE FROM student WHERE student_id = 1005;