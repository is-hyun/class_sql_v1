USE employees;

SELECT * FROM employees_copy3;
SELECT * FROM salaries_copy;

-- 사원번호 10004번의 최고 급여보다 더 높은 급여를 받은 사람들의 평균 입사 연도
SELECT FLOOR(AVG(YEAR(e.hire_date))) AS 평균_입사연도
FROM employees e JOIN salaries s ON e.emp_no = s.emp_no
WHERE s.salary > (SELECT MAX(salary) FROM salaries WHERE emp_no = 10004);