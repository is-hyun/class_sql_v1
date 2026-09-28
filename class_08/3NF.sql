CREATE DATABASE IF NOT EXISTS normalization;
USE normalization;

DROP TABLE IF EXISTS employee_bad;

-- 일부러 3NF 를 위반한 테이블
CREATE TABLE employee_bad (
    emp_id        INT          PRIMARY KEY,
    emp_name      VARCHAR(50)  NOT NULL,
    dept_code     VARCHAR(10)  NOT NULL,
    dept_name     VARCHAR(50)  NOT NULL,   -- 부서코드를 거쳐 종속
    dept_location VARCHAR(100) NOT NULL    -- 부서코드를 거쳐 종속
);

INSERT INTO employee_bad VALUES
(1, '홍길동', 'D01', '개발팀', '서울 강남'),
(2, '이순신', 'D02', '영업팀', '부산 해운대'),
(3, '김유신', 'D01', '개발팀', '서울 강남'),
(4, '최사원', 'D01', '개발팀', '서울 강남');

SELECT * FROM employee_bad;

UPDATE employee_bad SET dept_location = '경기 판교' WHERE emp_id = 1;

SELECT emp_name, dept_code, dept_name, dept_location
FROM employee_bad
WHERE dept_code = 'D01';

DELETE FROM employee_bad WHERE emp_id = 2;

SELECT DISTINCT dept_code, dept_name, dept_location FROM employee_bad;

INSERT INTO employee_bad (dept_code, dept_name, dept_location)
VALUES ('D03', '기획팀', '서울 마포');

-- 3정규화를 만족하도록 테이블을 분리해보자.

-- 3 정규화를 만족하도록 테이블을 분리해 보자. 
-- 부서 정보를 분리(부서 코드 -> 부서명, 부서위치) 
create table department(
	dept_code varchar(10) primary key, 
    dept_name varchar(50) not null, 
    dept_location varchar(100)
);

-- 직원 테이블 (부서코드만 저장, 부서명과 부서위치는 제거)
create table employee(
	  emp_id int primary key auto_increment, 
    emp_name varchar(50) not null, 
    dept_code varchar(10), 
    foreign key(dept_code) references department(dept_code)
); 


INSERT INTO department VALUES
('D01', '개발팀', '서울 강남'),
('D02', '영업팀', '부산 해운대'),
('D03', '기획팀', '서울 마포');

INSERT INTO employee (emp_name, dept_code) VALUES
('홍길동', 'D01'),
('이순신', 'D02'),
('김유신', 'D01'),
('최사원', 'D01');


-- 1. 
SELECT e.emp_name      AS 직원명,
       d.dept_name     AS 부서명,
       d.dept_location AS 부서위치
FROM employee e
JOIN department d ON e.dept_code = d.dept_code
ORDER BY d.dept_name, e.emp_name;

-- 2.
UPDATE department
SET dept_location = '경기 판교'
WHERE dept_code = 'D01';

SELECT e.emp_name AS 직원명, d.dept_name AS 부서명, d.dept_location AS 부서위치
FROM employee e
JOIN department d ON e.dept_code = d.dept_code
WHERE d.dept_code = 'D01';

-- 3. 
SELECT d.dept_name     AS 부서명,
       COUNT(e.emp_id) AS 직원수
FROM department d
LEFT JOIN employee e ON d.dept_code = e.dept_code
GROUP BY d.dept_code, d.dept_name
ORDER BY 직원수 DESC, d.dept_code;