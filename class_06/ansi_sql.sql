DROP DATABASE IF EXISTS ansi_practice;
CREATE DATABASE ansi_practice;
USE ansi_practice;

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2),   -- 최대 99999999.99
    hire_date DATE
);

INSERT INTO employees (id, name, email, department, salary, hire_date) VALUES
(1, '김철수', 'kim@test.com',  '인사부',   3000000.00, '2024-03-01'),
(2, '박영희', 'park@test.com', '개발부',   4000000.00, '2024-06-15'),
(3, '이민준', 'lee@test.com',  '기획부',   3500000.00, '2023-01-10'),
(4, '최지아', 'choi@test.com', '마케팅부', 3200000.00, '2024-05-21'),
(5, '한수연', 'han@test.com',  '영업부',   2900000.00, '2021-12-30'),
(6, '정우성', 'jung@test.com', NULL,       3100000.00, '2025-02-01');

SELECT * FROM employees;

-- 테이블 복사 쿼리
CREATE TABLE new_employee
AS SELECT * FROM employees
WHERE id < 5;

-- CTAS 문법
-- 단, 제약조건 등은 복사 불가

-- 다른 DB에 있는 테이블 복사
USE ansi_practice;
CREATE TABLE new_departments
AS SELECT * FROM employees.department
WHERE dept_no > 10;
