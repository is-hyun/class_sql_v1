-- Step 3
CREATE DATABASE IF NOT EXISTS jdbc_test;
USE jdbc_test;

CREATE TABLE IF NOT EXISTS test_stu (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    gender CHAR NOT NULL,
    mid_score CHAR(2) NOT NULL
);

INSERT INTO test_stu (name, gender, mid_score)
VALUE ('강가민', 'M', 'A0'),
	('김철수', 'M', 'B+'),
    ('민영희', 'F', 'B-'),
    ('박민환', 'M', 'C0'),
    ('박지연', 'F', 'A+'),
    ('이주현', 'F', 'B0');
    
USE employees;
SELECT * FROM employees;

SELECT * FROM employees WHERE hire_date LIKE '1999%' ORDER BY birth_date ASC;