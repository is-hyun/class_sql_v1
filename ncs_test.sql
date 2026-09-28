CREATE DATABASE IF NOT EXISTS ncs_test;
USE ncs_test;
-- 기존 테이블 삭제
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS department;

-- [1]
-- department 테이블
CREATE TABLE department (
    dept_id INT NOT NULL,
    dept_name VARCHAR(50) NOT NULL,
    location VARCHAR(50),
    PRIMARY KEY (dept_id)
);

-- employee 테이블
CREATE TABLE employee (
    emp_id INT NOT NULL,
    emp_name VARCHAR(50) NOT NULL,
    position VARCHAR(30),
    salary INT,
    dept_id INT,
    PRIMARY KEY (emp_id),
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

-- [2]
-- 데이터 입력
INSERT INTO department (dept_id, dept_name, location)
VALUES (10, '인사총무팀', '서울 본사 3층'),
	(20, '개발팀', '서울 본사 5층'),
    (30, '마케팅팀', '부산 지사 2층');

INSERT INTO employee (emp_id, emp_name, position, salary, dept_id)
VALUES (1001, '김철수', '부장', 6000, 10),
	(1002, '이영희', '과장', 5000, 20),
    (1003, '박민수', '대리', 4000, 20),
    (1004, '최지우', '사원', 3500, 30);

-- 조회
SELECT e.emp_name AS '사원명',
	d.dept_name AS '부서명',
	e.position AS '직급'
FROM employee e
INNER JOIN department d
ON e.dept_id = d.dept_id;

-- [3]
-- [DCL] 특정 사용자(dev_user)에게 테이블 조회 권한 부여
CREATE USER 'dev_user'@'%' IDENTIFIED BY 'password123';
GRANT SELECT ON ncs_test.employee TO 'dev_user'@'%';

SHOW GRANTS FOR 'dev_user'@'%';