use employees;
CREATE TABLE salaries_copy LIKE salaries;
INSERT INTO salaries_copy SELECT * FROM salaries;

SHOW FULL COLUMNS FROM departments;
SHOW FULL COLUMNS FROM dept_emp;
SHOW FULL COLUMNS FROM dept_manager;
SHOW FULL COLUMNS FROM employees;
SHOW FULL COLUMNS FROM salaries_copy;
SHOW FULL COLUMNS FROM titles;

SELECT * FROM salaries_copy;

ALTER TABLE salaries_copy DROP COLUMN bonus;

ALTER TABLE salaries_copy ADD COLUMN bonus VARCHAR(50) DEFAULT '해당 없음';
SELECT * FROM salaries_copy WHERE from_date >= 20000101 AND to_date = 99990101;
UPDATE salaries_copy SET bonus = salary*0.4 WHERE from_date >= 20000101 AND to_date = 99990101;