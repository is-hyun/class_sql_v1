USE employees;
CREATE TABLE dept_manager_copy LIKE dept_manager;
INSERT INTO dept_manager_copy SELECT * FROM dept_manager;

SELECT * FROM employees_copy3;
SELECT * FROM employees_copy3 WHERE emp_no = 110022;
SELECT * FROM dept_manager_copy;

UPDATE dept_manager_copy SET to_date = 20021231 WHERE to_date = 99990101;
SELECT e.emp_no, e.first_name, e.last_name, e.hire_date, m.to_date
FROM employees_copy3 e
LEFT JOIN dept_manager_copy m
ON e.emp_no = m.emp_no
WHERE m.to_date - e.hire_date <= 50000; // 5년

