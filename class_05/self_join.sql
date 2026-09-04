DROP DATABASE IF EXISTS self_join;
CREATE DATABASE self_join;
USE self_join;

CREATE TABLE employees (
    employee_id   INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    department    VARCHAR(20) NOT NULL,
    salary        INT NOT NULL,        -- 연봉, 만원 단위
    manager_id    INT                  -- 상급자의 employee_id. 없으면 NULL
);

INSERT INTO employees VALUES
(1, '김민수', '경영', 9000, NULL),
(2, '박지훈', '개발', 7000, 1),
(3, '이서연', '영업', 6500, 1),
(4, '최준호', '개발', 5000, 2),
(5, '정하윤', '개발', 5500, 2),
(6, '강도현', '영업', 4800, 3);

SELECT * FROM employees;

-- -------------------------------
SELECT e.employee_name AS 직원,
       m.employee_name AS 상급자
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;

-- -------------------------------
SELECT e.*, m.employee_name AS 상급자
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;

-- -------------------------------
SELECT e.employee_name AS 직원,
       m.employee_name AS 상급자
FROM employees e
INNER JOIN employees m ON e.manager_id = m.employee_id;

-- -------------------------------
SELECT e.employee_name  AS 직원,
       m.employee_name  AS 상급자,
       mm.employee_name AS 차상급자
FROM employees e
LEFT JOIN employees m  ON e.manager_id = m.employee_id
LEFT JOIN employees mm ON m.manager_id = mm.employee_id;

-- -------------------------------
SELECT e.employee_name AS 직원,
       e.salary        AS 내연봉,
       h.employee_name AS 더높은사람,
       h.salary        AS 그사람연봉
FROM employees e
JOIN employees h
  ON e.department = h.department
 AND h.salary > e.salary
ORDER BY e.employee_name;
-- -------------------------------
SELECT * FROM employees WHERE department = '개발';

-- -------------------------------
SELECT e.employee_name AS 직원, h.employee_name AS 상대
FROM employees e
JOIN employees h ON e.department = h.department
WHERE e.department = '개발'
ORDER BY e.employee_name, h.employee_name;

-- -------------------------------
SELECT e.employee_name AS 직원, e.department AS 부서,
       h.employee_name AS 상대, h.department AS 상대부서
FROM employees e
JOIN employees h ON h.salary > e.salary
WHERE e.employee_name = '강도현'
ORDER BY e.employee_name, e.salary;

-- -------------------------------
SELECT e.employee_name AS 직원,
       e.salary        AS 내연봉,
       h.employee_name AS 더높은사람,
       h.salary        AS 그사람연봉
FROM employees e
JOIN employees h
  ON e.department = h.department
WHERE h.salary > e.salary
ORDER BY e.employee_name;

-- -------------------------------
SELECT e.employee_name AS 직원,
       h.employee_name AS 더높은사람
FROM employees e
JOIN employees h ON e.department = h.department
WHERE h.salary > e.salary
ORDER BY e.employee_name;

-- -------------------------------
SELECT e.employee_name AS 직원,
       h.employee_name AS 더높은사람
FROM employees e
LEFT JOIN employees h
  ON e.department = h.department
 AND h.salary > e.salary
ORDER BY e.employee_name;

-- -------------------------------
SELECT e.employee_name AS 직원,
       h.employee_name AS 더높은사람
FROM employees e
LEFT JOIN employees h
  ON e.department = h.department
WHERE h.salary > e.salary
ORDER BY e.employee_name;


-- ------------------------------------
-- 문제 1
-- ------------------------------------
SELECT * FROM employees;

SELECT e.employee_name AS 직원,
	e.department AS 부서,
	m.employee_name AS 상급자,
    m.department AS 상급자부서
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id;

-- ------------------------------------
-- 문제 2
-- ------------------------------------
SELECT m.employee_name AS 직원,
	e.employee_name AS 직속부하직원
FROM employees m
LEFT JOIN employees e
ON m.employee_id = e.manager_id
