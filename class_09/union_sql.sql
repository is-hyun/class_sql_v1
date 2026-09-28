USE employees;
SELECT * FROM titles;
SELECT * FROM employees;

SELECT t.emp_no, CONCAT(e.first_name, ' ', e.last_name) AS name
FROM titles t JOIN employees e ON t.emp_no = e.emp_no
WHERE t.title = 'Manager'
UNION
SELECT t.emp_no, CONCAT(e.first_name, ' ', e.last_name) AS name
FROM titles t JOIN employees e ON t.emp_no = e.emp_no
WHERE title = 'Technique Leader'