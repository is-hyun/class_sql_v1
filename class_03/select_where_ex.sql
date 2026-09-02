-- 샘플 데이터 2
CREATE TABLE student (
    student_id INT PRIMARY KEY COMMENT '학번',
    name VARCHAR(50) NOT NULL COMMENT '이름',
    grade INT NOT NULL COMMENT '학년',
    major VARCHAR(100) NOT NULL COMMENT '학과'
) COMMENT = '학생 정보 테이블';

SELECT * FROM student;
SHOW FULL COLUMNS FROM student;

INSERT INTO student (student_id, name, grade, major) VALUES
  (1,  '김철수', 1, '컴퓨터공학과'),
  (2,  '박영희', 2, '경영학과'),
  (3,  '이민수', 4, '전자공학과'),
  (4,  '홍길동', 1, '디자인학과'),
  (5,  '임성민', 3, '컴퓨터공학과'),
  (6,  '한지원', 2, '경영학과'),
  (7,  '박준형', 4, '전자공학과'),
  (8,  '김민지', 1, '디자인학과'),
  (9,  '이현수', 3, '컴퓨터공학과'),
  (10, '정미경', 2, '경영학과'),
  (11, '김성진', 4, '전자공학과'),
  (12, '임승환', 1, '디자인학과'),
  (13, '최수빈', 2, '컴퓨터공학과'),
  (14, '오지훈', 3, '경영학과'),
  (15, '윤서아', 2, '전자공학과'),
  (16, '장도윤', 4, '디자인학과');

SELECT * FROM student;

-- student 테이블에서 학과가 '컴퓨터공학과'인 학생들의 이름과 학번을 조회하라
SELECT student_id, name FROM student WHERE major = '컴퓨터공학과';

-- 1. grade가 3인 학생들 조회하기 (컬럼을 지정하지 않으면 전부 출력)
SELECT * FROM student WHERE grade = 3;

-- 2. 이름이 홍길동인 학생 조회하기
SELECT * FROM student WHERE name = '홍길동';

-- 3. 학번이 1부터 10까지인 학생들 조회하기 (BETWEEN)
SELECT * FROM student WHERE student_id BETWEEN 1 AND 10;

-- 4. 학과가 컴퓨터공학과이면서 학년이 2학년인 학생들만 조회하기
SELECT * FROM student WHERE major = '컴퓨터공학과' AND grade = 2;

-- 5. 학과가 컴퓨터공학과이거나 학년이 2학년인 학생들 조회하기
SELECT * FROM student WHERE major = '컴퓨터공학과' OR grade = 2;

-- 6. 학생 이름이 홍길동이 아닌 학생들 조회하기
SELECT * FROM student WHERE name NOT LIKE '홍길동'; 

-- 7. 학년이 2학년 이상인 학생들 조회하기
SELECT * FROM student WHERE grade >= 2;

-- 8. 학년이 2학년 미만인 학생들 조회하기
SELECT * FROM student WHERE grade < 2;

-- 9. 학년이 1학년, 3학년, 4학년인 학생들 조회하기 (IN 사용)
SELECT * FROM student WHERE grade IN(1, 3, 4);

-- 10. 이름이 김씨인 학생들 조회하기 (LIKE 사용)
SELECT * FROM student WHERE name LIKE '김%';

-- 11. 컴퓨터공학과이거나 경영학과면서, 2학년인 학생들 조회하기 (괄호 주의)
SELECT * FROM student WHERE major IN ('컴퓨터공학과', '경영학과') AND grade = 2;
SELECT * FROM student WHERE (major = '컴퓨터공학과' OR major = '경영학과') AND grade = 2;