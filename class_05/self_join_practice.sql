USE employees;
SELECT * FROM employees_copy3;
SELECT * FROM salaries_copy;

-- ---------------------------------------
-- 문제 1.
-- ---------------------------------------
SELECT c.salary AS 변동된_연봉,
	c.from_date AS 지급시작일,
	(c.salary - p.salary) AS 연봉_변동액
FROM salaries_copy c
LEFT JOIN salaries_copy p
ON c.from_date = p.to_date
	AND c.emp_no = p.emp_no
WHERE c.emp_no = 11111;
-- ---------------------------------------

-- ---------------------------------------
-- 문제 2.
-- ---------------------------------------
SELECT * FROM employees;

SELECT e.last_name AS 성,
    e.first_name AS 이름,
    e.gender AS 성별
FROM employees e
LEFT JOIN employees s
ON e.gender = s.gender
WHERE e.emp_no <> s.emp_no;

-- ---------------------------------------
-- 문제 3.
-- ---------------------------------------
SELECT * FROM employees;

SELECT e.emp_no AS 직원1_사번,
	e.last_name AS 직원1_성,
	e.first_name AS 직원1_이름,
    c.emp_no AS 직원2_사번,
    c.last_name AS 직원2_성,
	c.first_name AS 직원2_이름,
    e.birth_date AS 생년월일,
    e.hire_date AS 입사일
FROM employees e
LEFT JOIN employees c
ON e.birth_date = c.birth_date
AND e.hire_date = c.hire_date
AND e.emp_no <> c.emp_no
WHERE e.emp_no = 63092 OR e.emp_no = 80859;

-- ---------------------------------------
-- 문제 4.
-- ---------------------------------------
SELECT * FROM employees;

SELECT e.emp_no AS 직원_1,
	s.emp_no AS 직원_2,
    e.hire_date AS 고용일
FROM employees e
INNER JOIN employees s
ON e.hire_date = s.hire_date
WHERE e.emp_no < s.emp_no
AND e.gender = 'M'
AND s.gender = 'M';