use employees;

-- DB 파악 / 존재하는 테이블의 의미 파악
SHOW FULL COLUMNS FROM departments;
SHOW FULL COLUMNS FROM dept_emp;
SHOW FULL COLUMNS FROM dept_manager;
SHOW FULL COLUMNS FROM employees;
SHOW FULL COLUMNS FROM salaries;
SHOW FULL COLUMNS FROM titles;

-- 1. titles 테이블에서 title이 'Senior'로 시작하고, from_date가 1990-01-01 이전인 레코드를 출력하시오.
SELECT * FROM titles WHERE title LIKE 'Senior%' AND from_date <= 19900101;

-- 2. employees 테이블에서 emp_no가 10010인 사람을 검색하시오.
SELECT * FROM employees WHERE emp_no = 10010;

-- 3. salaries 테이블에서 salary가 100000 이상인 사람을 조회하시오.
SELECT * FROM salaries WHERE salary >= 100000;

-- 4. dept_emp 테이블에서 to_date가 9999-01-01이 아닌 값을 출력하시오.
SELECT * FROM dept_emp WHERE NOT to_date = 99990101;

-- 5. employees 테이블에서 남자 직원들만 조회하시오.
SELECT * FROM employees WHERE gender = 'M';

-- 6. employees 테이블에서 birth_date 가 9월인 사람을 출력하시오.
SELECT * FROM employees WHERE birth_date LIKE '_____09___';

-- 7. employees 테이블에서 gender가 M인 first_name과 last_name만 출력하시오.
SELECT first_name, last_name FROM employees WHERE gender = 'M';

-- 8. employees 테이블에서 emp_no가 10111인 사람을 검색하시오
SELECT * FROM employees WHERE emp_no = 10111;

-- 9. salaries 테이블에서 from_date가 2000-01-01 이전이고 to_date가 2000-01-01 이후인 salary만 출력하시오.
SELECT salary FROM salaries WHERE from_date <= 20000101 AND to_date >= 20000101;

-- 10. titles 테이블에서 from_date가 2001-10-11부터 2001-10-15까지인 title을 조회하시오.
SELECT title FROM titles WHERE from_date BETWEEN 20011011 AND 20011015;

-- 11. departments 테이블을 활용하여 부서번호 d001에서 d009까지만 조회하시오.
SELECT * FROM departments WHERE dept_no BETWEEN 'd001' AND 'd009';

-- 12. employees 테이블에서 여자 직원들중 birth_date가 3월인 사람을 조회하시오.
SELECT * FROM employees WHERE birth_date LIKE '_____03___' AND gender = 'F';

-- 13. employees 테이블에서 emp_no가 10000 ~ 10050 사이면서 남성인 직원을 조회하시오.
SELECT * FROM employees WHERE emp_no BETWEEN 10000 AND 10050 AND gender = 'M';