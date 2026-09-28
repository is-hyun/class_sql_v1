-- 3. 주요 함수 사용

-- 3.1 집계 함수
-- 전체 직원 수와 부서가 정해진 직원 수
SELECT * FROM employees;

SELECT count(*) as 전체, count(department) as 부서있음
FROME employees;

-- 평균 급여, 최고 급여, 최저 급여
SELECT round(AVG(salary), 2) AS 평균,
	max(salary) AS 최고,
    min(salary) AS 최저,
    sum(salary) AS 합계
FROM employees;
