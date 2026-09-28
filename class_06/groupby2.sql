USE group_practice;
DROP TABLE IF EXISTS tb_employees;

CREATE TABLE tb_employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary INT NOT NULL
);

INSERT INTO tb_employees (name, department, salary)
VALUES	('김도현', '영업',   48000000),
	('이소영', '영업',   55000000),
	('박지영', '마케팅', 50000000),
	('최민재', '마케팅', 45000000),
	('강민호', '인사',   35000000),
	('오수진', '인사',   40000000),
	('정우성', '개발',   75000000),
	('한지은', '개발',   65000000),
	('윤서현', '개발',   72000000),
	('문태준', '개발',   68000000),
	('신동엽', '영업',   52000000),
	('장미란', '영업',   51000000),
	('황아영', '마케팅', 47000000),
	('류현진', '인사',   43000000),
	('김나영', '인사',   39000000);
    
-- 부서별 평균 급여
SELECT department, ROUND(AVG(salary), 0) AS AverageSalary
FROM tb_employees
GROUP BY department;

-- 부서별 평균 급여가 5000만 원 이상인 부사
SELECT department, ROUND(AVG(salary), 0) AS AverageSalary
FROM tb_employees
GROUP BY department
HAVING AVG(salary) >= 50000000;

-- 부서별 최고 급여
SELECT department, MAX(salary) AS HighestSalary
FROM tb_employees
GROUP BY department;

-- 직원 수 4명 이상인 부서
SELECT department, COUNT(*) AS NumberOfEmployees
FROM tb_employees
GROUP BY department
HAVING NumberOfEmployees >= 4;
-- HAVING COUNT(*) >= 4  사용 가능

-- 부서별 평균 급여와 직원 수
SELECT department,
       ROUND(AVG(salary), 0) AS AverageSalary,
       COUNT(*) AS NumberOfEmployees
FROM tb_employees
GROUP BY department;