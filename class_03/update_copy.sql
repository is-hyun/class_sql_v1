-- 테이블 복사 방법
-- 1. 데이터까지 전부 복사
CREATE TABLE employees_copy AS SELECT * FROM employees;

-- 2. 구조만 복사
CREATE TABLE employees_copy2 LIKE employees;

-- 3. 완전 복사
CREATE TABLE employees_copy3 LIKE employees;
INSERT INTO employees_copy3 SELECT * FROM employees;