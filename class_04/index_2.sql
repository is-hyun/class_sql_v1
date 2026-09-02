USE employees;
SELECT * FROM employees_copy3;
DESC employees_copy3;
SHOW INDEX FROM employees_copy3;
SELECT * FROM employees_copy3 WHERE gender = 'M';

-- gender에 인덱스 추가
ALTER TABLE employees_copy3 ADD INDEX idx_gender (gender);

SELECT * FROM employees_copy3 WHERE first_name = 'Georgi';

SELECT * FROM employees_copy3 WHERE emp_no = 15689; 

-- 도전 과제  : 인덱스 키 직접 생성 (실행 계획 확인해서 결과 비교) 
EXPLAIN SELECT * FROM employees_copy3 WHERE last_name = 'Zielinski'; 
