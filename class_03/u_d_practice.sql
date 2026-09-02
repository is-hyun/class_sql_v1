use employees;

SHOW FULL COLUMNS FROM departments;
SHOW FULL COLUMNS FROM dept_emp;
SHOW FULL COLUMNS FROM dept_manager;
SHOW FULL COLUMNS FROM employees;
SHOW FULL COLUMNS FROM salaries;
SHOW FULL COLUMNS FROM titles;

SELECT * FROM salaries;
ALTER TABLE salaries DROP COLUMN bonus;

ALTER TABLE salaries ADD COLUMN bonus VARCHAR(50) DEFAULT '해당 없음';
SELECT * FROM salaries WHERE from_date >= 20000101 AND to_date = 99990101;
UPDATE salaries SET bonus = salary*0.4 WHERE from_date >= 20000101 AND to_date = 99990101;